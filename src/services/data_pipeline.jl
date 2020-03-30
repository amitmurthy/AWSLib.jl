include("../AWSServices.jl")
using .AWSServices: data_pipeline

"""
    ActivatePipeline()

Validates the specified pipeline and starts processing pipeline tasks. If the pipeline does not pass validation, activation fails. If you need to pause the pipeline to investigate an issue with a component, such as a data source or script, call DeactivatePipeline. To activate a finished pipeline, modify the end date for the pipeline and then activate it.

Required Parameters
{
  "pipelineId": "The ID of the pipeline."
}

Optional Parameters
{
  "parameterValues": "A list of parameter values to pass to the pipeline at activation.",
  "startTimestamp": "The date and time to resume the pipeline. By default, the pipeline resumes from the last completed execution."
}
"""
ActivatePipeline(args) = data_pipeline("ActivatePipeline", args)

"""
    DeactivatePipeline()

Deactivates the specified running pipeline. The pipeline is set to the DEACTIVATING state until the deactivation process completes. To resume a deactivated pipeline, use ActivatePipeline. By default, the pipeline resumes from the last completed execution. Optionally, you can specify the date and time to resume the pipeline.

Required Parameters
{
  "pipelineId": "The ID of the pipeline."
}

Optional Parameters
{
  "cancelActive": "Indicates whether to cancel any running objects. The default is true, which sets the state of any running objects to CANCELED. If this value is false, the pipeline is deactivated after all running objects finish."
}
"""
DeactivatePipeline(args) = data_pipeline("DeactivatePipeline", args)

"""
    QueryObjects()

Queries the specified pipeline for the names of objects that match the specified set of conditions.

Required Parameters
{
  "sphere": "Indicates whether the query applies to components or instances. The possible values are: COMPONENT, INSTANCE, and ATTEMPT.",
  "pipelineId": "The ID of the pipeline."
}

Optional Parameters
{
  "marker": "The starting point for the results to be returned. For the first call, this value should be empty. As long as there are more results, continue to call QueryObjects with the marker value from the previous call to retrieve the next set of results.",
  "query": "The query that defines the objects to be returned. The Query object can contain a maximum of ten selectors. The conditions in the query are limited to top-level String fields in the object. These filters can be applied to components, instances, and attempts.",
  "limit": "The maximum number of object names that QueryObjects will return in a single call. The default value is 100. "
}
"""
QueryObjects(args) = data_pipeline("QueryObjects", args)

"""
    ReportTaskRunnerHeartbeat()

Task runners call ReportTaskRunnerHeartbeat every 15 minutes to indicate that they are operational. If the AWS Data Pipeline Task Runner is launched on a resource managed by AWS Data Pipeline, the web service can use this call to detect when the task runner application has failed and restart a new instance.

Required Parameters
{
  "taskrunnerId": "The ID of the task runner. This value should be unique across your AWS account. In the case of AWS Data Pipeline Task Runner launched on a resource managed by AWS Data Pipeline, the web service provides a unique identifier when it launches the application. If you have written a custom task runner, you should assign a unique identifier for the task runner."
}

Optional Parameters
{
  "hostname": "The public DNS name of the task runner.",
  "workerGroup": "The type of task the task runner is configured to accept and process. The worker group is set as a field on objects in the pipeline when they are created. You can only specify a single value for workerGroup. There are no wildcard values permitted in workerGroup; the string must be an exact, case-sensitive, match."
}
"""
ReportTaskRunnerHeartbeat(args) = data_pipeline("ReportTaskRunnerHeartbeat", args)

"""
    EvaluateExpression()

Task runners call EvaluateExpression to evaluate a string in the context of the specified object. For example, a task runner can evaluate SQL queries stored in Amazon S3.

Required Parameters
{
  "objectId": "The ID of the object.",
  "expression": "The expression to evaluate.",
  "pipelineId": "The ID of the pipeline."
}
"""
EvaluateExpression(args) = data_pipeline("EvaluateExpression", args)

"""
    PollForTask()

Task runners call PollForTask to receive a task to perform from AWS Data Pipeline. The task runner specifies which tasks it can perform by setting a value for the workerGroup parameter. The task returned can come from any of the pipelines that match the workerGroup value passed in by the task runner and that was launched using the IAM user credentials specified by the task runner. If tasks are ready in the work queue, PollForTask returns a response immediately. If no tasks are available in the queue, PollForTask uses long-polling and holds on to a poll connection for up to a 90 seconds, during which time the first newly scheduled task is handed to the task runner. To accomodate this, set the socket timeout in your task runner to 90 seconds. The task runner should not call PollForTask again on the same workerGroup until it receives a response, and this can take up to 90 seconds. 

Required Parameters
{
  "workerGroup": "The type of task the task runner is configured to accept and process. The worker group is set as a field on objects in the pipeline when they are created. You can only specify a single value for workerGroup in the call to PollForTask. There are no wildcard values permitted in workerGroup; the string must be an exact, case-sensitive, match."
}

Optional Parameters
{
  "hostname": "The public DNS name of the calling task runner.",
  "instanceIdentity": "Identity information for the EC2 instance that is hosting the task runner. You can get this value from the instance using http://169.254.169.254/latest/meta-data/instance-id. For more information, see Instance Metadata in the Amazon Elastic Compute Cloud User Guide. Passing in this value proves that your task runner is running on an EC2 instance, and ensures the proper AWS Data Pipeline service charges are applied to your pipeline."
}
"""
PollForTask(args) = data_pipeline("PollForTask", args)

