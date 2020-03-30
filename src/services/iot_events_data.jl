include("../AWSServices.jl")
using .AWSServices: iot_events_data

"""
    BatchPutMessage()

Sends a set of messages to the AWS IoT Events system. Each message payload is transformed into the input you specify ("inputName") and ingested into any detectors that monitor that input. If multiple messages are sent, the order in which the messages are processed isn't guaranteed. To guarantee ordering, you must send messages one at a time and wait for a successful response.

Required Parameters
{
  "messages": "The list of messages to send. Each message has the following format: '{ \"messageId\": \"string\", \"inputName\": \"string\", \"payload\": \"string\"}' "
}
"""
BatchPutMessage(args) = iot_events_data("POST", "/inputs/messages", args)

"""
    BatchUpdateDetector()

Updates the state, variable values, and timer settings of one or more detectors (instances) of a specified detector model.

Required Parameters
{
  "detectors": "The list of detectors (instances) to update, along with the values to update."
}
"""
BatchUpdateDetector(args) = iot_events_data("POST", "/detectors", args)

"""
    DescribeDetector()

Returns information about the specified detector (instance).

Required Parameters
{
  "detectorModelName": "The name of the detector model whose detectors (instances) you want information about."
}

Optional Parameters
{
  "keyValue": "A filter used to limit results to detectors (instances) created because of the given key ID."
}
"""
DescribeDetector(args) = iot_events_data("GET", "/detectors/{detectorModelName}/keyValues/", args)

"""
    ListDetectors()

Lists detectors (the instances of a detector model).

Required Parameters
{
  "detectorModelName": "The name of the detector model whose detectors (instances) are listed."
}

Optional Parameters
{
  "maxResults": "The maximum number of results to return at one time.",
  "stateName": "A filter that limits results to those detectors (instances) in the given state.",
  "nextToken": "The token for the next set of results."
}
"""
ListDetectors(args) = iot_events_data("GET", "/detectors/{detectorModelName}", args)
