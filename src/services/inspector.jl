include("../AWSServices.jl")
using .AWSServices: inspector

"""
    ListTagsForResource()

Lists all tags associated with an assessment template.

Required Parameters
{
  "resourceArn": "The ARN that specifies the assessment template whose tags you want to list."
}
"""
ListTagsForResource(args) = inspector("ListTagsForResource", args)

"""
    DescribeAssessmentTargets()

Describes the assessment targets that are specified by the ARNs of the assessment targets.

Required Parameters
{
  "assessmentTargetArns": "The ARNs that specifies the assessment targets that you want to describe."
}
"""
DescribeAssessmentTargets(args) = inspector("DescribeAssessmentTargets", args)

"""
    ListExclusions()

List exclusions that are generated by the assessment run.

Required Parameters
{
  "assessmentRunArn": "The ARN of the assessment run that generated the exclusions that you want to list."
}

Optional Parameters
{
  "maxResults": "You can use this parameter to indicate the maximum number of items you want in the response. The default value is 100. The maximum value is 500.",
  "nextToken": "You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the ListExclusionsRequest action. Subsequent calls to the action fill nextToken in the request with the value of nextToken from the previous response to continue listing data."
}
"""
ListExclusions(args) = inspector("ListExclusions", args)

"""
    ListAssessmentRunAgents()

Lists the agents of the assessment runs that are specified by the ARNs of the assessment runs.

Required Parameters
{
  "assessmentRunArn": "The ARN that specifies the assessment run whose agents you want to list."
}

Optional Parameters
{
  "filter": "You can use this parameter to specify a subset of data to be included in the action's response. For a record to match a filter, all specified filter attributes must match. When multiple values are specified for a filter attribute, any of the values can match.",
  "maxResults": "You can use this parameter to indicate the maximum number of items that you want in the response. The default value is 10. The maximum value is 500.",
  "nextToken": "You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the ListAssessmentRunAgents action. Subsequent calls to the action fill nextToken in the request with the value of NextToken from the previous response to continue listing data."
}
"""
ListAssessmentRunAgents(args) = inspector("ListAssessmentRunAgents", args)

"""
    ListAssessmentTemplates()

Lists the assessment templates that correspond to the assessment targets that are specified by the ARNs of the assessment targets.

Optional Parameters
{
  "assessmentTargetArns": "A list of ARNs that specifies the assessment targets whose assessment templates you want to list.",
  "filter": "You can use this parameter to specify a subset of data to be included in the action's response. For a record to match a filter, all specified filter attributes must match. When multiple values are specified for a filter attribute, any of the values can match.",
  "maxResults": "You can use this parameter to indicate the maximum number of items you want in the response. The default value is 10. The maximum value is 500.",
  "nextToken": "You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the ListAssessmentTemplates action. Subsequent calls to the action fill nextToken in the request with the value of NextToken from the previous response to continue listing data."
}
"""
ListAssessmentTemplates() = inspector("ListAssessmentTemplates")
ListAssessmentTemplates(args) = inspector("ListAssessmentTemplates", args)

"""
    AddAttributesToFindings()

Assigns attributes (key and value pairs) to the findings that are specified by the ARNs of the findings.

Required Parameters
{
  "attributes": "The array of attributes that you want to assign to specified findings.",
  "findingArns": "The ARNs that specify the findings that you want to assign attributes to."
}
"""
AddAttributesToFindings(args) = inspector("AddAttributesToFindings", args)

"""
    DescribeAssessmentRuns()

Describes the assessment runs that are specified by the ARNs of the assessment runs.

Required Parameters
{
  "assessmentRunArns": "The ARN that specifies the assessment run that you want to describe."
}
"""
DescribeAssessmentRuns(args) = inspector("DescribeAssessmentRuns", args)

