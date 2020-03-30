include("../AWSServices.jl")
using .AWSServices: lambda

"""
    GetFunctionConfiguration()

Returns the version-specific settings of a Lambda function or version. The output includes only options that can vary between versions of a function. To modify these settings, use UpdateFunctionConfiguration. To get all of a function's details, including function-level settings, use GetFunction.

Required Parameters
{
  "FunctionName": "The name of the Lambda function, version, or alias.  Name formats     Function name - my-function (name-only), my-function:v1 (with alias).    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "Qualifier": "Specify a version or alias to get details about a published version of the function."
}
"""
GetFunctionConfiguration(args) = lambda("GET", "/2015-03-31/functions/{FunctionName}/configuration", args)

"""
    GetFunctionConcurrency()

Returns details about the reserved concurrency configuration for a function. To set a concurrency limit for a function, use PutFunctionConcurrency.

Required Parameters
{
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - my-function.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}
"""
GetFunctionConcurrency(args) = lambda("GET", "/2019-09-30/functions/{FunctionName}/concurrency", args)

"""
    InvokeAsync()

 For asynchronous function invocation, use Invoke.  Invokes a function asynchronously.

Required Parameters
{
  "InvokeArgs": "The JSON that you want to provide to your Lambda function as input.",
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - my-function.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}
"""
InvokeAsync(args) = lambda("POST", "/2014-11-13/functions/{FunctionName}/invoke-async/", args)

"""
    PutFunctionConcurrency()

Sets the maximum number of simultaneous executions for a function, and reserves capacity for that concurrency level. Concurrency settings apply to the function as a whole, including all published versions and the unpublished version. Reserving concurrency both ensures that your function has capacity to process the specified number of events simultaneously, and prevents it from scaling beyond that level. Use GetFunction to see the current setting for a function. Use GetAccountSettings to see your Regional concurrency limit. You can reserve concurrency for as many functions as you like, as long as you leave at least 100 simultaneous executions unreserved for functions that aren't configured with a per-function limit. For more information, see Managing Concurrency.

Required Parameters
{
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - my-function.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.",
  "ReservedConcurrentExecutions": "The number of simultaneous executions to reserve for the function."
}
"""
PutFunctionConcurrency(args) = lambda("PUT", "/2017-10-31/functions/{FunctionName}/concurrency", args)

"""
    TagResource()

Adds tags to a function.

Required Parameters
{
  "Tags": "A list of tags to apply to the function.",
  "Resource": "The function's Amazon Resource Name (ARN)."
}
"""
TagResource(args) = lambda("POST", "/2017-03-31/tags/{ARN}", args)

"""
    GetLayerVersionByArn()

Returns information about a version of an AWS Lambda layer, with a link to download the layer archive that's valid for 10 minutes.

Required Parameters
{
  "Arn": "The ARN of the layer version."
}
"""
GetLayerVersionByArn(args) = lambda("GET", "/2018-10-31/layers?find=LayerVersion", args)

"""
    ListEventSourceMappings()

Lists event source mappings. Specify an EventSourceArn to only show event source mappings for a single event source.

Optional Parameters
{
  "Marker": "A pagination token returned by a previous call.",
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - MyFunction.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.    Version or Alias ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD.    Partial ARN - 123456789012:function:MyFunction.   The length constraint applies only to the full ARN. If you specify only the function name, it's limited to 64 characters in length.",
  "EventSourceArn": "The Amazon Resource Name (ARN) of the event source.    Amazon Kinesis - The ARN of the data stream or a stream consumer.    Amazon DynamoDB Streams - The ARN of the stream.    Amazon Simple Queue Service - The ARN of the queue.  ",
  "MaxItems": "The maximum number of event source mappings to return."
}
"""
ListEventSourceMappings() = lambda("GET", "/2015-03-31/event-source-mappings/")
ListEventSourceMappings(args) = lambda("GET", "/2015-03-31/event-source-mappings/", args)

"""
    ListLayerVersions()

Lists the versions of an AWS Lambda layer. Versions that have been deleted aren't listed. Specify a runtime identifier to list only versions that indicate that they're compatible with that runtime.

Required Parameters
{
  "LayerName": "The name or Amazon Resource Name (ARN) of the layer."
}

Optional Parameters
{
  "Marker": "A pagination token returned by a previous call.",
  "MaxItems": "The maximum number of versions to return.",
  "CompatibleRuntime": "A runtime identifier. For example, go1.x."
}
"""
ListLayerVersions(args) = lambda("GET", "/2018-10-31/layers/{LayerName}/versions", args)

"""
    DeleteFunction()

Deletes a Lambda function. To delete a specific function version, use the Qualifier parameter. Otherwise, all versions and aliases are deleted. To delete Lambda event source mappings that invoke a function, use DeleteEventSourceMapping. For AWS services and resources that invoke your function directly, delete the trigger in the service where you originally configured it.

Required Parameters
{
  "FunctionName": "The name of the Lambda function or version.  Name formats     Function name - my-function (name-only), my-function:1 (with version).    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "Qualifier": "Specify a version to delete. You can't delete a version that's referenced by an alias."
}
"""
DeleteFunction(args) = lambda("DELETE", "/2015-03-31/functions/{FunctionName}", args)

