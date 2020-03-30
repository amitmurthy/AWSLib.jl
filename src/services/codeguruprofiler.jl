include("../AWSServices.jl")
using .AWSServices: codeguruprofiler

"""
    UpdateProfilingGroup()

Updates a profiling group.

Required Parameters
{
  "profilingGroupName": "The name of the profiling group to update.",
  "agentOrchestrationConfig": ""
}
"""
UpdateProfilingGroup(args) = codeguruprofiler("PUT", "/profilingGroups/{profilingGroupName}", args)

"""
    PostAgentProfile()



Required Parameters
{
  "profilingGroupName": "",
  "agentProfile": "",
  "contentType": ""
}

Optional Parameters
{
  "profileToken": ""
}
"""
PostAgentProfile(args) = codeguruprofiler("POST", "/profilingGroups/{profilingGroupName}/agentProfile", args)

"""
    ListProfilingGroups()

Lists profiling groups.

Optional Parameters
{
  "maxResults": "The maximum number of profiling groups results returned by ListProfilingGroups in paginated output. When this parameter is used, ListProfilingGroups only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another ListProfilingGroups request with the returned nextToken value. ",
  "nextToken": "The nextToken value returned from a previous paginated ListProfilingGroups request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value.   This token should be treated as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes. ",
  "includeDescription": "A Boolean value indicating whether to include a description."
}
"""
ListProfilingGroups() = codeguruprofiler("GET", "/profilingGroups")
ListProfilingGroups(args) = codeguruprofiler("GET", "/profilingGroups", args)

"""
    DeleteProfilingGroup()

Deletes a profiling group.

Required Parameters
{
  "profilingGroupName": "The profiling group name to delete."
}
"""
DeleteProfilingGroup(args) = codeguruprofiler("DELETE", "/profilingGroups/{profilingGroupName}", args)

"""
    CreateProfilingGroup()

Creates a profiling group.

Required Parameters
{
  "profilingGroupName": "The name of the profiling group.",
  "clientToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. This parameter specifies a unique identifier for the new profiling group that helps ensure idempotency."
}

Optional Parameters
{
  "agentOrchestrationConfig": "The agent orchestration configuration."
}
"""
CreateProfilingGroup(args) = codeguruprofiler("POST", "/profilingGroups", args)

"""
    ConfigureAgent()



Required Parameters
{
  "profilingGroupName": ""
}

Optional Parameters
{
  "fleetInstanceId": ""
}
"""
ConfigureAgent(args) = codeguruprofiler("POST", "/profilingGroups/{profilingGroupName}/configureAgent", args)

"""
    ListProfileTimes()

List the start times of the available aggregated profiles of a profiling group for an aggregation period within the specified time range.

Required Parameters
{
  "profilingGroupName": "The name of the profiling group.",
  "startTime": "The start time of the time range from which to list the profiles.",
  "period": "The aggregation period.",
  "endTime": "The end time of the time range from which to list the profiles."
}

Optional Parameters
{
  "maxResults": "The maximum number of profile time results returned by ListProfileTimes in paginated output. When this parameter is used, ListProfileTimes only returns maxResults results in a single page with a nextToken response element. The remaining results of the initial request can be seen by sending another ListProfileTimes request with the returned nextToken value. ",
  "nextToken": "The nextToken value returned from a previous paginated ListProfileTimes request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value.   This token should be treated as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes. ",
  "orderBy": "The order (ascending or descending by start time of the profile) to use when listing profiles. Defaults to TIMESTAMP_DESCENDING. "
}
"""
ListProfileTimes(args) = codeguruprofiler("GET", "/profilingGroups/{profilingGroupName}/profileTimes", args)

"""
    GetProfile()

Gets the aggregated profile of a profiling group for the specified time range. If the requested time range does not align with the available aggregated profiles, it is expanded to attain alignment. If aggregated profiles are available only for part of the period requested, the profile is returned from the earliest available to the latest within the requested time range.  For example, if the requested time range is from 00:00 to 00:20 and the available profiles are from 00:15 to 00:25, the returned profile will be from 00:15 to 00:20.  You must specify exactly two of the following parameters: startTime, period, and endTime. 

Required Parameters
{
  "profilingGroupName": "The name of the profiling group to get."
}

Optional Parameters
{
  "accept": "The format of the profile to return. You can choose application/json or the default application/x-amzn-ion. ",
  "startTime": "The start time of the profile to get. You must specify exactly two of the following parameters: startTime, period, and endTime. ",
  "period": "The period of the profile to get. The time range must be in the past and not longer than one week.  You must specify exactly two of the following parameters: startTime, period, and endTime. ",
  "maxDepth": "The maximum depth of the graph.",
  "endTime": " You must specify exactly two of the following parameters: startTime, period, and endTime. "
}
"""
GetProfile(args) = codeguruprofiler("GET", "/profilingGroups/{profilingGroupName}/profile", args)

"""
    DescribeProfilingGroup()

Describes a profiling group.

Required Parameters
{
  "profilingGroupName": "The profiling group name."
}
"""
DescribeProfilingGroup(args) = codeguruprofiler("GET", "/profilingGroups/{profilingGroupName}", args)