"""
    ListFindings()

Lists findings that are generated by the assessment runs that are specified by the ARNs of the assessment runs.

Optional Parameters
{
  "assessmentRunArns": "The ARNs of the assessment runs that generate the findings that you want to list.",
  "filter": "You can use this parameter to specify a subset of data to be included in the action's response. For a record to match a filter, all specified filter attributes must match. When multiple values are specified for a filter attribute, any of the values can match.",
  "maxResults": "You can use this parameter to indicate the maximum number of items you want in the response. The default value is 10. The maximum value is 500.",
  "nextToken": "You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the ListFindings action. Subsequent calls to the action fill nextToken in the request with the value of NextToken from the previous response to continue listing data."
}
"""
ListFindings() = inspector("ListFindings")
ListFindings(args) = inspector("ListFindings", args)

"""
    CreateAssessmentTemplate()

Creates an assessment template for the assessment target that is specified by the ARN of the assessment target. If the service-linked role isn’t already registered, this action also creates and registers a service-linked role to grant Amazon Inspector access to AWS Services needed to perform security assessments.

Required Parameters
{
  "rulesPackageArns": "The ARNs that specify the rules packages that you want to attach to the assessment template.",
  "durationInSeconds": "The duration of the assessment run in seconds.",
  "assessmentTemplateName": "The user-defined name that identifies the assessment template that you want to create. You can create several assessment templates for an assessment target. The names of the assessment templates that correspond to a particular assessment target must be unique.",
  "assessmentTargetArn": "The ARN that specifies the assessment target for which you want to create the assessment template."
}

Optional Parameters
{
  "userAttributesForFindings": "The user-defined attributes that are assigned to every finding that is generated by the assessment run that uses this assessment template. An attribute is a key and value pair (an Attribute object). Within an assessment template, each key must be unique."
}
"""
CreateAssessmentTemplate(args) = inspector("CreateAssessmentTemplate", args)

"""
    ListAssessmentRuns()

Lists the assessment runs that correspond to the assessment templates that are specified by the ARNs of the assessment templates.

Optional Parameters
{
  "assessmentTemplateArns": "The ARNs that specify the assessment templates whose assessment runs you want to list.",
  "filter": "You can use this parameter to specify a subset of data to be included in the action's response. For a record to match a filter, all specified filter attributes must match. When multiple values are specified for a filter attribute, any of the values can match.",
  "maxResults": "You can use this parameter to indicate the maximum number of items that you want in the response. The default value is 10. The maximum value is 500.",
  "nextToken": "You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the ListAssessmentRuns action. Subsequent calls to the action fill nextToken in the request with the value of NextToken from the previous response to continue listing data."
}
"""
ListAssessmentRuns() = inspector("ListAssessmentRuns")
ListAssessmentRuns(args) = inspector("ListAssessmentRuns", args)

"""
    RemoveAttributesFromFindings()

Removes entire attributes (key and value pairs) from the findings that are specified by the ARNs of the findings where an attribute with the specified key exists.

Required Parameters
{
  "attributeKeys": "The array of attribute keys that you want to remove from specified findings.",
  "findingArns": "The ARNs that specify the findings that you want to remove attributes from."
}
"""
RemoveAttributesFromFindings(args) = inspector("RemoveAttributesFromFindings", args)

"""
    SetTagsForResource()

Sets tags (key and value pairs) to the assessment template that is specified by the ARN of the assessment template.

Required Parameters
{
  "resourceArn": "The ARN of the assessment template that you want to set tags to."
}

Optional Parameters
{
  "tags": "A collection of key and value pairs that you want to set to the assessment template."
}
"""
SetTagsForResource(args) = inspector("SetTagsForResource", args)

"""
    DescribeRulesPackages()

Describes the rules packages that are specified by the ARNs of the rules packages.

Required Parameters
{
  "rulesPackageArns": "The ARN that specifies the rules package that you want to describe."
}

Optional Parameters
{
  "locale": "The locale that you want to translate a rules package description into."
}
"""
DescribeRulesPackages(args) = inspector("DescribeRulesPackages", args)

"""
    GetAssessmentReport()

Produces an assessment report that includes detailed and comprehensive results of a specified assessment run. 

Required Parameters
{
  "reportFileFormat": "Specifies the file format (html or pdf) of the assessment report that you want to generate.",
  "assessmentRunArn": "The ARN that specifies the assessment run for which you want to generate a report.",
  "reportType": "Specifies the type of the assessment report that you want to generate. There are two types of assessment reports: a finding report and a full report. For more information, see Assessment Reports. "
}
"""
GetAssessmentReport(args) = inspector("GetAssessmentReport", args)

