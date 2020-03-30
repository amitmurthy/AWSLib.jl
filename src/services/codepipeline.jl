include("../AWSServices.jl")
using .AWSServices: codepipeline

"""
    AcknowledgeThirdPartyJob()

Confirms a job worker has received the specified job. Used for partner actions only.

Required Parameters
{
  "jobId": "The unique system-generated ID of the job.",
  "clientToken": "The clientToken portion of the clientId and clientToken pair used to verify that the calling entity is allowed access to the job and its details.",
  "nonce": "A system-generated random number that AWS CodePipeline uses to ensure that the job is being worked on by only one job worker. Get this number from the response to a GetThirdPartyJobDetails request."
}
"""
AcknowledgeThirdPartyJob(args) = codepipeline("AcknowledgeThirdPartyJob", args)

"""
    ListTagsForResource()

Gets the set of key-value pairs (metadata) that are used to manage the resource.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the resource to get tags for."
}

Optional Parameters
{
  "maxResults": "The maximum number of results to return in a single call.",
  "nextToken": "The token that was returned from the previous API call, which would be used to return the next page of the list. The ListTagsforResource call lists all available tags in one call and does not use pagination."
}
"""
ListTagsForResource(args) = codepipeline("ListTagsForResource", args)

"""
    RegisterWebhookWithThirdParty()

Configures a connection between the webhook that was created and the external tool with events to be detected.

Optional Parameters
{
  "webhookName": "The name of an existing webhook created with PutWebhook to register with a supported third party. "
}
"""
RegisterWebhookWithThirdParty() = codepipeline("RegisterWebhookWithThirdParty")
RegisterWebhookWithThirdParty(args) = codepipeline("RegisterWebhookWithThirdParty", args)

"""
    AcknowledgeJob()

Returns information about a specified job and whether that job has been received by the job worker. Used for custom actions only.

Required Parameters
{
  "jobId": "The unique system-generated ID of the job for which you want to confirm receipt.",
  "nonce": "A system-generated random number that AWS CodePipeline uses to ensure that the job is being worked on by only one job worker. Get this number from the response of the PollForJobs request that returned this job."
}
"""
AcknowledgeJob(args) = codepipeline("AcknowledgeJob", args)

"""
    EnableStageTransition()

Enables artifacts in a pipeline to transition to a stage in a pipeline.

Required Parameters
{
  "stageName": "The name of the stage where you want to enable the transition of artifacts, either into the stage (inbound) or from that stage to the next stage (outbound).",
  "transitionType": "Specifies whether artifacts are allowed to enter the stage and be processed by the actions in that stage (inbound) or whether already processed artifacts are allowed to transition to the next stage (outbound).",
  "pipelineName": "The name of the pipeline in which you want to enable the flow of artifacts from one stage to another."
}
"""
EnableStageTransition(args) = codepipeline("EnableStageTransition", args)

"""
    GetPipelineState()

Returns information about the state of a pipeline, including the stages and actions.  Values returned in the revisionId and revisionUrl fields indicate the source revision information, such as the commit ID, for the current state. 

Required Parameters
{
  "name": "The name of the pipeline about which you want to get information."
}
"""
GetPipelineState(args) = codepipeline("GetPipelineState", args)

"""
    CreateCustomActionType()

Creates a new custom action that can be used in all pipelines associated with the AWS account. Only used for custom actions.

Required Parameters
{
  "provider": "The provider of the service used in the custom action, such as AWS CodeDeploy.",
  "outputArtifactDetails": "The details of the output artifact of the action, such as its commit ID.",
  "inputArtifactDetails": "The details of the input artifact for the action, such as its commit ID.",
  "category": "The category of the custom action, such as a build action or a test action.  Although Source and Approval are listed as valid values, they are not currently functional. These values are reserved for future use. ",
  "version": "The version identifier of the custom action."
}

Optional Parameters
{
  "settings": "URLs that provide users information about this custom action.",
  "configurationProperties": "The configuration properties for the custom action.  You can refer to a name in the configuration properties of the custom action within the URL templates by following the format of {Config:name}, as long as the configuration property is both required and not secret. For more information, see Create a Custom Action for a Pipeline. ",
  "tags": "The tags for the custom action."
}
"""
CreateCustomActionType(args) = codepipeline("CreateCustomActionType", args)