"""
    ValidatePipelineDefinition()

Validates the specified pipeline definition to ensure that it is well formed and can be run without error.

Required Parameters
{
  "pipelineObjects": "The objects that define the pipeline changes to validate against the pipeline.",
  "pipelineId": "The ID of the pipeline."
}

Optional Parameters
{
  "parameterValues": "The parameter values used with the pipeline.",
  "parameterObjects": "The parameter objects used with the pipeline."
}
"""
ValidatePipelineDefinition(args) = data_pipeline("ValidatePipelineDefinition", args)

"""
    CreatePipeline()

Creates a new, empty pipeline. Use PutPipelineDefinition to populate the pipeline.

Required Parameters
{
  "name": "The name for the pipeline. You can use the same name for multiple pipelines associated with your AWS account, because AWS Data Pipeline assigns each pipeline a unique pipeline identifier.",
  "uniqueId": "A unique identifier. This identifier is not the same as the pipeline identifier assigned by AWS Data Pipeline. You are responsible for defining the format and ensuring the uniqueness of this identifier. You use this parameter to ensure idempotency during repeated calls to CreatePipeline. For example, if the first call to CreatePipeline does not succeed, you can pass in the same unique identifier and pipeline name combination on a subsequent call to CreatePipeline. CreatePipeline ensures that if a pipeline already exists with the same name and unique identifier, a new pipeline is not created. Instead, you'll receive the pipeline identifier from the previous attempt. The uniqueness of the name and unique identifier combination is scoped to the AWS account or IAM user credentials."
}

Optional Parameters
{
  "tags": "A list of tags to associate with the pipeline at creation. Tags let you control access to pipelines. For more information, see Controlling User Access to Pipelines in the AWS Data Pipeline Developer Guide.",
  "description": "The description for the pipeline."
}
"""
CreatePipeline(args) = data_pipeline("CreatePipeline", args)

"""
    DescribeObjects()

Gets the object definitions for a set of objects associated with the pipeline. Object definitions are composed of a set of fields that define the properties of the object.

Required Parameters
{
  "objectIds": "The IDs of the pipeline objects that contain the definitions to be described. You can pass as many as 25 identifiers in a single call to DescribeObjects.",
  "pipelineId": "The ID of the pipeline that contains the object definitions."
}

Optional Parameters
{
  "marker": "The starting point for the results to be returned. For the first call, this value should be empty. As long as there are more results, continue to call DescribeObjects with the marker value from the previous call to retrieve the next set of results.",
  "evaluateExpressions": "Indicates whether any expressions in the object should be evaluated when the object descriptions are returned."
}
"""
DescribeObjects(args) = data_pipeline("DescribeObjects", args)

"""
    RemoveTags()

Removes existing tags from the specified pipeline.

Required Parameters
{
  "tagKeys": "The keys of the tags to remove.",
  "pipelineId": "The ID of the pipeline."
}
"""
RemoveTags(args) = data_pipeline("RemoveTags", args)

"""
    GetPipelineDefinition()

Gets the definition of the specified pipeline. You can call GetPipelineDefinition to retrieve the pipeline definition that you provided using PutPipelineDefinition.

Required Parameters
{
  "pipelineId": "The ID of the pipeline."
}

Optional Parameters
{
  "version": "The version of the pipeline definition to retrieve. Set this parameter to latest (default) to use the last definition saved to the pipeline or active to use the last definition that was activated."
}
"""
GetPipelineDefinition(args) = data_pipeline("GetPipelineDefinition", args)

"""
    ReportTaskProgress()

Task runners call ReportTaskProgress when assigned a task to acknowledge that it has the task. If the web service does not receive this acknowledgement within 2 minutes, it assigns the task in a subsequent PollForTask call. After this initial acknowledgement, the task runner only needs to report progress every 15 minutes to maintain its ownership of the task. You can change this reporting time from 15 minutes by specifying a reportProgressTimeout field in your pipeline. If a task runner does not report its status after 5 minutes, AWS Data Pipeline assumes that the task runner is unable to process the task and reassigns the task in a subsequent response to PollForTask. Task runners should call ReportTaskProgress every 60 seconds.

Required Parameters
{
  "taskId": "The ID of the task assigned to the task runner. This value is provided in the response for PollForTask."
}

Optional Parameters
{
  "fields": "Key-value pairs that define the properties of the ReportTaskProgressInput object."
}
"""
ReportTaskProgress(args) = data_pipeline("ReportTaskProgress", args)