"""
    CreateEventSourceMapping()

Creates a mapping between an event source and an AWS Lambda function. Lambda reads items from the event source and triggers the function. For details about each event source type, see the following topics.    Using AWS Lambda with Amazon DynamoDB     Using AWS Lambda with Amazon Kinesis     Using AWS Lambda with Amazon SQS    The following error handling options are only available for stream sources (DynamoDB and Kinesis):    BisectBatchOnFunctionError - If the function returns an error, split the batch in two and retry.    DestinationConfig - Send discarded records to an Amazon SQS queue or Amazon SNS topic.    MaximumRecordAgeInSeconds - Discard records older than the specified age.    MaximumRetryAttempts - Discard records after the specified number of retries.    ParallelizationFactor - Process multiple batches from each shard concurrently.  

Required Parameters
{
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - MyFunction.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.    Version or Alias ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD.    Partial ARN - 123456789012:function:MyFunction.   The length constraint applies only to the full ARN. If you specify only the function name, it's limited to 64 characters in length.",
  "EventSourceArn": "The Amazon Resource Name (ARN) of the event source.    Amazon Kinesis - The ARN of the data stream or a stream consumer.    Amazon DynamoDB Streams - The ARN of the stream.    Amazon Simple Queue Service - The ARN of the queue.  "
}

Optional Parameters
{
  "DestinationConfig": "(Streams) An Amazon SQS queue or Amazon SNS topic destination for discarded records.",
  "MaximumRetryAttempts": "(Streams) The maximum number of times to retry when the function returns an error.",
  "BatchSize": "The maximum number of items to retrieve in a single batch.    Amazon Kinesis - Default 100. Max 10,000.    Amazon DynamoDB Streams - Default 100. Max 1,000.    Amazon Simple Queue Service - Default 10. Max 10.  ",
  "StartingPosition": "The position in a stream from which to start reading. Required for Amazon Kinesis and Amazon DynamoDB Streams sources. AT_TIMESTAMP is only supported for Amazon Kinesis streams.",
  "MaximumBatchingWindowInSeconds": "The maximum amount of time to gather records before invoking the function, in seconds.",
  "StartingPositionTimestamp": "With StartingPosition set to AT_TIMESTAMP, the time from which to start reading.",
  "MaximumRecordAgeInSeconds": "(Streams) The maximum age of a record that Lambda sends to a function for processing.",
  "ParallelizationFactor": "(Streams) The number of batches to process from each shard concurrently.",
  "Enabled": "Disables the event source mapping to pause polling and invocation.",
  "BisectBatchOnFunctionError": "(Streams) If the function returns an error, split the batch in two and retry."
}
"""
CreateEventSourceMapping(args) = lambda("POST", "/2015-03-31/event-source-mappings/", args)

"""
    DeleteProvisionedConcurrencyConfig()

Deletes the provisioned concurrency configuration for a function.

Required Parameters
{
  "Qualifier": "The version number or alias name.",
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - my-function.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}
"""
DeleteProvisionedConcurrencyConfig(args) = lambda("DELETE", "/2019-09-30/functions/{FunctionName}/provisioned-concurrency", args)

"""
    GetLayerVersion()

Returns information about a version of an AWS Lambda layer, with a link to download the layer archive that's valid for 10 minutes.

Required Parameters
{
  "VersionNumber": "The version number.",
  "LayerName": "The name or Amazon Resource Name (ARN) of the layer."
}
"""
GetLayerVersion(args) = lambda("GET", "/2018-10-31/layers/{LayerName}/versions/{VersionNumber}", args)

"""
    CreateAlias()

Creates an alias for a Lambda function version. Use aliases to provide clients with a function identifier that you can update to invoke a different version. You can also map an alias to split invocation requests between two versions. Use the RoutingConfig parameter to specify a second version and the percentage of invocation requests that it receives.

Required Parameters
{
  "FunctionVersion": "The function version that the alias invokes.",
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - MyFunction.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.    Partial ARN - 123456789012:function:MyFunction.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.",
  "Name": "The name of the alias."
}

Optional Parameters
{
  "Description": "A description of the alias.",
  "RoutingConfig": "The routing configuration of the alias."
}
"""
CreateAlias(args) = lambda("POST", "/2015-03-31/functions/{FunctionName}/aliases", args)

