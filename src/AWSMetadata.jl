module AWSMetadata

using ..AWSMetadataUtilities: _get_aws_sdk_js_files, _get_service_and_version,
    _generate_low_level_definitions, _generate_high_level_definitions
using Base64
using GitHub
using HTTP
using JSON
using OrderedCollections: OrderedDict

const metadata_path = joinpath(@__DIR__, "..", "deps", "metadata.json")
const services_path = joinpath(@__DIR__, "AWSServices.jl")

"""
    parse_aws_metadata()

Generate low and high level wrappers for each AWS Service based on their definitions in the
[aws-sdk-js GitHub Repository](https://github.com/aws/aws-sdk-js/tree/master/apis).

Low level wrappers are written into `src/AWSServices.jl`, while high level wrappers API
wrappers are written into their respective files in `src/services/{service}.jl`.
"""
function parse_aws_metadata()
    function _process_service(file::AbstractDict{String, Any}, version::String)
        data_changed = true
        push!(metadata, file["path"] => Dict("version" => version, "sha" => file["sha"]))
        push!(services_modified, file)
    end

    metadata = JSON.parsefile(metadata_path, dicttype=OrderedDict)

    auth = GitHub.authenticate(ENV["GITHUB_AUTH"])
    repo_name = "aws/aws-sdk-js"

    files = _get_aws_sdk_js_files(repo_name, auth)

    data_changed = false
    services_modified = OrderedDict[]

    for file in files
        service_name, version = _get_service_and_version(file["path"])
        filename = file["path"]

        # AWS has released a new service API
        if !haskey(metadata, filename)
            @info "$service_name does not exist in metadata."
            _process_service(file, version)
        else
            # Check if the service API has changed since the last run
            if metadata[filename]["sha"] != file["sha"]
                @info "$service_name sha hashes do not match, updating defintions."
                _process_service(file, version)
            end
        end
    end

    if data_changed
        println(typeof(files))
        _generate_low_level_wrappers(files, repo_name, auth)
        _generate_high_level_wrapper(services_modified, repo_name, auth)
        open(metadata_path, "w") do f
            JSON.print(f, metadata, 2)
        end
    end
end

function _generate_low_level_wrappers(services::AbstractArray, repo_name::String, auth::GitHub.OAuth2)
    service_definitions = sort(_generate_low_level_definitions(services, repo_name, auth))

    template = """
    # This file is auto-generated by AWSMetadata.jl

    module AWSServices

    using AWS
    using OrderedCollections: LittleDict

    $(join(service_definitions, "\n"))

    end
    """

    open(services_path, "w") do f
        print(f, template)
    end

    return template
end

function _generate_high_level_wrapper(services::AbstractArray{<:AbstractDict}, repo_name::String, auth::GitHub.OAuth2)
    for service in services
        service_name = service["path"]
        println("Generating high level wrapper for $service_name")

        service_blob = blob(repo_name, service["sha"]; auth=auth)
        service = JSON.parse(String(base64decode(service_blob.content)))

        service_name = lowercase(service["metadata"]["serviceId"])
        service_name = replace(service_name, ' ' => '_')
        operations = service["operations"]
        shapes = service["shapes"]

        protocol = service["metadata"]["protocol"]

        operations = sort!(_generate_high_level_definitions(service_name, protocol, operations, shapes))

        service_path = joinpath(@__DIR__, "services", "$service_name.jl")
        open(service_path, "w") do f
            println(f, "# This file is auto-generated by AWSMetadata.jl")
            println(f, "using AWS")
            println(f, "using AWS.AWSServices: $service_name")
            println(f, "using AWS.Compat")
            println(f, "using AWS.UUIDs")
            join(f, operations, "\n")
        end
    end
end

end
