# TODO: Include only the fields we care about
struct Response
    response::HTTP.Response
    body::BufferStream
end

function Base.getproperty(r::Response, f::Symbol)
    if f === :headers || f === :status
        getfield(r.response, f)
    else
        getfield(r, f)
    end
end

function mime_type(r::Response)
    # Parse response data according to mimetype...
    mime = HTTP.header(r.response, "Content-Type", "")

    # https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types

    # Reading consumes the buffer so this is unsafe currently
    # if isempty(mime) && read(r.body, 5) == b"<?xml"
    #     "xml"

    # e.g. "application/xml" or "text/xml"
    if occursin(r"/xml", mime)
        MIME(Symbol("application/xml"))
    elseif occursin(r"/x-amz-json-1.[01]$", mime) || endswith(mime, "json")
        MIME(Symbol("application/json"))
    elseif startswith(mime, "text/")
        MIME(Symbol("text/plain"))
    else
        MIME(Symbol("text/plain"))
    end
end


# TODO: Interface isn't perfect. For example "text/plain" completely ignores `T`

Base.parse(::Type{T}, r::Response) where T = parse(T, r, mime_type(r))

function Base.parse(::Type{T}, r::Response, ::MIME"application/xml") where T <: AbstractDict
    xml = parse_xml(String(r.body))
    root = XMLDict.root(xml.x)  # TODO: Why x?
    return xml_dict(root, T)
end

function Base.parse(::Type{T}, r::Response, ::MIME"application/json") where T <: AbstractDict
    return JSON.parse(r.body, dicttype=T)
end

function Base.parse(::Type{T}, r::Response, ::MIME"text/plain") where T <: AbstractDict
    return String(r.body)
end

function legacy(r::Response; response_dict_type::Type, return_headers=false, return_stream=false, return_raw=false, response_stream=nothing)
    # For HEAD request, return headers...
    if r.response.request.method == "HEAD"
        return response_dict_type(r.response.headers)
    end

    # Return response stream if requested...
    if return_stream
        return write(response_stream, read(r.body))
    end

    # Return raw data if requested...
    if return_raw
        content = read(r.body)
        return return_headers ? (content, r.response.headers) : content
    end

    content = parse(response_dict_type, r)
    return return_headers ? (content, r.response.headers) : content
end