"""
    CreateFunction()

Creates a Lambda function. To create a function, you need a deployment package and an execution role. The deployment package contains your function code. The execution role grants the function permission to use AWS services, such as Amazon CloudWatch Logs for log streaming and AWS X-Ray for request tracing. When you create a function, Lambda provisions an instance of the function and its supporting resources. If your function connects to a VPC, this process can take a minute or so. During this time, you can't invoke or modify the function. The State, StateReason, and StateReasonCode fields in the response from GetFunctionConfiguration indicate when the function is ready to invoke. For more information, see Function States. A function has an unpublished version, and can have published versions and aliases. The unpublished version changes when you update your function's code and configuration. A published version is a snapshot of your function code and configuration that can't be changed. An alias is a named resource that maps to a version, and can be changed to map to a different version. Use the Publish parameter to create version 1 of your function from its initial configuration. The other parameters let you configure version-specific and function-level settings. You can modify version-specific settings later with UpdateFunctionConfiguration. Function-level settings apply to both the unpublished and published versions of the function, and include tags (TagResource) and per-function concurrency limits (PutFunctionConcurrency). If another account or an AWS service invokes your function, use AddPermission to grant permission by creating a resource-based IAM policy. You can grant permissions at the function level, on a version, or on an alias. To invoke your function directly, use Invoke. To invoke your function in response to events in other AWS services, create an event source mapping (CreateEventSourceMapping), or configure a function trigger in the other service. For more information, see Invoking Functions.

Required Parameters
{
  "Handler": "The name of the method within your code that Lambda calls to execute your function. The format includes the file name. It can also include namespaces and other qualifiers, depending on the runtime. For more information, see Programming Model.",
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - my-function.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.",
  "Code": "The code for the function.",
  "Runtime": "The identifier of the function's runtime.",
  "Role": "The Amazon Resource Name (ARN) of the function's execution role."
}

Optional Parameters
{
  "Environment": "Environment variables that are accessible from function code during execution.",
  "MemorySize": "The amount of memory that your function has access to. Increasing the function's memory also increases its CPU allocation. The default value is 128 MB. The value must be a multiple of 64 MB.",
  "Tags": "A list of tags to apply to the function.",
  "TracingConfig": "Set Mode to Active to sample and trace a subset of incoming requests with AWS X-Ray.",
  "VpcConfig": "For network connectivity to AWS resources in a VPC, specify a list of security groups and subnets in the VPC. When you connect a function to a VPC, it can only access resources and the internet through that VPC. For more information, see VPC Settings.",
  "DeadLetterConfig": "A dead letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing. For more information, see Dead Letter Queues.",
  "Layers": "A list of function layers to add to the function's execution environment. Specify each layer by its ARN, including the version.",
  "Timeout": "The amount of time that Lambda allows a function to run before stopping it. The default is 3 seconds. The maximum allowed value is 900 seconds.",
  "KMSKeyArn": "The ARN of the AWS Key Management Service (AWS KMS) key that's used to encrypt your function's environment variables. If it's not provided, AWS Lambda uses a default service key.",
  "Description": "A description of the function.",
  "Publish": "Set to true to publish the first version of the function during creation."
}
"""
CreateFunction(args) = lambda("POST", "/2015-03-31/functions", args)

"""
    Invoke()

Invokes a Lambda function. You can invoke a function synchronously (and wait for the response), or asynchronously. To invoke a function asynchronously, set InvocationType to Event. For synchronous invocation, details about the function response, including errors, are included in the response body and headers. For either invocation type, you can find more information in the execution log and trace. When an error occurs, your function may be invoked multiple times. Retry behavior varies by error type, client, event source, and invocation type. For example, if you invoke a function asynchronously and it returns an error, Lambda executes the function up to two more times. For more information, see Retry Behavior. For asynchronous invocation, Lambda adds events to a queue before sending them to your function. If your function does not have enough capacity to keep up with the queue, events may be lost. Occasionally, your function may receive the same event multiple times, even if no error occurs. To retain events that were not processed, configure your function with a dead-letter queue. The status code in the API response doesn't reflect function errors. Error codes are reserved for errors that prevent your function from executing, such as permissions errors, limit errors, or issues with your function's code and configuration. For example, Lambda returns TooManyRequestsException if executing the function would cause you to exceed a concurrency limit at either the account level (ConcurrentInvocationLimitExceeded) or function level (ReservedFunctionConcurrentInvocationLimitExceeded). For functions with a long timeout, your client might be disconnected during synchronous invocation while it waits for a response. Configure your HTTP client, SDK, firewall, proxy, or operating system to allow for long connections with timeout or keep-alive settings. This operation requires permission for the lambda:InvokeFunction action.

Required Parameters
{
  "FunctionName": "The name of the Lambda function, version, or alias.  Name formats     Function name - my-function (name-only), my-function:v1 (with alias).    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "ClientContext": "Up to 3583 bytes of base64-encoded data about the invoking client to pass to the function in the context object.",
  "Qualifier": "Specify a version or alias to invoke a published version of the function.",
  "InvocationType": "Choose from the following options.    RequestResponse (default) - Invoke the function synchronously. Keep the connection open until the function returns a response or times out. The API response includes the function response and additional data.    Event - Invoke the function asynchronously. Send events that fail multiple times to the function's dead-letter queue (if it's configured). The API response only includes a status code.    DryRun - Validate parameter values and verify that the user or role has permission to invoke the function.  ",
  "Payload": "The JSON that you want to provide to your Lambda function as input.",
  "LogType": "Set to Tail to include the execution log in the response."
}
"""
Invoke(args) = lambda("POST", "/2015-03-31/functions/{FunctionName}/invocations", args)