"""
    ListActionTypes()

Gets a summary of all AWS CodePipeline action types associated with your account.

Optional Parameters
{
  "actionOwnerFilter": "Filters the list of action types to those created by a specified entity.",
  "nextToken": "An identifier that was returned from the previous list action types call, which can be used to return the next set of action types in the list."
}
"""
ListActionTypes() = codepipeline("ListActionTypes")
ListActionTypes(args) = codepipeline("ListActionTypes", args)

"""
    ListPipelineExecutions()

Gets a summary of the most recent executions for a pipeline.

Required Parameters
{
  "pipelineName": "The name of the pipeline for which you want to get execution summary information."
}

Optional Parameters
{
  "maxResults": "The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned nextToken value. Pipeline history is limited to the most recent 12 months, based on pipeline execution start times. Default value is 100.",
  "nextToken": "The token that was returned from the previous ListPipelineExecutions call, which can be used to return the next set of pipeline executions in the list."
}
"""
ListPipelineExecutions(args) = codepipeline("ListPipelineExecutions", args)

"""
    PutThirdPartyJobFailureResult()

Represents the failure of a third party job as returned to the pipeline by a job worker. Used for partner actions only.

Required Parameters
{
  "jobId": "The ID of the job that failed. This is the same ID returned from PollForThirdPartyJobs.",
  "failureDetails": "Represents information about failure details.",
  "clientToken": "The clientToken portion of the clientId and clientToken pair used to verify that the calling entity is allowed access to the job and its details."
}
"""
PutThirdPartyJobFailureResult(args) = codepipeline("PutThirdPartyJobFailureResult", args)

"""
    CreatePipeline()

Creates a pipeline.  In the pipeline structure, you must include either artifactStore or artifactStores in your pipeline, but you cannot use both. If you create a cross-region action in your pipeline, you must use artifactStores. 

Required Parameters
{
  "pipeline": "Represents the structure of actions and stages to be performed in the pipeline. "
}

Optional Parameters
{
  "tags": "The tags for the pipeline."
}
"""
CreatePipeline(args) = codepipeline("CreatePipeline", args)

"""
    GetPipeline()

Returns the metadata, structure, stages, and actions of a pipeline. Can be used to return the entire structure of a pipeline in JSON format, which can then be modified and used to update the pipeline structure with UpdatePipeline.

Required Parameters
{
  "name": "The name of the pipeline for which you want to get information. Pipeline names must be unique under an AWS user account."
}

Optional Parameters
{
  "version": "The version number of the pipeline. If you do not specify a version, defaults to the current version."
}
"""
GetPipeline(args) = codepipeline("GetPipeline", args)

"""
    RetryStageExecution()

Resumes the pipeline execution by retrying the last failed actions in a stage. You can retry a stage immediately if any of the actions in the stage fail. When you retry, all actions that are still in progress continue working, and failed actions are triggered again.

Required Parameters
{
  "stageName": "The name of the failed stage to be retried.",
  "retryMode": "The scope of the retry attempt. Currently, the only supported value is FAILED_ACTIONS.",
  "pipelineName": "The name of the pipeline that contains the failed stage.",
  "pipelineExecutionId": "The ID of the pipeline execution in the failed stage to be retried. Use the GetPipelineState action to retrieve the current pipelineExecutionId of the failed stage"
}
"""
RetryStageExecution(args) = codepipeline("RetryStageExecution", args)

"""
    DisableStageTransition()

Prevents artifacts in a pipeline from transitioning to the next stage in the pipeline.

Required Parameters
{
  "stageName": "The name of the stage where you want to disable the inbound or outbound transition of artifacts.",
  "transitionType": "Specifies whether artifacts are prevented from transitioning into the stage and being processed by the actions in that stage (inbound), or prevented from transitioning from the stage after they have been processed by the actions in that stage (outbound).",
  "reason": "The reason given to the user that a stage is disabled, such as waiting for manual approval or manual tests. This message is displayed in the pipeline console UI.",
  "pipelineName": "The name of the pipeline in which you want to disable the flow of artifacts from one stage to another."
}
"""
DisableStageTransition(args) = codepipeline("DisableStageTransition", args)

"""
    PutJobFailureResult()

Represents the failure of a job as returned to the pipeline by a job worker. Used for custom actions only.

Required Parameters
{
  "jobId": "The unique system-generated ID of the job that failed. This is the same ID returned from PollForJobs.",
  "failureDetails": "The details about the failure of a job."
}
"""
PutJobFailureResult(args) = codepipeline("PutJobFailureResult", args)