"""
    ListAssessmentTargets()

Lists the ARNs of the assessment targets within this AWS account. For more information about assessment targets, see Amazon Inspector Assessment Targets.

Optional Parameters
{
  "filter": "You can use this parameter to specify a subset of data to be included in the action's response. For a record to match a filter, all specified filter attributes must match. When multiple values are specified for a filter attribute, any of the values can match.",
  "maxResults": "You can use this parameter to indicate the maximum number of items you want in the response. The default value is 10. The maximum value is 500.",
  "nextToken": "You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the ListAssessmentTargets action. Subsequent calls to the action fill nextToken in the request with the value of NextToken from the previous response to continue listing data."
}
"""
ListAssessmentTargets() = inspector("ListAssessmentTargets")
ListAssessmentTargets(args) = inspector("ListAssessmentTargets", args)

"""
    GetExclusionsPreview()

Retrieves the exclusions preview (a list of ExclusionPreview objects) specified by the preview token. You can obtain the preview token by running the CreateExclusionsPreview API.

Required Parameters
{
  "previewToken": "The unique identifier associated of the exclusions preview.",
  "assessmentTemplateArn": "The ARN that specifies the assessment template for which the exclusions preview was requested."
}

Optional Parameters
{
  "locale": "The locale into which you want to translate the exclusion's title, description, and recommendation.",
  "maxResults": "You can use this parameter to indicate the maximum number of items you want in the response. The default value is 100. The maximum value is 500.",
  "nextToken": "You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the GetExclusionsPreviewRequest action. Subsequent calls to the action fill nextToken in the request with the value of nextToken from the previous response to continue listing data."
}
"""
GetExclusionsPreview(args) = inspector("GetExclusionsPreview", args)

"""
    ListEventSubscriptions()

Lists all the event subscriptions for the assessment template that is specified by the ARN of the assessment template. For more information, see SubscribeToEvent and UnsubscribeFromEvent.

Optional Parameters
{
  "resourceArn": "The ARN of the assessment template for which you want to list the existing event subscriptions.",
  "maxResults": "You can use this parameter to indicate the maximum number of items you want in the response. The default value is 10. The maximum value is 500.",
  "nextToken": "You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the ListEventSubscriptions action. Subsequent calls to the action fill nextToken in the request with the value of NextToken from the previous response to continue listing data."
}
"""
ListEventSubscriptions() = inspector("ListEventSubscriptions")
ListEventSubscriptions(args) = inspector("ListEventSubscriptions", args)

"""
    ListRulesPackages()

Lists all available Amazon Inspector rules packages.

Optional Parameters
{
  "maxResults": "You can use this parameter to indicate the maximum number of items you want in the response. The default value is 10. The maximum value is 500.",
  "nextToken": "You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the ListRulesPackages action. Subsequent calls to the action fill nextToken in the request with the value of NextToken from the previous response to continue listing data."
}
"""
ListRulesPackages() = inspector("ListRulesPackages")
ListRulesPackages(args) = inspector("ListRulesPackages", args)

"""
    StartAssessmentRun()

Starts the assessment run specified by the ARN of the assessment template. For this API to function properly, you must not exceed the limit of running up to 500 concurrent agents per AWS account.

Required Parameters
{
  "assessmentTemplateArn": "The ARN of the assessment template of the assessment run that you want to start."
}

Optional Parameters
{
  "assessmentRunName": "You can specify the name for the assessment run. The name must be unique for the assessment template whose ARN is used to start the assessment run."
}
"""
StartAssessmentRun(args) = inspector("StartAssessmentRun", args)