"""
    UpdateEventSourceMapping()

Updates an event source mapping. You can change the function that AWS Lambda invokes, or pause invocation and resume later from the same location. The following error handling options are only available for stream sources (DynamoDB and Kinesis):    BisectBatchOnFunctionError - If the function returns an error, split the batch in two and retry.    DestinationConfig - Send discarded records to an Amazon SQS queue or Amazon SNS topic.    MaximumRecordAgeInSeconds - Discard records older than the specified age.    MaximumRetryAttempts - Discard records after the specified number of retries.    ParallelizationFactor - Process multiple batches from each shard concurrently.  

Required Parameters
{
  "UUID": "The identifier of the event source mapping."
}

Optional Parameters
{
  "DestinationConfig": "(Streams) An Amazon SQS queue or Amazon SNS topic destination for discarded records.",
  "MaximumRetryAttempts": "(Streams) The maximum number of times to retry when the function returns an error.",
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - MyFunction.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.    Version or Alias ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD.    Partial ARN - 123456789012:function:MyFunction.   The length constraint applies only to the full ARN. If you specify only the function name, it's limited to 64 characters in length.",
  "BatchSize": "The maximum number of items to retrieve in a single batch.    Amazon Kinesis - Default 100. Max 10,000.    Amazon DynamoDB Streams - Default 100. Max 1,000.    Amazon Simple Queue Service - Default 10. Max 10.  ",
  "MaximumBatchingWindowInSeconds": "The maximum amount of time to gather records before invoking the function, in seconds.",
  "MaximumRecordAgeInSeconds": "(Streams) The maximum age of a record that Lambda sends to a function for processing.",
  "ParallelizationFactor": "(Streams) The number of batches to process from each shard concurrently.",
  "Enabled": "Disables the event source mapping to pause polling and invocation.",
  "BisectBatchOnFunctionError": "(Streams) If the function returns an error, split the batch in two and retry."
}
"""
UpdateEventSourceMapping(args) = lambda("PUT", "/2015-03-31/event-source-mappings/{UUID}", args)

"""
    UntagResource()

Removes tags from a function.

Required Parameters
{
  "Resource": "The function's Amazon Resource Name (ARN).",
  "TagKeys": "A list of tag keys to remove from the function."
}
"""
UntagResource(args) = lambda("DELETE", "/2017-03-31/tags/{ARN}", args)

"""
    ListLayers()

Lists AWS Lambda layers and shows information about the latest version of each. Specify a runtime identifier to list only layers that indicate that they're compatible with that runtime.

Optional Parameters
{
  "Marker": "A pagination token returned by a previous call.",
  "MaxItems": "The maximum number of layers to return.",
  "CompatibleRuntime": "A runtime identifier. For example, go1.x."
}
"""
ListLayers() = lambda("GET", "/2018-10-31/layers")
ListLayers(args) = lambda("GET", "/2018-10-31/layers", args)

"""
    ListFunctionEventInvokeConfigs()

Retrieves a list of configurations for asynchronous invocation for a function. To configure options for asynchronous invocation, use PutFunctionEventInvokeConfig.

Required Parameters
{
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - my-function.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "Marker": "Specify the pagination token that's returned by a previous request to retrieve the next page of results.",
  "MaxItems": "The maximum number of configurations to return."
}
"""
ListFunctionEventInvokeConfigs(args) = lambda("GET", "/2019-09-25/functions/{FunctionName}/event-invoke-config/list", args)

"""
    GetLayerVersionPolicy()

Returns the permission policy for a version of an AWS Lambda layer. For more information, see AddLayerVersionPermission.

Required Parameters
{
  "VersionNumber": "The version number.",
  "LayerName": "The name or Amazon Resource Name (ARN) of the layer."
}
"""
GetLayerVersionPolicy(args) = lambda("GET", "/2018-10-31/layers/{LayerName}/versions/{VersionNumber}/policy", args)

"""
    RemoveLayerVersionPermission()

Removes a statement from the permissions policy for a version of an AWS Lambda layer. For more information, see AddLayerVersionPermission.

Required Parameters
{
  "StatementId": "The identifier that was specified when the statement was added.",
  "VersionNumber": "The version number.",
  "LayerName": "The name or Amazon Resource Name (ARN) of the layer."
}

Optional Parameters
{
  "RevisionId": "Only update the policy if the revision ID matches the ID specified. Use this option to avoid modifying a policy that has changed since you last read it."
}
"""
RemoveLayerVersionPermission(args) = lambda("DELETE", "/2018-10-31/layers/{LayerName}/versions/{VersionNumber}/policy/{StatementId}", args)

"""
    ListProvisionedConcurrencyConfigs()

Retrieves a list of provisioned concurrency configurations for a function.

Required Parameters
{
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - my-function.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "Marker": "Specify the pagination token that's returned by a previous request to retrieve the next page of results.",
  "MaxItems": "Specify a number to limit the number of configurations returned."
}
"""
ListProvisionedConcurrencyConfigs(args) = lambda("GET", "/2019-09-30/functions/{FunctionName}/provisioned-concurrency?List=ALL", args)