"""
    PutApprovalResult()

Provides the response to a manual approval request to AWS CodePipeline. Valid responses include Approved and Rejected.

Required Parameters
{
  "stageName": "The name of the stage that contains the action.",
  "actionName": "The name of the action for which approval is requested.",
  "token": "The system-generated token used to identify a unique approval request. The token for each open approval request can be obtained using the GetPipelineState action. It is used to validate that the approval request corresponding to this token is still valid.",
  "pipelineName": "The name of the pipeline that contains the action. ",
  "result": "Represents information about the result of the approval request."
}
"""
PutApprovalResult(args) = codepipeline("PutApprovalResult", args)

"""
    StartPipelineExecution()

Starts the specified pipeline. Specifically, it begins processing the latest commit to the source location specified as part of the pipeline.

Required Parameters
{
  "name": "The name of the pipeline to start."
}

Optional Parameters
{
  "clientRequestToken": "The system-generated unique ID used to identify a unique execution request."
}
"""
StartPipelineExecution(args) = codepipeline("StartPipelineExecution", args)

"""
    ListWebhooks()

Gets a listing of all the webhooks in this AWS Region for this account. The output lists all webhooks and includes the webhook URL and ARN and the configuration for each webhook.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned nextToken value.",
  "NextToken": "The token that was returned from the previous ListWebhooks call, which can be used to return the next set of webhooks in the list."
}
"""
ListWebhooks() = codepipeline("ListWebhooks")
ListWebhooks(args) = codepipeline("ListWebhooks", args)

"""
    UpdatePipeline()

Updates a specified pipeline with edits or changes to its structure. Use a JSON file with the pipeline structure and UpdatePipeline to provide the full structure of the pipeline. Updating the pipeline increases the version number of the pipeline by 1.

Required Parameters
{
  "pipeline": "The name of the pipeline to be updated."
}
"""
UpdatePipeline(args) = codepipeline("UpdatePipeline", args)

"""
    DeleteCustomActionType()

Marks a custom action as deleted. PollForJobs for the custom action fails after the action is marked for deletion. Used for custom actions only.  To re-create a custom action after it has been deleted you must use a string in the version field that has never been used before. This string can be an incremented version number, for example. To restore a deleted custom action, use a JSON file that is identical to the deleted action, including the original string in the version field. 

Required Parameters
{
  "provider": "The provider of the service used in the custom action, such as AWS CodeDeploy.",
  "category": "The category of the custom action that you want to delete, such as source or deploy.",
  "version": "The version of the custom action to delete."
}
"""
DeleteCustomActionType(args) = codepipeline("DeleteCustomActionType", args)

"""
    TagResource()

Adds to or modifies the tags of the given resource. Tags are metadata that can be used to manage a resource. 

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the resource you want to add tags to.",
  "tags": "The tags you want to modify or add to the resource."
}
"""
TagResource(args) = codepipeline("TagResource", args)

"""
    UntagResource()

Removes tags from an AWS resource.

Required Parameters
{
  "resourceArn": " The Amazon Resource Name (ARN) of the resource to remove tags from.",
  "tagKeys": "The list of keys for the tags to be removed from the resource."
}
"""
UntagResource(args) = codepipeline("UntagResource", args)

"""
    DeleteWebhook()

Deletes a previously created webhook by name. Deleting the webhook stops AWS CodePipeline from starting a pipeline every time an external event occurs. The API returns successfully when trying to delete a webhook that is already deleted. If a deleted webhook is re-created by calling PutWebhook with the same name, it will have a different URL.

Required Parameters
{
  "name": "The name of the webhook you want to delete."
}
"""
DeleteWebhook(args) = codepipeline("DeleteWebhook", args)

