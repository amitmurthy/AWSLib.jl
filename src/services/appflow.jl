# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: appflow

using Compat
using UUIDs
"""
    CreateConnectorProfile()

 Creates a new connector profile associated with your AWS account. There is a soft quota of 100 connector profiles per AWS account. If you need more connector profiles than this quota allows, you can submit a request to the Amazon AppFlow team through the Amazon AppFlow support channel. 

# Required Parameters
- `connectionMode`:  Indicates the connection mode and specifies whether it is public or private. Private flows use AWS PrivateLink to route data over AWS infrastructure without exposing it to the public internet. 
- `connectorProfileConfig`:  Defines the connector-specific configuration and credentials. 
- `connectorProfileName`:  The name of the connector profile. The name is unique for each ConnectorProfile in your AWS account. 
- `connectorType`:  The type of connector, such as Salesforce, Amplitude, and so on. 

# Optional Parameters
- `kmsArn`:  The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you provide for encryption. This is required if you do not want to use the Amazon AppFlow-managed KMS key. If you don't provide anything here, Amazon AppFlow uses the Amazon AppFlow-managed KMS key. 
"""

create_connector_profile(connectionMode, connectorProfileConfig, connectorProfileName, connectorType; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/create-connector-profile", Dict{String, Any}("connectionMode"=>connectionMode, "connectorProfileConfig"=>connectorProfileConfig, "connectorProfileName"=>connectorProfileName, "connectorType"=>connectorType); aws_config=aws_config)
create_connector_profile(connectionMode, connectorProfileConfig, connectorProfileName, connectorType, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/create-connector-profile", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("connectionMode"=>connectionMode, "connectorProfileConfig"=>connectorProfileConfig, "connectorProfileName"=>connectorProfileName, "connectorType"=>connectorType), args)); aws_config=aws_config)

"""
    CreateFlow()

 Enables your application to create a new flow using Amazon AppFlow. You must create a connector profile before calling this API. Please note that the Request Syntax below shows syntax for multiple destinations, however, you can only transfer data to one item in this list at a time. Amazon AppFlow does not currently support flows to multiple destinations at once. 

# Required Parameters
- `destinationFlowConfigList`:  The configuration that controls how Amazon AppFlow places data in the destination connector. 
- `flowName`:  The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only. 
- `sourceFlowConfig`:  The configuration that controls how Amazon AppFlow retrieves data from the source connector. 
- `tasks`:  A list of tasks that Amazon AppFlow performs while transferring the data in the flow run. 
- `triggerConfig`:  The trigger settings that determine how and when the flow runs. 

# Optional Parameters
- `description`:  A description of the flow you want to create. 
- `kmsArn`:  The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you provide for encryption. This is required if you do not want to use the Amazon AppFlow-managed KMS key. If you don't provide anything here, Amazon AppFlow uses the Amazon AppFlow-managed KMS key. 
- `tags`:  The tags used to organize, track, or control access for your flow. 
"""

create_flow(destinationFlowConfigList, flowName, sourceFlowConfig, tasks, triggerConfig; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/create-flow", Dict{String, Any}("destinationFlowConfigList"=>destinationFlowConfigList, "flowName"=>flowName, "sourceFlowConfig"=>sourceFlowConfig, "tasks"=>tasks, "triggerConfig"=>triggerConfig); aws_config=aws_config)
create_flow(destinationFlowConfigList, flowName, sourceFlowConfig, tasks, triggerConfig, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/create-flow", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("destinationFlowConfigList"=>destinationFlowConfigList, "flowName"=>flowName, "sourceFlowConfig"=>sourceFlowConfig, "tasks"=>tasks, "triggerConfig"=>triggerConfig), args)); aws_config=aws_config)

"""
    DeleteConnectorProfile()

 Enables you to delete an existing connector profile. 

# Required Parameters
- `connectorProfileName`:  The name of the connector profile. The name is unique for each ConnectorProfile in your account. 

# Optional Parameters
- `forceDelete`:  Indicates whether Amazon AppFlow should delete the profile, even if it is currently in use in one or more flows. 
"""

delete_connector_profile(connectorProfileName; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/delete-connector-profile", Dict{String, Any}("connectorProfileName"=>connectorProfileName); aws_config=aws_config)
delete_connector_profile(connectorProfileName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/delete-connector-profile", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("connectorProfileName"=>connectorProfileName), args)); aws_config=aws_config)

"""
    DeleteFlow()

 Enables your application to delete an existing flow. Before deleting the flow, Amazon AppFlow validates the request by checking the flow configuration and status. You can delete flows one at a time. 

# Required Parameters
- `flowName`:  The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only. 

# Optional Parameters
- `forceDelete`:  Indicates whether Amazon AppFlow should delete the flow, even if it is currently in use. 
"""

delete_flow(flowName; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/delete-flow", Dict{String, Any}("flowName"=>flowName); aws_config=aws_config)
delete_flow(flowName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/delete-flow", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("flowName"=>flowName), args)); aws_config=aws_config)

"""
    DescribeConnectorEntity()

 Provides details regarding the entity used with the connector, with a description of the data model for each entity. 

# Required Parameters
- `connectorEntityName`:  The entity name for that connector. 

# Optional Parameters
- `connectorProfileName`:  The name of the connector profile. The name is unique for each ConnectorProfile in the AWS account. 
- `connectorType`:  The type of connector application, such as Salesforce, Amplitude, and so on. 
"""

describe_connector_entity(connectorEntityName; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/describe-connector-entity", Dict{String, Any}("connectorEntityName"=>connectorEntityName); aws_config=aws_config)
describe_connector_entity(connectorEntityName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/describe-connector-entity", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("connectorEntityName"=>connectorEntityName), args)); aws_config=aws_config)

"""
    DescribeConnectorProfiles()

 Returns a list of connector-profile details matching the provided connector-profile names and connector-types. Both input lists are optional, and you can use them to filter the result.  If no names or connector-types are provided, returns all connector profiles in a paginated form. If there is no match, this operation returns an empty list.

# Optional Parameters
- `connectorProfileNames`:  The name of the connector profile. The name is unique for each ConnectorProfile in the AWS account. 
- `connectorType`:  The type of connector, such as Salesforce, Amplitude, and so on. 
- `maxResults`:  Specifies the maximum number of items that should be returned in the result set. The default for maxResults is 20 (for all paginated API operations). 
- `nextToken`:  The pagination token for the next page of data. 
"""

describe_connector_profiles(; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/describe-connector-profiles"; aws_config=aws_config)
describe_connector_profiles(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/describe-connector-profiles", args; aws_config=aws_config)

"""
    DescribeConnectors()

 Describes the connectors vended by Amazon AppFlow for specified connector types. If you don't specify a connector type, this operation describes all connectors vended by Amazon AppFlow. If there are more connectors than can be returned in one page, the response contains a nextToken object, which can be be passed in to the next call to the DescribeConnectors API operation to retrieve the next page. 

# Optional Parameters
- `connectorTypes`:  The type of connector, such as Salesforce, Amplitude, and so on. 
- `nextToken`:  The pagination token for the next page of data. 
"""

describe_connectors(; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/describe-connectors"; aws_config=aws_config)
describe_connectors(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/describe-connectors", args; aws_config=aws_config)

"""
    DescribeFlow()

 Provides a description of the specified flow. 

# Required Parameters
- `flowName`:  The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only. 

"""

describe_flow(flowName; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/describe-flow", Dict{String, Any}("flowName"=>flowName); aws_config=aws_config)
describe_flow(flowName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/describe-flow", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("flowName"=>flowName), args)); aws_config=aws_config)

"""
    DescribeFlowExecutionRecords()

 Fetches the execution history of the flow. 

# Required Parameters
- `flowName`:  The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only. 

# Optional Parameters
- `maxResults`:  Specifies the maximum number of items that should be returned in the result set. The default for maxResults is 20 (for all paginated API operations). 
- `nextToken`:  The pagination token for the next page of data. 
"""

describe_flow_execution_records(flowName; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/describe-flow-execution-records", Dict{String, Any}("flowName"=>flowName); aws_config=aws_config)
describe_flow_execution_records(flowName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/describe-flow-execution-records", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("flowName"=>flowName), args)); aws_config=aws_config)

"""
    ListConnectorEntities()

 Returns the list of available connector entities supported by Amazon AppFlow. For example, you can query Salesforce for Account and Opportunity entities, or query ServiceNow for the Incident entity. 

# Optional Parameters
- `connectorProfileName`:  The name of the connector profile. The name is unique for each ConnectorProfile in the AWS account, and is used to query the downstream connector. 
- `connectorType`:  The type of connector, such as Salesforce, Amplitude, and so on. 
- `entitiesPath`:  This optional parameter is specific to connector implementation. Some connectors support multiple levels or categories of entities. You can find out the list of roots for such providers by sending a request without the entitiesPath parameter. If the connector supports entities at different roots, this initial request returns the list of roots. Otherwise, this request returns all entities supported by the provider. 
"""

list_connector_entities(; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/list-connector-entities"; aws_config=aws_config)
list_connector_entities(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/list-connector-entities", args; aws_config=aws_config)

"""
    ListFlows()

 Lists all of the flows associated with your account. 

# Optional Parameters
- `maxResults`:  Specifies the maximum number of items that should be returned in the result set. 
- `nextToken`:  The pagination token for next page of data. 
"""

list_flows(; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/list-flows"; aws_config=aws_config)
list_flows(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/list-flows", args; aws_config=aws_config)

"""
    ListTagsForResource()

 Retrieves the tags that are associated with a specified flow. 

# Required Parameters
- `resourceArn`:  The Amazon Resource Name (ARN) of the specified flow. 

"""

list_tags_for_resource(resourceArn; aws_config::AWSConfig=global_aws_config()) = appflow("GET", "/tags/$(resourceArn)"; aws_config=aws_config)
list_tags_for_resource(resourceArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = appflow("GET", "/tags/$(resourceArn)", args; aws_config=aws_config)

"""
    StartFlow()

 Activates an existing flow. For on-demand flows, this operation runs the flow immediately. For schedule and event-triggered flows, this operation activates the flow. 

# Required Parameters
- `flowName`:  The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only. 

"""

start_flow(flowName; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/start-flow", Dict{String, Any}("flowName"=>flowName); aws_config=aws_config)
start_flow(flowName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/start-flow", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("flowName"=>flowName), args)); aws_config=aws_config)

"""
    StopFlow()

 Deactivates the existing flow. For on-demand flows, this operation returns an unsupportedOperationException error message. For schedule and event-triggered flows, this operation deactivates the flow. 

# Required Parameters
- `flowName`:  The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only. 

"""

stop_flow(flowName; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/stop-flow", Dict{String, Any}("flowName"=>flowName); aws_config=aws_config)
stop_flow(flowName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/stop-flow", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("flowName"=>flowName), args)); aws_config=aws_config)

"""
    TagResource()

 Applies a tag to the specified flow. 

# Required Parameters
- `resourceArn`:  The Amazon Resource Name (ARN) of the flow that you want to tag. 
- `tags`:  The tags used to organize, track, or control access for your flow. 

"""

tag_resource(resourceArn, tags; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/tags/$(resourceArn)", Dict{String, Any}("tags"=>tags); aws_config=aws_config)
tag_resource(resourceArn, tags, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tags"=>tags), args)); aws_config=aws_config)

"""
    UntagResource()

 Removes a tag from the specified flow. 

# Required Parameters
- `resourceArn`:  The Amazon Resource Name (ARN) of the flow that you want to untag. 
- `tagKeys`:  The tag keys associated with the tag that you want to remove from your flow. 

"""

untag_resource(resourceArn, tagKeys; aws_config::AWSConfig=global_aws_config()) = appflow("DELETE", "/tags/$(resourceArn)", Dict{String, Any}("tagKeys"=>tagKeys); aws_config=aws_config)
untag_resource(resourceArn, tagKeys, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = appflow("DELETE", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), args)); aws_config=aws_config)

"""
    UpdateConnectorProfile()

 Updates a given connector profile associated with your account. 

# Required Parameters
- `connectionMode`:  Indicates the connection mode and if it is public or private. 
- `connectorProfileConfig`:  Defines the connector-specific profile configuration and credentials. 
- `connectorProfileName`:  The name of the connector profile and is unique for each ConnectorProfile in the AWS Account. 

"""

update_connector_profile(connectionMode, connectorProfileConfig, connectorProfileName; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/update-connector-profile", Dict{String, Any}("connectionMode"=>connectionMode, "connectorProfileConfig"=>connectorProfileConfig, "connectorProfileName"=>connectorProfileName); aws_config=aws_config)
update_connector_profile(connectionMode, connectorProfileConfig, connectorProfileName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/update-connector-profile", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("connectionMode"=>connectionMode, "connectorProfileConfig"=>connectorProfileConfig, "connectorProfileName"=>connectorProfileName), args)); aws_config=aws_config)

"""
    UpdateFlow()

 Updates an existing flow. 

# Required Parameters
- `destinationFlowConfigList`:  The configuration that controls how Amazon AppFlow transfers data to the destination connector. 
- `flowName`:  The specified name of the flow. Spaces are not allowed. Use underscores (_) or hyphens (-) only. 
- `tasks`:  A list of tasks that Amazon AppFlow performs while transferring the data in the flow run. 
- `triggerConfig`:  The trigger settings that determine how and when the flow runs. 

# Optional Parameters
- `description`:  A description of the flow. 
- `sourceFlowConfig`: 
"""

update_flow(destinationFlowConfigList, flowName, tasks, triggerConfig; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/update-flow", Dict{String, Any}("destinationFlowConfigList"=>destinationFlowConfigList, "flowName"=>flowName, "tasks"=>tasks, "triggerConfig"=>triggerConfig); aws_config=aws_config)
update_flow(destinationFlowConfigList, flowName, tasks, triggerConfig, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = appflow("POST", "/update-flow", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("destinationFlowConfigList"=>destinationFlowConfigList, "flowName"=>flowName, "tasks"=>tasks, "triggerConfig"=>triggerConfig), args)); aws_config=aws_config)