"""
    PutFunctionEventInvokeConfig()

Configures options for asynchronous invocation on a function, version, or alias. If a configuration already exists for a function, version, or alias, this operation overwrites it. If you exclude any settings, they are removed. To set one option without affecting existing settings for other options, use PutFunctionEventInvokeConfig. By default, Lambda retries an asynchronous invocation twice if the function returns an error. It retains events in a queue for up to six hours. When an event fails all processing attempts or stays in the asynchronous invocation queue for too long, Lambda discards it. To retain discarded events, configure a dead-letter queue with UpdateFunctionConfiguration. To send an invocation record to a queue, topic, function, or event bus, specify a destination. You can configure separate destinations for successful invocations (on-success) and events that fail all processing attempts (on-failure). You can configure destinations in addition to or instead of a dead-letter queue.

Required Parameters
{
  "FunctionName": "The name of the Lambda function, version, or alias.  Name formats     Function name - my-function (name-only), my-function:v1 (with alias).    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "Qualifier": "A version number or alias name.",
  "MaximumRetryAttempts": "The maximum number of times to retry when the function returns an error.",
  "DestinationConfig": "A destination for events after they have been sent to a function for processing.  Destinations     Function - The Amazon Resource Name (ARN) of a Lambda function.    Queue - The ARN of an SQS queue.    Topic - The ARN of an SNS topic.    Event Bus - The ARN of an Amazon EventBridge event bus.  ",
  "MaximumEventAgeInSeconds": "The maximum age of a request that Lambda sends to a function for processing."
}
"""
PutFunctionEventInvokeConfig(args) = lambda("PUT", "/2019-09-25/functions/{FunctionName}/event-invoke-config", args)

"""
    RemovePermission()

Revokes function-use permission from an AWS service or another account. You can get the ID of the statement from the output of GetPolicy.

Required Parameters
{
  "StatementId": "Statement ID of the permission to remove.",
  "FunctionName": "The name of the Lambda function, version, or alias.  Name formats     Function name - my-function (name-only), my-function:v1 (with alias).    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "Qualifier": "Specify a version or alias to remove permissions from a published version of the function.",
  "RevisionId": "Only update the policy if the revision ID matches the ID that's specified. Use this option to avoid modifying a policy that has changed since you last read it."
}
"""
RemovePermission(args) = lambda("DELETE", "/2015-03-31/functions/{FunctionName}/policy/{StatementId}", args)

"""
    GetFunction()

Returns information about the function or function version, with a link to download the deployment package that's valid for 10 minutes. If you specify a function version, only details that are specific to that version are returned.

Required Parameters
{
  "FunctionName": "The name of the Lambda function, version, or alias.  Name formats     Function name - my-function (name-only), my-function:v1 (with alias).    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "Qualifier": "Specify a version or alias to get details about a published version of the function."
}
"""
GetFunction(args) = lambda("GET", "/2015-03-31/functions/{FunctionName}", args)

"""
    GetProvisionedConcurrencyConfig()

Retrieves the provisioned concurrency configuration for a function's alias or version.

Required Parameters
{
  "Qualifier": "The version number or alias name.",
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - my-function.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}
"""
GetProvisionedConcurrencyConfig(args) = lambda("GET", "/2019-09-30/functions/{FunctionName}/provisioned-concurrency", args)

"""
    GetEventSourceMapping()

Returns details about an event source mapping. You can get the identifier of a mapping from the output of ListEventSourceMappings.

Required Parameters
{
  "UUID": "The identifier of the event source mapping."
}
"""
GetEventSourceMapping(args) = lambda("GET", "/2015-03-31/event-source-mappings/{UUID}", args)

"""
    ListVersionsByFunction()

Returns a list of versions, with the version-specific configuration of each. Lambda returns up to 50 versions per call.

Required Parameters
{
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - MyFunction.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.    Partial ARN - 123456789012:function:MyFunction.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "Marker": "Specify the pagination token that's returned by a previous request to retrieve the next page of results.",
  "MaxItems": "The maximum number of versions to return."
}
"""
ListVersionsByFunction(args) = lambda("GET", "/2015-03-31/functions/{FunctionName}/versions", args)

"""
    UpdateAlias()

Updates the configuration of a Lambda function alias.

Required Parameters
{
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - MyFunction.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.    Partial ARN - 123456789012:function:MyFunction.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.",
  "Name": "The name of the alias."
}

Optional Parameters
{
  "FunctionVersion": "The function version that the alias invokes.",
  "Description": "A description of the alias.",
  "RevisionId": "Only update the alias if the revision ID matches the ID that's specified. Use this option to avoid modifying an alias that has changed since you last read it.",
  "RoutingConfig": "The routing configuration of the alias."
}
"""
UpdateAlias(args) = lambda("PUT", "/2015-03-31/functions/{FunctionName}/aliases/{Name}", args)

"""
    PutProvisionedConcurrencyConfig()

Adds a provisioned concurrency configuration to a function's alias or version.

Required Parameters
{
  "Qualifier": "The version number or alias name.",
  "ProvisionedConcurrentExecutions": "The amount of provisioned concurrency to allocate for the version or alias.",
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - my-function.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}
"""
PutProvisionedConcurrencyConfig(args) = lambda("PUT", "/2019-09-30/functions/{FunctionName}/provisioned-concurrency", args)