"""
    CreateResourceGroup()

Creates a resource group using the specified set of tags (key and value pairs) that are used to select the EC2 instances to be included in an Amazon Inspector assessment target. The created resource group is then used to create an Amazon Inspector assessment target. For more information, see CreateAssessmentTarget.

Required Parameters
{
  "resourceGroupTags": "A collection of keys and an array of possible values, '[{\"key\":\"key1\",\"values\":[\"Value1\",\"Value2\"]},{\"key\":\"Key2\",\"values\":[\"Value3\"]}]'. For example,'[{\"key\":\"Name\",\"values\":[\"TestEC2Instance\"]}]'."
}
"""
CreateResourceGroup(args) = inspector("CreateResourceGroup", args)

"""
    GetTelemetryMetadata()

Information about the data that is collected for the specified assessment run.

Required Parameters
{
  "assessmentRunArn": "The ARN that specifies the assessment run that has the telemetry data that you want to obtain."
}
"""
GetTelemetryMetadata(args) = inspector("GetTelemetryMetadata", args)

"""
    UpdateAssessmentTarget()

Updates the assessment target that is specified by the ARN of the assessment target. If resourceGroupArn is not specified, all EC2 instances in the current AWS account and region are included in the assessment target.

Required Parameters
{
  "assessmentTargetName": "The name of the assessment target that you want to update.",
  "assessmentTargetArn": "The ARN of the assessment target that you want to update."
}

Optional Parameters
{
  "resourceGroupArn": "The ARN of the resource group that is used to specify the new resource group to associate with the assessment target."
}
"""
UpdateAssessmentTarget(args) = inspector("UpdateAssessmentTarget", args)

"""
    DescribeResourceGroups()

Describes the resource groups that are specified by the ARNs of the resource groups.

Required Parameters
{
  "resourceGroupArns": "The ARN that specifies the resource group that you want to describe."
}
"""
DescribeResourceGroups(args) = inspector("DescribeResourceGroups", args)

"""
    UnsubscribeFromEvent()

Disables the process of sending Amazon Simple Notification Service (SNS) notifications about a specified event to a specified SNS topic.

Required Parameters
{
  "event": "The event for which you want to stop receiving SNS notifications.",
  "resourceArn": "The ARN of the assessment template that is used during the event for which you want to stop receiving SNS notifications.",
  "topicArn": "The ARN of the SNS topic to which SNS notifications are sent."
}
"""
UnsubscribeFromEvent(args) = inspector("UnsubscribeFromEvent", args)

"""
    DeleteAssessmentRun()

Deletes the assessment run that is specified by the ARN of the assessment run.

Required Parameters
{
  "assessmentRunArn": "The ARN that specifies the assessment run that you want to delete."
}
"""
DeleteAssessmentRun(args) = inspector("DeleteAssessmentRun", args)

"""
    StopAssessmentRun()

Stops the assessment run that is specified by the ARN of the assessment run.

Required Parameters
{
  "assessmentRunArn": "The ARN of the assessment run that you want to stop."
}

Optional Parameters
{
  "stopAction": "An input option that can be set to either START_EVALUATION or SKIP_EVALUATION. START_EVALUATION (the default value), stops the AWS agent from collecting data and begins the results evaluation and the findings generation process. SKIP_EVALUATION cancels the assessment run immediately, after which no findings are generated."
}
"""
StopAssessmentRun(args) = inspector("StopAssessmentRun", args)

"""
    CreateAssessmentTarget()

Creates a new assessment target using the ARN of the resource group that is generated by CreateResourceGroup. If resourceGroupArn is not specified, all EC2 instances in the current AWS account and region are included in the assessment target. If the service-linked role isn’t already registered, this action also creates and registers a service-linked role to grant Amazon Inspector access to AWS Services needed to perform security assessments. You can create up to 50 assessment targets per AWS account. You can run up to 500 concurrent agents per AWS account. For more information, see  Amazon Inspector Assessment Targets.

Required Parameters
{
  "assessmentTargetName": "The user-defined name that identifies the assessment target that you want to create. The name must be unique within the AWS account."
}

Optional Parameters
{
  "resourceGroupArn": "The ARN that specifies the resource group that is used to create the assessment target. If resourceGroupArn is not specified, all EC2 instances in the current AWS account and region are included in the assessment target."
}
"""
CreateAssessmentTarget(args) = inspector("CreateAssessmentTarget", args)