"""
    PutJobSuccessResult()

Represents the success of a job as returned to the pipeline by a job worker. Used for custom actions only.

Required Parameters
{
  "jobId": "The unique system-generated ID of the job that succeeded. This is the same ID returned from PollForJobs."
}

Optional Parameters
{
  "continuationToken": "A token generated by a job worker, such as an AWS CodeDeploy deployment ID, that a successful job provides to identify a custom action in progress. Future jobs use this token to identify the running instance of the action. It can be reused to return more information about the progress of the custom action. When the action is complete, no continuation token should be supplied.",
  "currentRevision": "The ID of the current revision of the artifact successfully worked on by the job.",
  "executionDetails": "The execution details of the successful job, such as the actions taken by the job worker.",
  "outputVariables": "Key-value pairs produced as output by a job worker that can be made available to a downstream action configuration. outputVariables can be included only when there is no continuation token on the request."
}
"""
PutJobSuccessResult(args) = codepipeline("PutJobSuccessResult", args)

"""
    DeregisterWebhookWithThirdParty()

Removes the connection between the webhook that was created by CodePipeline and the external tool with events to be detected. Currently supported only for webhooks that target an action type of GitHub.

Optional Parameters
{
  "webhookName": "The name of the webhook you want to deregister."
}
"""
DeregisterWebhookWithThirdParty() = codepipeline("DeregisterWebhookWithThirdParty")
DeregisterWebhookWithThirdParty(args) = codepipeline("DeregisterWebhookWithThirdParty", args)

"""
    StopPipelineExecution()

Stops the specified pipeline execution. You choose to either stop the pipeline execution by completing in-progress actions without starting subsequent actions, or by abandoning in-progress actions. While completing or abandoning in-progress actions, the pipeline execution is in a Stopping state. After all in-progress actions are completed or abandoned, the pipeline execution is in a Stopped state.

Required Parameters
{
  "pipelineName": "The name of the pipeline to stop.",
  "pipelineExecutionId": "The ID of the pipeline execution to be stopped in the current stage. Use the GetPipelineState action to retrieve the current pipelineExecutionId."
}

Optional Parameters
{
  "abandon": "Use this option to stop the pipeline execution by abandoning, rather than finishing, in-progress actions.  This option can lead to failed or out-of-sequence tasks. ",
  "reason": "Use this option to enter comments, such as the reason the pipeline was stopped."
}
"""
StopPipelineExecution(args) = codepipeline("StopPipelineExecution", args)

"""
    PutWebhook()

Defines a webhook and returns a unique webhook URL generated by CodePipeline. This URL can be supplied to third party source hosting providers to call every time there's a code change. When CodePipeline receives a POST request on this URL, the pipeline defined in the webhook is started as long as the POST request satisfied the authentication and filtering requirements supplied when defining the webhook. RegisterWebhookWithThirdParty and DeregisterWebhookWithThirdParty APIs can be used to automatically configure supported third parties to call the generated webhook URL.

Required Parameters
{
  "webhook": "The detail provided in an input file to create the webhook, such as the webhook name, the pipeline name, and the action name. Give the webhook a unique name that helps you identify it. You might name the webhook after the pipeline and action it targets so that you can easily recognize what it's used for later."
}

Optional Parameters
{
  "tags": "The tags for the webhook."
}
"""
PutWebhook(args) = codepipeline("PutWebhook", args)

"""
    PollForThirdPartyJobs()

Determines whether there are any third party jobs for a job worker to act on. Used for partner actions only.  When this API is called, AWS CodePipeline returns temporary credentials for the S3 bucket used to store artifacts for the pipeline, if the action requires access to that S3 bucket for input or output artifacts. 

Required Parameters
{
  "actionTypeId": "Represents information about an action type."
}

Optional Parameters
{
  "maxBatchSize": "The maximum number of jobs to return in a poll for jobs call."
}
"""
PollForThirdPartyJobs(args) = codepipeline("PollForThirdPartyJobs", args)

"""
    PollForJobs()

Returns information about any jobs for AWS CodePipeline to act on. PollForJobs is valid only for action types with "Custom" in the owner field. If the action type contains "AWS" or "ThirdParty" in the owner field, the PollForJobs action returns an error.  When this API is called, AWS CodePipeline returns temporary credentials for the S3 bucket used to store artifacts for the pipeline, if the action requires access to that S3 bucket for input or output artifacts. This API also returns any secret values defined for the action. 

Required Parameters
{
  "actionTypeId": "Represents information about an action type."
}

Optional Parameters
{
  "queryParam": "A map of property names and values. For an action type with no queryable properties, this value must be null or an empty map. For an action type with a queryable property, you must supply that property as a key in the map. Only jobs whose action configuration matches the mapped value are returned.",
  "maxBatchSize": "The maximum number of jobs to return in a poll for jobs call."
}
"""
PollForJobs(args) = codepipeline("PollForJobs", args)