"""
    ListAliases()

Returns a list of aliases for a Lambda function.

Required Parameters
{
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - MyFunction.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.    Partial ARN - 123456789012:function:MyFunction.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "FunctionVersion": "Specify a function version to only list aliases that invoke that version.",
  "Marker": "Specify the pagination token that's returned by a previous request to retrieve the next page of results.",
  "MaxItems": "Limit the number of aliases returned."
}
"""
ListAliases(args) = lambda("GET", "/2015-03-31/functions/{FunctionName}/aliases", args)

"""
    GetFunctionEventInvokeConfig()

Retrieves the configuration for asynchronous invocation for a function, version, or alias. To configure options for asynchronous invocation, use PutFunctionEventInvokeConfig.

Required Parameters
{
  "FunctionName": "The name of the Lambda function, version, or alias.  Name formats     Function name - my-function (name-only), my-function:v1 (with alias).    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "Qualifier": "A version number or alias name."
}
"""
GetFunctionEventInvokeConfig(args) = lambda("GET", "/2019-09-25/functions/{FunctionName}/event-invoke-config", args)

"""
    UpdateFunctionEventInvokeConfig()

Updates the configuration for asynchronous invocation for a function, version, or alias. To configure options for asynchronous invocation, use PutFunctionEventInvokeConfig.

Required Parameters
{
  "FunctionName": "The name of the Lambda function, version, or alias.  Name formats     Function name - my-function (name-only), my-function:v1 (with alias).    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "Qualifier": "A version number or alias name.",
  "MaximumRetryAttempts": "The maximum number of times to retry when the function returns an error.",
  "DestinationConfig": "A destination for events after they have been sent to a function for processing.  Destinations     Function - The Amazon Resource Name (ARN) of a Lambda function.    Queue - The ARN of an SQS queue.    Topic - The ARN of an SNS topic.    Event Bus - The ARN of an Amazon EventBridge event bus.  ",
  "MaximumEventAgeInSeconds": "The maximum age of a request that Lambda sends to a function for processing."
}
"""
UpdateFunctionEventInvokeConfig(args) = lambda("POST", "/2019-09-25/functions/{FunctionName}/event-invoke-config", args)

"""
    GetAccountSettings()

Retrieves details about your account's limits and usage in an AWS Region.
"""
GetAccountSettings() = lambda("GET", "/2016-08-19/account-settings/")
GetAccountSettings(args) = lambda("GET", "/2016-08-19/account-settings/", args)

"""
    PublishLayerVersion()

Creates an AWS Lambda layer from a ZIP archive. Each time you call PublishLayerVersion with the same layer name, a new version is created. Add layers to your function with CreateFunction or UpdateFunctionConfiguration.

Required Parameters
{
  "Content": "The function layer archive.",
  "LayerName": "The name or Amazon Resource Name (ARN) of the layer."
}

Optional Parameters
{
  "Description": "The description of the version.",
  "CompatibleRuntimes": "A list of compatible function runtimes. Used for filtering with ListLayers and ListLayerVersions.",
  "LicenseInfo": "The layer's software license. It can be any of the following:   An SPDX license identifier. For example, MIT.   The URL of a license hosted on the internet. For example, https://opensource.org/licenses/MIT.   The full text of the license.  "
}
"""
PublishLayerVersion(args) = lambda("POST", "/2018-10-31/layers/{LayerName}/versions", args)

"""
    PublishVersion()

Creates a version from the current code and configuration of a function. Use versions to create a snapshot of your function code and configuration that doesn't change. AWS Lambda doesn't publish a version if the function's configuration and code haven't changed since the last version. Use UpdateFunctionCode or UpdateFunctionConfiguration to update the function before publishing a version. Clients can invoke versions directly or with an alias. To create an alias, use CreateAlias.

Required Parameters
{
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - MyFunction.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.    Partial ARN - 123456789012:function:MyFunction.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "Description": "A description for the version to override the description in the function configuration.",
  "RevisionId": "Only update the function if the revision ID matches the ID that's specified. Use this option to avoid publishing a version if the function configuration has changed since you last updated it.",
  "CodeSha256": "Only publish a version if the hash value matches the value that's specified. Use this option to avoid publishing a version if the function code has changed since you last updated it. You can get the hash for the version that you uploaded from the output of UpdateFunctionCode."
}
"""
PublishVersion(args) = lambda("POST", "/2015-03-31/functions/{FunctionName}/versions", args)

"""
    GetAlias()

Returns details about a Lambda function alias.

Required Parameters
{
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - MyFunction.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.    Partial ARN - 123456789012:function:MyFunction.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.",
  "Name": "The name of the alias."
}
"""
GetAlias(args) = lambda("GET", "/2015-03-31/functions/{FunctionName}/aliases/{Name}", args)

"""
    DeleteLayerVersion()

Deletes a version of an AWS Lambda layer. Deleted versions can no longer be viewed or added to functions. To avoid breaking functions, a copy of the version remains in Lambda until no functions refer to it.

Required Parameters
{
  "VersionNumber": "The version number.",
  "LayerName": "The name or Amazon Resource Name (ARN) of the layer."
}
"""
DeleteLayerVersion(args) = lambda("DELETE", "/2018-10-31/layers/{LayerName}/versions/{VersionNumber}", args)

