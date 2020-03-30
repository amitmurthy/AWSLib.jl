include("../AWSServices.jl")
using .AWSServices: sagemaker_a2i_runtime

"""
    DescribeHumanLoop()

Returns information about the specified human loop.

Required Parameters
{
  "HumanLoopName": "The unique name of the human loop."
}
"""
DescribeHumanLoop(args) = sagemaker_a2i_runtime("GET", "/human-loops/{HumanLoopName}", args)

"""
    ListHumanLoops()

Returns information about human loops, given the specified parameters. If a human loop was deleted, it will not be included.

Required Parameters
{
  "FlowDefinitionArn": "The Amazon Resource Name (ARN) of a flow definition."
}

Optional Parameters
{
  "MaxResults": "The total number of items to return. If the total number of available items is more than the value specified in MaxResults, then a NextToken will be provided in the output that you can use to resume pagination.",
  "NextToken": "A token to resume pagination.",
  "CreationTimeAfter": "(Optional) The timestamp of the date when you want the human loops to begin in ISO 8601 format. For example, 2020-02-24.",
  "SortOrder": "An optional value that specifies whether you want the results sorted in Ascending or Descending order.",
  "CreationTimeBefore": "(Optional) The timestamp of the date before which you want the human loops to begin in ISO 8601 format. For example, 2020-02-24."
}
"""
ListHumanLoops(args) = sagemaker_a2i_runtime("GET", "/human-loops", args)

"""
    StartHumanLoop()

Starts a human loop, provided that at least one activation condition is met.

Required Parameters
{
  "HumanLoopName": "The name of the human loop.",
  "FlowDefinitionArn": "The Amazon Resource Name (ARN) of the flow definition.",
  "HumanLoopInput": "An object containing information about the human loop."
}

Optional Parameters
{
  "DataAttributes": "Attributes of the data specified by the customer."
}
"""
StartHumanLoop(args) = sagemaker_a2i_runtime("POST", "/human-loops", args)

"""
    DeleteHumanLoop()

Deletes the specified human loop for a flow definition.

Required Parameters
{
  "HumanLoopName": "The name of the human loop you want to delete."
}
"""
DeleteHumanLoop(args) = sagemaker_a2i_runtime("DELETE", "/human-loops/{HumanLoopName}", args)

"""
    StopHumanLoop()

Stops the specified human loop.

Required Parameters
{
  "HumanLoopName": "The name of the human loop you want to stop."
}
"""
StopHumanLoop(args) = sagemaker_a2i_runtime("POST", "/human-loops/stop", args)