"""
    PutPipelineDefinition()

Adds tasks, schedules, and preconditions to the specified pipeline. You can use PutPipelineDefinition to populate a new pipeline.  PutPipelineDefinition also validates the configuration as it adds it to the pipeline. Changes to the pipeline are saved unless one of the following three validation errors exists in the pipeline.   An object is missing a name or identifier field. A string or reference field is empty. The number of objects in the pipeline exceeds the maximum allowed objects. The pipeline is in a FINISHED state.   Pipeline object definitions are passed to the PutPipelineDefinition action and returned by the GetPipelineDefinition action. 

Required Parameters
{
  "pipelineObjects": "The objects that define the pipeline. These objects overwrite the existing pipeline definition.",
  "pipelineId": "The ID of the pipeline."
}

Optional Parameters
{
  "parameterValues": "The parameter values used with the pipeline.",
  "parameterObjects": "The parameter objects used with the pipeline."
}
"""
PutPipelineDefinition(args) = data_pipeline("PutPipelineDefinition", args)

"""
    SetStatus()

Requests that the status of the specified physical or logical pipeline objects be updated in the specified pipeline. This update might not occur immediately, but is eventually consistent. The status that can be set depends on the type of object (for example, DataNode or Activity). You cannot perform this operation on FINISHED pipelines and attempting to do so returns InvalidRequestException.

Required Parameters
{
  "status": "The status to be set on all the objects specified in objectIds. For components, use PAUSE or RESUME. For instances, use TRY_CANCEL, RERUN, or MARK_FINISHED.",
  "objectIds": "The IDs of the objects. The corresponding objects can be either physical or components, but not a mix of both types.",
  "pipelineId": "The ID of the pipeline that contains the objects."
}
"""
SetStatus(args) = data_pipeline("SetStatus", args)

"""
    DescribePipelines()

Retrieves metadata about one or more pipelines. The information retrieved includes the name of the pipeline, the pipeline identifier, its current state, and the user account that owns the pipeline. Using account credentials, you can retrieve metadata about pipelines that you or your IAM users have created. If you are using an IAM user account, you can retrieve metadata about only those pipelines for which you have read permissions. To retrieve the full pipeline definition instead of metadata about the pipeline, call GetPipelineDefinition.

Required Parameters
{
  "pipelineIds": "The IDs of the pipelines to describe. You can pass as many as 25 identifiers in a single call. To obtain pipeline IDs, call ListPipelines."
}
"""
DescribePipelines(args) = data_pipeline("DescribePipelines", args)

"""
    SetTaskStatus()

Task runners call SetTaskStatus to notify AWS Data Pipeline that a task is completed and provide information about the final status. A task runner makes this call regardless of whether the task was sucessful. A task runner does not need to call SetTaskStatus for tasks that are canceled by the web service during a call to ReportTaskProgress.

Required Parameters
{
  "taskStatus": "If FINISHED, the task successfully completed. If FAILED, the task ended unsuccessfully. Preconditions use false.",
  "taskId": "The ID of the task assigned to the task runner. This value is provided in the response for PollForTask."
}

Optional Parameters
{
  "errorId": "If an error occurred during the task, this value specifies the error code. This value is set on the physical attempt object. It is used to display error information to the user. It should not start with string \"Service_\" which is reserved by the system.",
  "errorStackTrace": "If an error occurred during the task, this value specifies the stack trace associated with the error. This value is set on the physical attempt object. It is used to display error information to the user. The web service does not parse this value.",
  "errorMessage": "If an error occurred during the task, this value specifies a text description of the error. This value is set on the physical attempt object. It is used to display error information to the user. The web service does not parse this value."
}
"""
SetTaskStatus(args) = data_pipeline("SetTaskStatus", args)

"""
    AddTags()

Adds or modifies tags for the specified pipeline.

Required Parameters
{
  "tags": "The tags to add, as key/value pairs.",
  "pipelineId": "The ID of the pipeline."
}
"""
AddTags(args) = data_pipeline("AddTags", args)

"""
    DeletePipeline()

Deletes a pipeline, its pipeline definition, and its run history. AWS Data Pipeline attempts to cancel instances associated with the pipeline that are currently being processed by task runners. Deleting a pipeline cannot be undone. You cannot query or restore a deleted pipeline. To temporarily pause a pipeline instead of deleting it, call SetStatus with the status set to PAUSE on individual components. Components that are paused by SetStatus can be resumed.

Required Parameters
{
  "pipelineId": "The ID of the pipeline."
}
"""
DeletePipeline(args) = data_pipeline("DeletePipeline", args)

"""
    ListPipelines()

Lists the pipeline identifiers for all active pipelines that you have permission to access.

Optional Parameters
{
  "marker": "The starting point for the results to be returned. For the first call, this value should be empty. As long as there are more results, continue to call ListPipelines with the marker value from the previous call to retrieve the next set of results."
}
"""
ListPipelines() = data_pipeline("ListPipelines")
ListPipelines(args) = data_pipeline("ListPipelines", args)