"""
    PreviewAgents()

Previews the agents installed on the EC2 instances that are part of the specified assessment target.

Required Parameters
{
  "previewAgentsArn": "The ARN of the assessment target whose agents you want to preview."
}

Optional Parameters
{
  "maxResults": "You can use this parameter to indicate the maximum number of items you want in the response. The default value is 10. The maximum value is 500.",
  "nextToken": "You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the PreviewAgents action. Subsequent calls to the action fill nextToken in the request with the value of NextToken from the previous response to continue listing data."
}
"""
PreviewAgents(args) = inspector("PreviewAgents", args)

"""
    DescribeAssessmentTemplates()

Describes the assessment templates that are specified by the ARNs of the assessment templates.

Required Parameters
{
  "assessmentTemplateArns": ""
}
"""
DescribeAssessmentTemplates(args) = inspector("DescribeAssessmentTemplates", args)

"""
    DescribeFindings()

Describes the findings that are specified by the ARNs of the findings.

Required Parameters
{
  "findingArns": "The ARN that specifies the finding that you want to describe."
}

Optional Parameters
{
  "locale": "The locale into which you want to translate a finding description, recommendation, and the short description that identifies the finding."
}
"""
DescribeFindings(args) = inspector("DescribeFindings", args)

"""
    CreateExclusionsPreview()

Starts the generation of an exclusions preview for the specified assessment template. The exclusions preview lists the potential exclusions (ExclusionPreview) that Inspector can detect before it runs the assessment. 

Required Parameters
{
  "assessmentTemplateArn": "The ARN that specifies the assessment template for which you want to create an exclusions preview."
}
"""
CreateExclusionsPreview(args) = inspector("CreateExclusionsPreview", args)

"""
    DeleteAssessmentTarget()

Deletes the assessment target that is specified by the ARN of the assessment target.

Required Parameters
{
  "assessmentTargetArn": "The ARN that specifies the assessment target that you want to delete."
}
"""
DeleteAssessmentTarget(args) = inspector("DeleteAssessmentTarget", args)

"""
    DeleteAssessmentTemplate()

Deletes the assessment template that is specified by the ARN of the assessment template.

Required Parameters
{
  "assessmentTemplateArn": "The ARN that specifies the assessment template that you want to delete."
}
"""
DeleteAssessmentTemplate(args) = inspector("DeleteAssessmentTemplate", args)

"""
    DescribeCrossAccountAccessRole()

Describes the IAM role that enables Amazon Inspector to access your AWS account.
"""
DescribeCrossAccountAccessRole() = inspector("DescribeCrossAccountAccessRole")
DescribeCrossAccountAccessRole(args) = inspector("DescribeCrossAccountAccessRole", args)

"""
    DescribeExclusions()

Describes the exclusions that are specified by the exclusions' ARNs.

Required Parameters
{
  "exclusionArns": "The list of ARNs that specify the exclusions that you want to describe."
}

Optional Parameters
{
  "locale": "The locale into which you want to translate the exclusion's title, description, and recommendation."
}
"""
DescribeExclusions(args) = inspector("DescribeExclusions", args)

"""
    RegisterCrossAccountAccessRole()

Registers the IAM role that grants Amazon Inspector access to AWS Services needed to perform security assessments.

Required Parameters
{
  "roleArn": "The ARN of the IAM role that grants Amazon Inspector access to AWS Services needed to perform security assessments. "
}
"""
RegisterCrossAccountAccessRole(args) = inspector("RegisterCrossAccountAccessRole", args)

"""
    SubscribeToEvent()

Enables the process of sending Amazon Simple Notification Service (SNS) notifications about a specified event to a specified SNS topic.

Required Parameters
{
  "event": "The event for which you want to receive SNS notifications.",
  "resourceArn": "The ARN of the assessment template that is used during the event for which you want to receive SNS notifications.",
  "topicArn": "The ARN of the SNS topic to which the SNS notifications are sent."
}
"""
SubscribeToEvent(args) = inspector("SubscribeToEvent", args)
