Base.@kwdef mutable struct Request
    service::String
    api_version::String
    request_method::String

    headers::AbstractDict{String, String}=LittleDict{String, String}()
    content::Union{String, Vector{UInt8}}=""
    resource::String=""
    url::String=""

    http_options::AbstractDict{Symbol,<:Any}=LittleDict{Symbol,String}()
    response_dict_type::Type{<:AbstractDict}=LittleDict
end


"""
    submit_request(aws::AbstractAWSConfig, request::Request)

Submit the request to AWS.

# Arguments
- `aws::AbstractAWSConfig`: AWSConfig containing credentials and other information for fulfilling the request, default value is the global configuration
- `request::Request`: All the information about making a request to AWS

# Returns
- `Response`: A struct containing the response
"""
function submit_request(aws::AbstractAWSConfig, request::Request)
    response = nothing
    TOO_MANY_REQUESTS = 429
    EXPIRED_ERROR_CODES = ["ExpiredToken", "ExpiredTokenException", "RequestExpired"]
    REDIRECT_ERROR_CODES = [301, 302, 303, 304, 305, 307, 308]
    THROTTLING_ERROR_CODES = [
        "Throttling",
        "ThrottlingException",
        "ThrottledException",
        "RequestThrottledException",
        "TooManyRequestsException",
        "ProvisionedThroughputExceededException",
        "LimitExceededException",
        "RequestThrottled",
        "PriorRequestNotComplete"
    ]

    request.headers["User-Agent"] = user_agent[]
    request.headers["Host"] = HTTP.URI(request.url).host

    @repeat 3 try
        credentials(aws) === nothing || sign!(aws, request)

        response = @mock _http_request(request)

        if response.status in REDIRECT_ERROR_CODES && HTTP.header(response, "Location") != ""
            request.url = HTTP.header(response, "Location")
        end
    catch e
        if e isa HTTP.StatusError
            e = AWSException(e)
        end

        @retry if :message in fieldnames(typeof(e)) && occursin("Signature expired", e.message) end

        # Handle ExpiredToken...
        # https://github.com/aws/aws-sdk-go/blob/v1.31.5/aws/request/retryer.go#L98
        @retry if ecode(e) in EXPIRED_ERROR_CODES
            check_credentials(credentials(aws), force_refresh=true)
        end

        # Throttle handling
        # https://github.com/boto/botocore/blob/1.16.17/botocore/data/_retry.json
        # https://docs.aws.amazon.com/general/latest/gr/api-retries.html
        @delay_retry if e isa AWSException &&
            (_http_status(e.cause) == TOO_MANY_REQUESTS || ecode(e) in THROTTLING_ERROR_CODES)
        end

        # Handle BadDigest error and CRC32 check sum failure
        @retry if e isa AWSException && (
            _header(e.cause, "crc32body") == "x-amz-crc32" ||
            ecode(e) in ("BadDigest", "RequestTimeout", "RequestTimeoutException")
        )
        end

        if e isa AWSException && occursin("Missing Authentication Token", e.message) && aws.credentials === nothing
            return throw(NoCredentials("You're attempting to perform a request without credentials set."))
        end
    end

    return response
end


function _http_request(request::Request)
    @repeat 4 try
        http_stack = HTTP.stack(redirect=false, retry=false, aws_authorization=false)

        response_stream = BufferStream()

        r = HTTP.request(
            http_stack,
            request.request_method,
            HTTP.URI(request.url),
            HTTP.mkheaders(request.headers),
            request.content;
            require_ssl_verification=false,
            response_stream=response_stream,
            request.http_options...
        )

        return Response(r, response_stream)
    catch e
        # Base.IOError is needed because HTTP.jl can often have errors that aren't
        # caught and wrapped in an HTTP.IOError
        # https://github.com/JuliaWeb/HTTP.jl/issues/382
        @delay_retry if isa(e, Sockets.DNSError) ||
                        isa(e, HTTP.ParseError) ||
                        isa(e, HTTP.IOError) ||
                        isa(e, Base.IOError) ||
                        (isa(e, HTTP.StatusError) && _http_status(e) >= 500)
        end
    end
end


_http_status(e::HTTP.StatusError) = e.status
_header(e::HTTP.StatusError, k, d="") = HTTP.header(e.response, k, d)