"""
    GetPolicy()

Returns the resource-based IAM policy for a function, version, or alias.

Required Parameters
{
  "FunctionName": "The name of the Lambda function, version, or alias.  Name formats     Function name - my-function (name-only), my-function:v1 (with alias).    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "Qualifier": "Specify a version or alias to get the policy for that resource."
}
"""
GetPolicy(args) = lambda("GET", "/2015-03-31/functions/{FunctionName}/policy", args)

"""
    UpdateFunctionCode()

Updates a Lambda function's code. The function's code is locked when you publish a version. You can't modify the code of a published version, only the unpublished version.

Required Parameters
{
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - my-function.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "RevisionId": "Only update the function if the revision ID matches the ID that's specified. Use this option to avoid modifying a function that has changed since you last read it.",
  "Publish": "Set to true to publish a new version of the function after updating the code. This has the same effect as calling PublishVersion separately.",
  "S3ObjectVersion": "For versioned objects, the version of the deployment package object to use.",
  "DryRun": "Set to true to validate the request parameters and access permissions without modifying the function code.",
  "S3Key": "The Amazon S3 key of the deployment package.",
  "ZipFile": "The base64-encoded contents of the deployment package. AWS SDK and AWS CLI clients handle the encoding for you.",
  "S3Bucket": "An Amazon S3 bucket in the same AWS Region as your function. The bucket can be in a different AWS account."
}
"""
UpdateFunctionCode(args) = lambda("PUT", "/2015-03-31/functions/{FunctionName}/code", args)

"""
    DeleteFunctionEventInvokeConfig()

Deletes the configuration for asynchronous invocation for a function, version, or alias. To configure options for asynchronous invocation, use PutFunctionEventInvokeConfig.

Required Parameters
{
  "FunctionName": "The name of the Lambda function, version, or alias.  Name formats     Function name - my-function (name-only), my-function:v1 (with alias).    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "Qualifier": "A version number or alias name."
}
"""
DeleteFunctionEventInvokeConfig(args) = lambda("DELETE", "/2019-09-25/functions/{FunctionName}/event-invoke-config", args)

"""
    UpdateFunctionConfiguration()

Modify the version-specific settings of a Lambda function. When you update a function, Lambda provisions an instance of the function and its supporting resources. If your function connects to a VPC, this process can take a minute. During this time, you can't modify the function, but you can still invoke it. The LastUpdateStatus, LastUpdateStatusReason, and LastUpdateStatusReasonCode fields in the response from GetFunctionConfiguration indicate when the update is complete and the function is processing events with the new configuration. For more information, see Function States. These settings can vary between versions of a function and are locked when you publish a version. You can't modify the configuration of a published version, only the unpublished version. To configure function concurrency, use PutFunctionConcurrency. To grant invoke permissions to an account or AWS service, use AddPermission.

Required Parameters
{
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - my-function.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}

Optional Parameters
{
  "Environment": "Environment variables that are accessible from function code during execution.",
  "MemorySize": "The amount of memory that your function has access to. Increasing the function's memory also increases its CPU allocation. The default value is 128 MB. The value must be a multiple of 64 MB.",
  "TracingConfig": "Set Mode to Active to sample and trace a subset of incoming requests with AWS X-Ray.",
  "VpcConfig": "For network connectivity to AWS resources in a VPC, specify a list of security groups and subnets in the VPC. When you connect a function to a VPC, it can only access resources and the internet through that VPC. For more information, see VPC Settings.",
  "DeadLetterConfig": "A dead letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing. For more information, see Dead Letter Queues.",
  "Runtime": "The identifier of the function's runtime.",
  "Layers": "A list of function layers to add to the function's execution environment. Specify each layer by its ARN, including the version.",
  "Timeout": "The amount of time that Lambda allows a function to run before stopping it. The default is 3 seconds. The maximum allowed value is 900 seconds.",
  "KMSKeyArn": "The ARN of the AWS Key Management Service (AWS KMS) key that's used to encrypt your function's environment variables. If it's not provided, AWS Lambda uses a default service key.",
  "Role": "The Amazon Resource Name (ARN) of the function's execution role.",
  "Handler": "The name of the method within your code that Lambda calls to execute your function. The format includes the file name. It can also include namespaces and other qualifiers, depending on the runtime. For more information, see Programming Model.",
  "Description": "A description of the function.",
  "RevisionId": "Only update the function if the revision ID matches the ID that's specified. Use this option to avoid modifying a function that has changed since you last read it."
}
"""
UpdateFunctionConfiguration(args) = lambda("PUT", "/2015-03-31/functions/{FunctionName}/configuration", args)

"""
    DeleteEventSourceMapping()

Deletes an event source mapping. You can get the identifier of a mapping from the output of ListEventSourceMappings. When you delete an event source mapping, it enters a Deleting state and might not be completely deleted for several seconds.

Required Parameters
{
  "UUID": "The identifier of the event source mapping."
}
"""
DeleteEventSourceMapping(args) = lambda("DELETE", "/2015-03-31/event-source-mappings/{UUID}", args)