"""
    GetThirdPartyJobDetails()

Requests the details of a job for a third party action. Used for partner actions only.  When this API is called, AWS CodePipeline returns temporary credentials for the S3 bucket used to store artifacts for the pipeline, if the action requires access to that S3 bucket for input or output artifacts. This API also returns any secret values defined for the action. 

Required Parameters
{
  "jobId": "The unique system-generated ID used for identifying the job.",
  "clientToken": "The clientToken portion of the clientId and clientToken pair used to verify that the calling entity is allowed access to the job and its details."
}
"""
GetThirdPartyJobDetails(args) = codepipeline("GetThirdPartyJobDetails", args)

"""
    PutActionRevision()

Provides information to AWS CodePipeline about new revisions to a source.

Required Parameters
{
  "stageName": "The name of the stage that contains the action that acts on the revision.",
  "actionName": "The name of the action that processes the revision.",
  "pipelineName": "The name of the pipeline that starts processing the revision to the source.",
  "actionRevision": "Represents information about the version (or revision) of an action."
}
"""
PutActionRevision(args) = codepipeline("PutActionRevision", args)

"""
    GetJobDetails()

Returns information about a job. Used for custom actions only.  When this API is called, AWS CodePipeline returns temporary credentials for the S3 bucket used to store artifacts for the pipeline, if the action requires access to that S3 bucket for input or output artifacts. This API also returns any secret values defined for the action. 

Required Parameters
{
  "jobId": "The unique system-generated ID for the job."
}
"""
GetJobDetails(args) = codepipeline("GetJobDetails", args)

"""
    ListActionExecutions()

Lists the action executions that have occurred in a pipeline.

Required Parameters
{
  "pipelineName": " The name of the pipeline for which you want to list action execution history."
}

Optional Parameters
{
  "filter": "Input information used to filter action execution history.",
  "maxResults": "The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned nextToken value. Action execution history is retained for up to 12 months, based on action execution start times. Default value is 100.   Detailed execution history is available for executions run on or after February 21, 2019. ",
  "nextToken": "The token that was returned from the previous ListActionExecutions call, which can be used to return the next set of action executions in the list."
}
"""
ListActionExecutions(args) = codepipeline("ListActionExecutions", args)

"""
    DeletePipeline()

Deletes the specified pipeline.

Required Parameters
{
  "name": "The name of the pipeline to be deleted."
}
"""
DeletePipeline(args) = codepipeline("DeletePipeline", args)

"""
    ListPipelines()

Gets a summary of all of the pipelines associated with your account.

Optional Parameters
{
  "nextToken": "An identifier that was returned from the previous list pipelines call. It can be used to return the next set of pipelines in the list."
}
"""
ListPipelines() = codepipeline("ListPipelines")
ListPipelines(args) = codepipeline("ListPipelines", args)

"""
    PutThirdPartyJobSuccessResult()

Represents the success of a third party job as returned to the pipeline by a job worker. Used for partner actions only.

Required Parameters
{
  "jobId": "The ID of the job that successfully completed. This is the same ID returned from PollForThirdPartyJobs.",
  "clientToken": "The clientToken portion of the clientId and clientToken pair used to verify that the calling entity is allowed access to the job and its details."
}

Optional Parameters
{
  "continuationToken": "A token generated by a job worker, such as an AWS CodeDeploy deployment ID, that a successful job provides to identify a partner action in progress. Future jobs use this token to identify the running instance of the action. It can be reused to return more information about the progress of the partner action. When the action is complete, no continuation token should be supplied.",
  "currentRevision": "Represents information about a current revision.",
  "executionDetails": "The details of the actions taken and results produced on an artifact as it passes through stages in the pipeline. "
}
"""
PutThirdPartyJobSuccessResult(args) = codepipeline("PutThirdPartyJobSuccessResult", args)

"""
    GetPipelineExecution()

Returns information about an execution of a pipeline, including details about artifacts, the pipeline execution ID, and the name, version, and status of the pipeline.

Required Parameters
{
  "pipelineName": "The name of the pipeline about which you want to get execution details.",
  "pipelineExecutionId": "The ID of the pipeline execution about which you want to get execution details."
}
"""
GetPipelineExecution(args) = codepipeline("GetPipelineExecution", args)