"""
    AddLayerVersionPermission()

Adds permissions to the resource-based policy of a version of an AWS Lambda layer. Use this action to grant layer usage permission to other accounts. You can grant permission to a single account, all AWS accounts, or all accounts in an organization. To revoke permission, call RemoveLayerVersionPermission with the statement ID that you specified when you added it.

Required Parameters
{
  "StatementId": "An identifier that distinguishes the policy from others on the same layer version.",
  "VersionNumber": "The version number.",
  "LayerName": "The name or Amazon Resource Name (ARN) of the layer.",
  "Principal": "An account ID, or * to grant permission to all AWS accounts.",
  "Action": "The API action that grants access to the layer. For example, lambda:GetLayerVersion."
}

Optional Parameters
{
  "RevisionId": "Only update the policy if the revision ID matches the ID specified. Use this option to avoid modifying a policy that has changed since you last read it.",
  "OrganizationId": "With the principal set to *, grant permission to all accounts in the specified organization."
}
"""
AddLayerVersionPermission(args) = lambda("POST", "/2018-10-31/layers/{LayerName}/versions/{VersionNumber}/policy", args)

"""
    DeleteAlias()

Deletes a Lambda function alias.

Required Parameters
{
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - MyFunction.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.    Partial ARN - 123456789012:function:MyFunction.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.",
  "Name": "The name of the alias."
}
"""
DeleteAlias(args) = lambda("DELETE", "/2015-03-31/functions/{FunctionName}/aliases/{Name}", args)

"""
    ListTags()

Returns a function's tags. You can also view tags with GetFunction.

Required Parameters
{
  "Resource": "The function's Amazon Resource Name (ARN)."
}
"""
ListTags(args) = lambda("GET", "/2017-03-31/tags/{ARN}", args)

"""
    ListFunctions()

Returns a list of Lambda functions, with the version-specific configuration of each. Lambda returns up to 50 functions per call. Set FunctionVersion to ALL to include all published versions of each function in addition to the unpublished version. To get more information about a function or version, use GetFunction.

Optional Parameters
{
  "FunctionVersion": "Set to ALL to include entries for all published versions of each function.",
  "Marker": "Specify the pagination token that's returned by a previous request to retrieve the next page of results.",
  "MasterRegion": "For Lambda@Edge functions, the AWS Region of the master function. For example, us-east-1 filters the list of functions to only include Lambda@Edge functions replicated from a master function in US East (N. Virginia). If specified, you must set FunctionVersion to ALL.",
  "MaxItems": "The maximum number of functions to return."
}
"""
ListFunctions() = lambda("GET", "/2015-03-31/functions/")
ListFunctions(args) = lambda("GET", "/2015-03-31/functions/", args)

"""
    AddPermission()

Grants an AWS service or another account permission to use a function. You can apply the policy at the function level, or specify a qualifier to restrict access to a single version or alias. If you use a qualifier, the invoker must use the full Amazon Resource Name (ARN) of that version or alias to invoke the function. To grant permission to another account, specify the account ID as the Principal. For AWS services, the principal is a domain-style identifier defined by the service, like s3.amazonaws.com or sns.amazonaws.com. For AWS services, you can also specify the ARN or owning account of the associated resource as the SourceArn or SourceAccount. If you grant permission to a service principal without specifying the source, other accounts could potentially configure resources in their account to invoke your Lambda function. This action adds a statement to a resource-based permissions policy for the function. For more information about function policies, see Lambda Function Policies. 

Required Parameters
{
  "StatementId": "A statement identifier that differentiates the statement from others in the same policy.",
  "FunctionName": "The name of the Lambda function, version, or alias.  Name formats     Function name - my-function (name-only), my-function:v1 (with alias).    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.",
  "Principal": "The AWS service or account that invokes the function. If you specify a service, use SourceArn or SourceAccount to limit who can invoke the function through that service.",
  "Action": "The action that the principal can use on the function. For example, lambda:InvokeFunction or lambda:GetFunction."
}

Optional Parameters
{
  "SourceArn": "For AWS services, the ARN of the AWS resource that invokes the function. For example, an Amazon S3 bucket or Amazon SNS topic.",
  "SourceAccount": "For AWS services, the ID of the account that owns the resource. Use this instead of SourceArn to grant permission to resources that are owned by another account (for example, all of an account's Amazon S3 buckets). Or use it together with SourceArn to ensure that the resource is owned by the specified account. For example, an Amazon S3 bucket could be deleted by its owner and recreated by another account.",
  "Qualifier": "Specify a version or alias to add permissions to a published version of the function.",
  "RevisionId": "Only update the policy if the revision ID matches the ID that's specified. Use this option to avoid modifying a policy that has changed since you last read it.",
  "EventSourceToken": "For Alexa Smart Home functions, a token that must be supplied by the invoker."
}
"""
AddPermission(args) = lambda("POST", "/2015-03-31/functions/{FunctionName}/policy", args)

"""
    DeleteFunctionConcurrency()

Removes a concurrent execution limit from a function.

Required Parameters
{
  "FunctionName": "The name of the Lambda function.  Name formats     Function name - my-function.    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial ARN - 123456789012:function:my-function.   The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length."
}
"""
DeleteFunctionConcurrency(args) = lambda("DELETE", "/2017-10-31/functions/{FunctionName}/concurrency", args)
