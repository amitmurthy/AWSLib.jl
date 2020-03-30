include("../AWSServices.jl")
using .AWSServices: pinpoint

"""
    GetGcmChannel()

Retrieves information about the status and settings of the GCM channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
GetGcmChannel(args) = pinpoint("GET", "/v1/apps/{application-id}/channels/gcm", args)

"""
    UpdateEmailTemplate()

Updates an existing message template for messages that are sent through the email channel.

Required Parameters
{
  "EmailTemplateRequest": "",
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}

Optional Parameters
{
  "CreateNewVersion": "Specifies whether to save the updates as a new version of the message template. Valid values are: true, save the updates as a new version; and, false, save the updates to (overwrite) the latest existing version of the template. If you don't specify a value for this parameter, Amazon Pinpoint saves the updates to (overwrites) the latest existing version of the template. If you specify a value of true for this parameter, don't specify a value for the version parameter. Otherwise, an error will occur.",
  "Version": "The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the Template Versions resource. If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur. If you don't specify a value for this parameter, Amazon Pinpoint does the following: For a get operation, retrieves information about the active version of the template. For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false. For a delete operation, deletes the template, including all versions of the template."
}
"""
UpdateEmailTemplate(args) = pinpoint("PUT", "/v1/templates/{template-name}/email", args)

"""
    UpdateCampaign()

Updates the configuration and other settings for a campaign.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "CampaignId": "The unique identifier for the campaign.",
  "WriteCampaignRequest": ""
}
"""
UpdateCampaign(args) = pinpoint("PUT", "/v1/apps/{application-id}/campaigns/{campaign-id}", args)

"""
    DeleteEmailChannel()

Disables the email channel for an application and deletes any existing settings for the channel.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
DeleteEmailChannel(args) = pinpoint("DELETE", "/v1/apps/{application-id}/channels/email", args)

"""
    RemoveAttributes()

Removes one or more attributes, of the same attribute type, from all the endpoints that are associated with an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "UpdateAttributesRequest": "",
  "AttributeType": " The type of attribute or attributes to remove. Valid values are: endpoint-custom-attributes - Custom attributes that describe endpoints, such as the date when an associated user opted in or out of receiving communications from you through a specific type of channel. endpoint-metric-attributes - Custom metrics that your app reports to Amazon Pinpoint for endpoints, such as the number of app sessions or the number of items left in a cart. endpoint-user-attributes - Custom attributes that describe users, such as first name, last name, and age."
}
"""
RemoveAttributes(args) = pinpoint("PUT", "/v1/apps/{application-id}/attributes/{attribute-type}", args)

"""
    DeleteApp()

Deletes an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
DeleteApp(args) = pinpoint("DELETE", "/v1/apps/{application-id}", args)

"""
    GetEmailTemplate()

Retrieves the content and settings of a message template for messages that are sent through the email channel.

Required Parameters
{
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}

Optional Parameters
{
  "Version": "The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the Template Versions resource. If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur. If you don't specify a value for this parameter, Amazon Pinpoint does the following: For a get operation, retrieves information about the active version of the template. For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false. For a delete operation, deletes the template, including all versions of the template."
}
"""
GetEmailTemplate(args) = pinpoint("GET", "/v1/templates/{template-name}/email", args)

"""
    GetCampaignActivities()

Retrieves information about all the activities for a campaign.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "CampaignId": "The unique identifier for the campaign."
}

Optional Parameters
{
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "Token": "The NextToken string that specifies which page of results to return in a paginated response."
}
"""
GetCampaignActivities(args) = pinpoint("GET", "/v1/apps/{application-id}/campaigns/{campaign-id}/activities", args)

"""
    GetSegmentExportJobs()

Retrieves information about the status and settings of the export jobs for a segment.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "SegmentId": "The unique identifier for the segment."
}

Optional Parameters
{
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "Token": "The NextToken string that specifies which page of results to return in a paginated response."
}
"""
GetSegmentExportJobs(args) = pinpoint("GET", "/v1/apps/{application-id}/segments/{segment-id}/jobs/export", args)

"""
    GetSegments()

Retrieves information about the configuration, dimension, and other settings for all the segments that are associated with an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}

Optional Parameters
{
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "Token": "The NextToken string that specifies which page of results to return in a paginated response."
}
"""
GetSegments(args) = pinpoint("GET", "/v1/apps/{application-id}/segments", args)

"""
    GetApnsChannel()

Retrieves information about the status and settings of the APNs channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
GetApnsChannel(args) = pinpoint("GET", "/v1/apps/{application-id}/channels/apns", args)

"""
    TagResource()

Adds one or more tags (keys and values) to an application, campaign, message template, or segment.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource.",
  "TagsModel": ""
}
"""
TagResource(args) = pinpoint("POST", "/v1/tags/{resource-arn}", args)

"""
    UpdateSegment()

Creates a new segment for an application or updates the configuration, dimension, and other settings for an existing segment that's associated with an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "SegmentId": "The unique identifier for the segment.",
  "WriteSegmentRequest": ""
}
"""
UpdateSegment(args) = pinpoint("PUT", "/v1/apps/{application-id}/segments/{segment-id}", args)

"""
    DeleteAdmChannel()

Disables the ADM channel for an application and deletes any existing settings for the channel.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
DeleteAdmChannel(args) = pinpoint("DELETE", "/v1/apps/{application-id}/channels/adm", args)

"""
    DeleteSmsTemplate()

Deletes a message template for messages that were sent through the SMS channel.

Required Parameters
{
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}

Optional Parameters
{
  "Version": "The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the Template Versions resource. If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur. If you don't specify a value for this parameter, Amazon Pinpoint does the following: For a get operation, retrieves information about the active version of the template. For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false. For a delete operation, deletes the template, including all versions of the template."
}
"""
DeleteSmsTemplate(args) = pinpoint("DELETE", "/v1/templates/{template-name}/sms", args)

"""
    GetCampaignVersion()

Retrieves information about the status, configuration, and other settings for a specific version of a campaign.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "CampaignId": "The unique identifier for the campaign.",
  "Version": "The unique version number (Version property) for the campaign version."
}
"""
GetCampaignVersion(args) = pinpoint("GET", "/v1/apps/{application-id}/campaigns/{campaign-id}/versions/{version}", args)

"""
    CreateImportJob()

Creates an import job for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "ImportJobRequest": ""
}
"""
CreateImportJob(args) = pinpoint("POST", "/v1/apps/{application-id}/jobs/import", args)

"""
    GetSmsChannel()

Retrieves information about the status and settings of the SMS channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
GetSmsChannel(args) = pinpoint("GET", "/v1/apps/{application-id}/channels/sms", args)

"""
    GetEventStream()

Retrieves information about the event stream settings for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
GetEventStream(args) = pinpoint("GET", "/v1/apps/{application-id}/eventstream", args)

"""
    GetSegmentVersion()

Retrieves information about the configuration, dimension, and other settings for a specific version of a segment that's associated with an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "SegmentId": "The unique identifier for the segment.",
  "Version": "The unique version number (Version property) for the campaign version."
}
"""
GetSegmentVersion(args) = pinpoint("GET", "/v1/apps/{application-id}/segments/{segment-id}/versions/{version}", args)

"""
    DeleteEmailTemplate()

Deletes a message template for messages that were sent through the email channel.

Required Parameters
{
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}

Optional Parameters
{
  "Version": "The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the Template Versions resource. If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur. If you don't specify a value for this parameter, Amazon Pinpoint does the following: For a get operation, retrieves information about the active version of the template. For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false. For a delete operation, deletes the template, including all versions of the template."
}
"""
DeleteEmailTemplate(args) = pinpoint("DELETE", "/v1/templates/{template-name}/email", args)

"""
    GetJourney()

Retrieves information about the status, configuration, and other settings for a journey.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "JourneyId": "The unique identifier for the journey."
}
"""
GetJourney(args) = pinpoint("GET", "/v1/apps/{application-id}/journeys/{journey-id}", args)

"""
    GetApp()

Retrieves information about an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
GetApp(args) = pinpoint("GET", "/v1/apps/{application-id}", args)

"""
    GetCampaign()

Retrieves information about the status, configuration, and other settings for a campaign.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "CampaignId": "The unique identifier for the campaign."
}
"""
GetCampaign(args) = pinpoint("GET", "/v1/apps/{application-id}/campaigns/{campaign-id}", args)

"""
    UpdateApnsSandboxChannel()

Enables the APNs sandbox channel for an application or updates the status and settings of the APNs sandbox channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "APNSSandboxChannelRequest": ""
}
"""
UpdateApnsSandboxChannel(args) = pinpoint("PUT", "/v1/apps/{application-id}/channels/apns_sandbox", args)

"""
    GetChannels()

Retrieves information about the history and status of each channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
GetChannels(args) = pinpoint("GET", "/v1/apps/{application-id}/channels", args)

"""
    GetEndpoint()

Retrieves information about the settings and attributes of a specific endpoint for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "EndpointId": "The unique identifier for the endpoint."
}
"""
GetEndpoint(args) = pinpoint("GET", "/v1/apps/{application-id}/endpoints/{endpoint-id}", args)

"""
    DeleteVoiceTemplate()

Deletes a message template for messages that were sent through the voice channel.

Required Parameters
{
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}

Optional Parameters
{
  "Version": "The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the Template Versions resource. If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur. If you don't specify a value for this parameter, Amazon Pinpoint does the following: For a get operation, retrieves information about the active version of the template. For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false. For a delete operation, deletes the template, including all versions of the template."
}
"""
DeleteVoiceTemplate(args) = pinpoint("DELETE", "/v1/templates/{template-name}/voice", args)

"""
    CreateJourney()

Creates a journey for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "WriteJourneyRequest": ""
}
"""
CreateJourney(args) = pinpoint("POST", "/v1/apps/{application-id}/journeys", args)

"""
    ListTemplateVersions()

Retrieves information about all the versions of a specific message template.

Required Parameters
{
  "TemplateType": "The type of channel that the message template is designed for. Valid values are: EMAIL, PUSH, SMS, and VOICE.",
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}

Optional Parameters
{
  "NextToken": "The  string that specifies which page of results to return in a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics."
}
"""
ListTemplateVersions(args) = pinpoint("GET", "/v1/templates/{template-name}/{template-type}/versions", args)

"""
    GetSegment()

Retrieves information about the configuration, dimension, and other settings for a specific segment that's associated with an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "SegmentId": "The unique identifier for the segment."
}
"""
GetSegment(args) = pinpoint("GET", "/v1/apps/{application-id}/segments/{segment-id}", args)

"""
    CreateCampaign()

Creates a new campaign for an application or updates the settings of an existing campaign for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "WriteCampaignRequest": ""
}
"""
CreateCampaign(args) = pinpoint("POST", "/v1/apps/{application-id}/campaigns", args)

"""
    CreateSmsTemplate()

Creates a message template for messages that are sent through the SMS channel.

Required Parameters
{
  "SMSTemplateRequest": "",
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}
"""
CreateSmsTemplate(args) = pinpoint("POST", "/v1/templates/{template-name}/sms", args)

"""
    UpdateVoiceTemplate()

Updates an existing message template for messages that are sent through the voice channel.

Required Parameters
{
  "VoiceTemplateRequest": "",
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}

Optional Parameters
{
  "CreateNewVersion": "Specifies whether to save the updates as a new version of the message template. Valid values are: true, save the updates as a new version; and, false, save the updates to (overwrite) the latest existing version of the template. If you don't specify a value for this parameter, Amazon Pinpoint saves the updates to (overwrites) the latest existing version of the template. If you specify a value of true for this parameter, don't specify a value for the version parameter. Otherwise, an error will occur.",
  "Version": "The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the Template Versions resource. If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur. If you don't specify a value for this parameter, Amazon Pinpoint does the following: For a get operation, retrieves information about the active version of the template. For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false. For a delete operation, deletes the template, including all versions of the template."
}
"""
UpdateVoiceTemplate(args) = pinpoint("PUT", "/v1/templates/{template-name}/voice", args)

"""
    UpdateEndpointsBatch()

 Creates a new batch of endpoints for an application or updates the settings and attributes of a batch of existing endpoints for an application. You can also use this operation to define custom attributes (Attributes, Metrics, and UserAttributes properties) for a batch of endpoints.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "EndpointBatchRequest": ""
}
"""
UpdateEndpointsBatch(args) = pinpoint("PUT", "/v1/apps/{application-id}/endpoints", args)

"""
    GetJourneyExecutionMetrics()

Retrieves (queries) pre-aggregated data for a standard execution metric that applies to a journey.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "JourneyId": "The unique identifier for the journey."
}

Optional Parameters
{
  "NextToken": "The  string that specifies which page of results to return in a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics."
}
"""
GetJourneyExecutionMetrics(args) = pinpoint("GET", "/v1/apps/{application-id}/journeys/{journey-id}/execution-metrics", args)

"""
    UpdateTemplateActiveVersion()

Changes the status of a specific version of a message template to active.

Required Parameters
{
  "TemplateActiveVersionRequest": "",
  "TemplateType": "The type of channel that the message template is designed for. Valid values are: EMAIL, PUSH, SMS, and VOICE.",
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}
"""
UpdateTemplateActiveVersion(args) = pinpoint("PUT", "/v1/templates/{template-name}/{template-type}/active-version", args)

"""
    UpdateEndpoint()

Creates a new endpoint for an application or updates the settings and attributes of an existing endpoint for an application. You can also use this operation to define custom attributes (Attributes, Metrics, and UserAttributes properties) for an endpoint.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "EndpointRequest": "",
  "EndpointId": "The unique identifier for the endpoint."
}
"""
UpdateEndpoint(args) = pinpoint("PUT", "/v1/apps/{application-id}/endpoints/{endpoint-id}", args)

"""
    UpdateAdmChannel()

Enables the ADM channel for an application or updates the status and settings of the ADM channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "ADMChannelRequest": ""
}
"""
UpdateAdmChannel(args) = pinpoint("PUT", "/v1/apps/{application-id}/channels/adm", args)

"""
    CreateExportJob()

Creates an export job for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "ExportJobRequest": ""
}
"""
CreateExportJob(args) = pinpoint("POST", "/v1/apps/{application-id}/jobs/export", args)

"""
    GetApplicationSettings()

Retrieves information about the settings for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
GetApplicationSettings(args) = pinpoint("GET", "/v1/apps/{application-id}/settings", args)

"""
    UpdateSmsChannel()

Enables the SMS channel for an application or updates the status and settings of the SMS channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "SMSChannelRequest": ""
}
"""
UpdateSmsChannel(args) = pinpoint("PUT", "/v1/apps/{application-id}/channels/sms", args)

"""
    UntagResource()

Removes one or more tags (keys and values) from an application, campaign, message template, or segment.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource.",
  "TagKeys": "The key of the tag to remove from the resource. To remove multiple tags, append the tagKeys parameter and argument for each additional tag to remove, separated by an ampersand (&amp;)."
}
"""
UntagResource(args) = pinpoint("DELETE", "/v1/tags/{resource-arn}", args)

"""
    DeleteApnsChannel()

Disables the APNs channel for an application and deletes any existing settings for the channel.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
DeleteApnsChannel(args) = pinpoint("DELETE", "/v1/apps/{application-id}/channels/apns", args)

"""
    UpdateEmailChannel()

Enables the email channel for an application or updates the status and settings of the email channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "EmailChannelRequest": ""
}
"""
UpdateEmailChannel(args) = pinpoint("PUT", "/v1/apps/{application-id}/channels/email", args)

"""
    DeleteApnsVoipChannel()

Disables the APNs VoIP channel for an application and deletes any existing settings for the channel.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
DeleteApnsVoipChannel(args) = pinpoint("DELETE", "/v1/apps/{application-id}/channels/apns_voip", args)

"""
    GetUserEndpoints()

Retrieves information about all the endpoints that are associated with a specific user ID.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "UserId": "The unique identifier for the user."
}
"""
GetUserEndpoints(args) = pinpoint("GET", "/v1/apps/{application-id}/users/{user-id}", args)

"""
    UpdateBaiduChannel()

Enables the Baidu channel for an application or updates the status and settings of the Baidu channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "BaiduChannelRequest": ""
}
"""
UpdateBaiduChannel(args) = pinpoint("PUT", "/v1/apps/{application-id}/channels/baidu", args)

"""
    DeleteCampaign()

Deletes a campaign from an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "CampaignId": "The unique identifier for the campaign."
}
"""
DeleteCampaign(args) = pinpoint("DELETE", "/v1/apps/{application-id}/campaigns/{campaign-id}", args)

"""
    UpdateSmsTemplate()

Updates an existing message template for messages that are sent through the SMS channel.

Required Parameters
{
  "SMSTemplateRequest": "",
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}

Optional Parameters
{
  "CreateNewVersion": "Specifies whether to save the updates as a new version of the message template. Valid values are: true, save the updates as a new version; and, false, save the updates to (overwrite) the latest existing version of the template. If you don't specify a value for this parameter, Amazon Pinpoint saves the updates to (overwrites) the latest existing version of the template. If you specify a value of true for this parameter, don't specify a value for the version parameter. Otherwise, an error will occur.",
  "Version": "The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the Template Versions resource. If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur. If you don't specify a value for this parameter, Amazon Pinpoint does the following: For a get operation, retrieves information about the active version of the template. For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false. For a delete operation, deletes the template, including all versions of the template."
}
"""
UpdateSmsTemplate(args) = pinpoint("PUT", "/v1/templates/{template-name}/sms", args)

"""
    DeleteBaiduChannel()

Disables the Baidu channel for an application and deletes any existing settings for the channel.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
DeleteBaiduChannel(args) = pinpoint("DELETE", "/v1/apps/{application-id}/channels/baidu", args)

"""
    DeleteApnsVoipSandboxChannel()

Disables the APNs VoIP sandbox channel for an application and deletes any existing settings for the channel.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
DeleteApnsVoipSandboxChannel(args) = pinpoint("DELETE", "/v1/apps/{application-id}/channels/apns_voip_sandbox", args)

"""
    DeleteEventStream()

Deletes the event stream for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
DeleteEventStream(args) = pinpoint("DELETE", "/v1/apps/{application-id}/eventstream", args)

"""
    GetRecommenderConfiguration()

Retrieves information about an Amazon Pinpoint configuration for a recommender model.

Required Parameters
{
  "RecommenderId": "The unique identifier for the recommender model configuration. This identifier is displayed as the Recommender ID on the Amazon Pinpoint console."
}
"""
GetRecommenderConfiguration(args) = pinpoint("GET", "/v1/recommenders/{recommender-id}", args)

"""
    CreateSegment()

Creates a new segment for an application or updates the configuration, dimension, and other settings for an existing segment that's associated with an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "WriteSegmentRequest": ""
}
"""
CreateSegment(args) = pinpoint("POST", "/v1/apps/{application-id}/segments", args)

"""
    GetApnsVoipSandboxChannel()

Retrieves information about the status and settings of the APNs VoIP sandbox channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
GetApnsVoipSandboxChannel(args) = pinpoint("GET", "/v1/apps/{application-id}/channels/apns_voip_sandbox", args)

"""
    GetImportJob()

Retrieves information about the status and settings of a specific import job for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "JobId": "The unique identifier for the job."
}
"""
GetImportJob(args) = pinpoint("GET", "/v1/apps/{application-id}/jobs/import/{job-id}", args)

"""
    GetExportJob()

Retrieves information about the status and settings of a specific export job for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "JobId": "The unique identifier for the job."
}
"""
GetExportJob(args) = pinpoint("GET", "/v1/apps/{application-id}/jobs/export/{job-id}", args)

"""
    ListTagsForResource()

Retrieves all the tags (keys and values) that are associated with an application, campaign, message template, or segment.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource."
}
"""
ListTagsForResource(args) = pinpoint("GET", "/v1/tags/{resource-arn}", args)

"""
    SendMessages()

Creates and sends a direct message.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "MessageRequest": ""
}
"""
SendMessages(args) = pinpoint("POST", "/v1/apps/{application-id}/messages", args)

"""
    UpdateApnsChannel()

Enables the APNs channel for an application or updates the status and settings of the APNs channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "APNSChannelRequest": ""
}
"""
UpdateApnsChannel(args) = pinpoint("PUT", "/v1/apps/{application-id}/channels/apns", args)

"""
    GetSegmentImportJobs()

Retrieves information about the status and settings of the import jobs for a segment.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "SegmentId": "The unique identifier for the segment."
}

Optional Parameters
{
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "Token": "The NextToken string that specifies which page of results to return in a paginated response."
}
"""
GetSegmentImportJobs(args) = pinpoint("GET", "/v1/apps/{application-id}/segments/{segment-id}/jobs/import", args)

"""
    GetSmsTemplate()

Retrieves the content and settings of a message template for messages that are sent through the SMS channel.

Required Parameters
{
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}

Optional Parameters
{
  "Version": "The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the Template Versions resource. If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur. If you don't specify a value for this parameter, Amazon Pinpoint does the following: For a get operation, retrieves information about the active version of the template. For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false. For a delete operation, deletes the template, including all versions of the template."
}
"""
GetSmsTemplate(args) = pinpoint("GET", "/v1/templates/{template-name}/sms", args)

"""
    DeleteGcmChannel()

Disables the GCM channel for an application and deletes any existing settings for the channel.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
DeleteGcmChannel(args) = pinpoint("DELETE", "/v1/apps/{application-id}/channels/gcm", args)

"""
    DeleteJourney()

Deletes a journey from an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "JourneyId": "The unique identifier for the journey."
}
"""
DeleteJourney(args) = pinpoint("DELETE", "/v1/apps/{application-id}/journeys/{journey-id}", args)

"""
    PutEvents()

Creates a new event to record for endpoints, or creates or updates endpoint data that existing events are associated with.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "EventsRequest": ""
}
"""
PutEvents(args) = pinpoint("POST", "/v1/apps/{application-id}/events", args)

"""
    UpdateApplicationSettings()

Updates the settings for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "WriteApplicationSettingsRequest": ""
}
"""
UpdateApplicationSettings(args) = pinpoint("PUT", "/v1/apps/{application-id}/settings", args)

"""
    UpdateJourneyState()

Cancels (stops) an active journey.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "JourneyStateRequest": "",
  "JourneyId": "The unique identifier for the journey."
}
"""
UpdateJourneyState(args) = pinpoint("PUT", "/v1/apps/{application-id}/journeys/{journey-id}/state", args)

"""
    GetApps()

Retrieves information about all the applications that are associated with your Amazon Pinpoint account.

Optional Parameters
{
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "Token": "The NextToken string that specifies which page of results to return in a paginated response."
}
"""
GetApps() = pinpoint("GET", "/v1/apps")
GetApps(args) = pinpoint("GET", "/v1/apps", args)

"""
    CreateRecommenderConfiguration()

Creates an Amazon Pinpoint configuration for a recommender model.

Required Parameters
{
  "CreateRecommenderConfiguration": ""
}
"""
CreateRecommenderConfiguration(args) = pinpoint("POST", "/v1/recommenders", args)

"""
    UpdateApnsVoipChannel()

Enables the APNs VoIP channel for an application or updates the status and settings of the APNs VoIP channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "APNSVoipChannelRequest": ""
}
"""
UpdateApnsVoipChannel(args) = pinpoint("PUT", "/v1/apps/{application-id}/channels/apns_voip", args)

"""
    DeleteVoiceChannel()

Disables the voice channel for an application and deletes any existing settings for the channel.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
DeleteVoiceChannel(args) = pinpoint("DELETE", "/v1/apps/{application-id}/channels/voice", args)

"""
    UpdatePushTemplate()

Updates an existing message template for messages that are sent through a push notification channel.

Required Parameters
{
  "PushNotificationTemplateRequest": "",
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}

Optional Parameters
{
  "CreateNewVersion": "Specifies whether to save the updates as a new version of the message template. Valid values are: true, save the updates as a new version; and, false, save the updates to (overwrite) the latest existing version of the template. If you don't specify a value for this parameter, Amazon Pinpoint saves the updates to (overwrites) the latest existing version of the template. If you specify a value of true for this parameter, don't specify a value for the version parameter. Otherwise, an error will occur.",
  "Version": "The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the Template Versions resource. If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur. If you don't specify a value for this parameter, Amazon Pinpoint does the following: For a get operation, retrieves information about the active version of the template. For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false. For a delete operation, deletes the template, including all versions of the template."
}
"""
UpdatePushTemplate(args) = pinpoint("PUT", "/v1/templates/{template-name}/push", args)

"""
    DeleteEndpoint()

Deletes an endpoint from an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "EndpointId": "The unique identifier for the endpoint."
}
"""
DeleteEndpoint(args) = pinpoint("DELETE", "/v1/apps/{application-id}/endpoints/{endpoint-id}", args)

"""
    PutEventStream()

Creates a new event stream for an application or updates the settings of an existing event stream for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "WriteEventStream": ""
}
"""
PutEventStream(args) = pinpoint("POST", "/v1/apps/{application-id}/eventstream", args)

"""
    SendUsersMessages()

Creates and sends a message to a list of users.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "SendUsersMessageRequest": ""
}
"""
SendUsersMessages(args) = pinpoint("POST", "/v1/apps/{application-id}/users-messages", args)

"""
    UpdateGcmChannel()

Enables the GCM channel for an application or updates the status and settings of the GCM channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "GCMChannelRequest": ""
}
"""
UpdateGcmChannel(args) = pinpoint("PUT", "/v1/apps/{application-id}/channels/gcm", args)

"""
    ListTemplates()

Retrieves information about all the message templates that are associated with your Amazon Pinpoint account.

Optional Parameters
{
  "NextToken": "The  string that specifies which page of results to return in a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "TemplateType": "The type of message template to include in the results. Valid values are: EMAIL, PUSH, SMS, and VOICE. To include all types of templates in the results, don't include this parameter in your request.",
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "Prefix": "The substring to match in the names of the message templates to include in the results. If you specify this value, Amazon Pinpoint returns only those templates whose names begin with the value that you specify."
}
"""
ListTemplates() = pinpoint("GET", "/v1/templates")
ListTemplates(args) = pinpoint("GET", "/v1/templates", args)

"""
    GetImportJobs()

Retrieves information about the status and settings of all the import jobs for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}

Optional Parameters
{
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "Token": "The NextToken string that specifies which page of results to return in a paginated response."
}
"""
GetImportJobs(args) = pinpoint("GET", "/v1/apps/{application-id}/jobs/import", args)

"""
    GetBaiduChannel()

Retrieves information about the status and settings of the Baidu channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
GetBaiduChannel(args) = pinpoint("GET", "/v1/apps/{application-id}/channels/baidu", args)

"""
    GetEmailChannel()

Retrieves information about the status and settings of the email channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
GetEmailChannel(args) = pinpoint("GET", "/v1/apps/{application-id}/channels/email", args)

"""
    ListJourneys()

Retrieves information about the status, configuration, and other settings for all the journeys that are associated with an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}

Optional Parameters
{
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "Token": "The NextToken string that specifies which page of results to return in a paginated response."
}
"""
ListJourneys(args) = pinpoint("GET", "/v1/apps/{application-id}/journeys", args)

"""
    DeleteSegment()

Deletes a segment from an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "SegmentId": "The unique identifier for the segment."
}
"""
DeleteSegment(args) = pinpoint("DELETE", "/v1/apps/{application-id}/segments/{segment-id}", args)

"""
    DeleteUserEndpoints()

Deletes all the endpoints that are associated with a specific user ID.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "UserId": "The unique identifier for the user."
}
"""
DeleteUserEndpoints(args) = pinpoint("DELETE", "/v1/apps/{application-id}/users/{user-id}", args)

"""
    GetVoiceChannel()

Retrieves information about the status and settings of the voice channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
GetVoiceChannel(args) = pinpoint("GET", "/v1/apps/{application-id}/channels/voice", args)

"""
    CreateVoiceTemplate()

Creates a message template for messages that are sent through the voice channel.

Required Parameters
{
  "VoiceTemplateRequest": "",
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}
"""
CreateVoiceTemplate(args) = pinpoint("POST", "/v1/templates/{template-name}/voice", args)

"""
    GetSegmentVersions()

Retrieves information about the configuration, dimension, and other settings for all the versions of a specific segment that's associated with an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "SegmentId": "The unique identifier for the segment."
}

Optional Parameters
{
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "Token": "The NextToken string that specifies which page of results to return in a paginated response."
}
"""
GetSegmentVersions(args) = pinpoint("GET", "/v1/apps/{application-id}/segments/{segment-id}/versions", args)

"""
    GetApnsVoipChannel()

Retrieves information about the status and settings of the APNs VoIP channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
GetApnsVoipChannel(args) = pinpoint("GET", "/v1/apps/{application-id}/channels/apns_voip", args)

"""
    GetApnsSandboxChannel()

Retrieves information about the status and settings of the APNs sandbox channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
GetApnsSandboxChannel(args) = pinpoint("GET", "/v1/apps/{application-id}/channels/apns_sandbox", args)

"""
    DeleteSmsChannel()

Disables the SMS channel for an application and deletes any existing settings for the channel.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
DeleteSmsChannel(args) = pinpoint("DELETE", "/v1/apps/{application-id}/channels/sms", args)

"""
    GetCampaignDateRangeKpi()

Retrieves (queries) pre-aggregated data for a standard metric that applies to a campaign.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "CampaignId": "The unique identifier for the campaign.",
  "KpiName": "The name of the metric, also referred to as a key performance indicator (KPI), to retrieve data for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. Examples are email-open-rate and successful-delivery-rate. For a list of valid values, see the Amazon Pinpoint Developer Guide."
}

Optional Parameters
{
  "StartTime": "The first date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-19T20:00:00Z for 8:00 PM UTC July 19, 2019. This value should also be fewer than 90 days from the current day.",
  "NextToken": "The  string that specifies which page of results to return in a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "EndTime": "The last date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-26T20:00:00Z for 8:00 PM UTC July 26, 2019.",
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics."
}
"""
GetCampaignDateRangeKpi(args) = pinpoint("GET", "/v1/apps/{application-id}/campaigns/{campaign-id}/kpis/daterange/{kpi-name}", args)

"""
    GetExportJobs()

Retrieves information about the status and settings of all the export jobs for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}

Optional Parameters
{
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "Token": "The NextToken string that specifies which page of results to return in a paginated response."
}
"""
GetExportJobs(args) = pinpoint("GET", "/v1/apps/{application-id}/jobs/export", args)

"""
    DeleteRecommenderConfiguration()

Deletes an Amazon Pinpoint configuration for a recommender model.

Required Parameters
{
  "RecommenderId": "The unique identifier for the recommender model configuration. This identifier is displayed as the Recommender ID on the Amazon Pinpoint console."
}
"""
DeleteRecommenderConfiguration(args) = pinpoint("DELETE", "/v1/recommenders/{recommender-id}", args)

"""
    PhoneNumberValidate()

Retrieves information about a phone number.

Required Parameters
{
  "NumberValidateRequest": ""
}
"""
PhoneNumberValidate(args) = pinpoint("POST", "/v1/phone/number/validate", args)

"""
    GetPushTemplate()

Retrieves the content and settings of a message template for messages that are sent through a push notification channel.

Required Parameters
{
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}

Optional Parameters
{
  "Version": "The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the Template Versions resource. If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur. If you don't specify a value for this parameter, Amazon Pinpoint does the following: For a get operation, retrieves information about the active version of the template. For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false. For a delete operation, deletes the template, including all versions of the template."
}
"""
GetPushTemplate(args) = pinpoint("GET", "/v1/templates/{template-name}/push", args)

"""
    CreatePushTemplate()

Creates a message template for messages that are sent through a push notification channel.

Required Parameters
{
  "PushNotificationTemplateRequest": "",
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}
"""
CreatePushTemplate(args) = pinpoint("POST", "/v1/templates/{template-name}/push", args)

"""
    DeletePushTemplate()

Deletes a message template for messages that were sent through a push notification channel.

Required Parameters
{
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}

Optional Parameters
{
  "Version": "The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the Template Versions resource. If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur. If you don't specify a value for this parameter, Amazon Pinpoint does the following: For a get operation, retrieves information about the active version of the template. For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false. For a delete operation, deletes the template, including all versions of the template."
}
"""
DeletePushTemplate(args) = pinpoint("DELETE", "/v1/templates/{template-name}/push", args)

"""
    GetCampaignVersions()

Retrieves information about the status, configuration, and other settings for all versions of a campaign.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "CampaignId": "The unique identifier for the campaign."
}

Optional Parameters
{
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "Token": "The NextToken string that specifies which page of results to return in a paginated response."
}
"""
GetCampaignVersions(args) = pinpoint("GET", "/v1/apps/{application-id}/campaigns/{campaign-id}/versions", args)

"""
    CreateApp()

 Creates an application.

Required Parameters
{
  "CreateApplicationRequest": ""
}
"""
CreateApp(args) = pinpoint("POST", "/v1/apps", args)

"""
    GetRecommenderConfigurations()

Retrieves information about all the recommender model configurations that are associated with your Amazon Pinpoint account.

Optional Parameters
{
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "Token": "The NextToken string that specifies which page of results to return in a paginated response."
}
"""
GetRecommenderConfigurations() = pinpoint("GET", "/v1/recommenders")
GetRecommenderConfigurations(args) = pinpoint("GET", "/v1/recommenders", args)

"""
    CreateEmailTemplate()

Creates a message template for messages that are sent through the email channel.

Required Parameters
{
  "EmailTemplateRequest": "",
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}
"""
CreateEmailTemplate(args) = pinpoint("POST", "/v1/templates/{template-name}/email", args)

"""
    GetApplicationDateRangeKpi()

Retrieves (queries) pre-aggregated data for a standard metric that applies to an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "KpiName": "The name of the metric, also referred to as a key performance indicator (KPI), to retrieve data for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. Examples are email-open-rate and successful-delivery-rate. For a list of valid values, see the Amazon Pinpoint Developer Guide."
}

Optional Parameters
{
  "StartTime": "The first date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-19T20:00:00Z for 8:00 PM UTC July 19, 2019. This value should also be fewer than 90 days from the current day.",
  "NextToken": "The  string that specifies which page of results to return in a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "EndTime": "The last date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-26T20:00:00Z for 8:00 PM UTC July 26, 2019.",
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics."
}
"""
GetApplicationDateRangeKpi(args) = pinpoint("GET", "/v1/apps/{application-id}/kpis/daterange/{kpi-name}", args)

"""
    GetAdmChannel()

Retrieves information about the status and settings of the ADM channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
GetAdmChannel(args) = pinpoint("GET", "/v1/apps/{application-id}/channels/adm", args)

"""
    UpdateJourney()

Updates the configuration and other settings for a journey.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "JourneyId": "The unique identifier for the journey.",
  "WriteJourneyRequest": ""
}
"""
UpdateJourney(args) = pinpoint("PUT", "/v1/apps/{application-id}/journeys/{journey-id}", args)

"""
    UpdateApnsVoipSandboxChannel()

Enables the APNs VoIP sandbox channel for an application or updates the status and settings of the APNs VoIP sandbox channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "APNSVoipSandboxChannelRequest": ""
}
"""
UpdateApnsVoipSandboxChannel(args) = pinpoint("PUT", "/v1/apps/{application-id}/channels/apns_voip_sandbox", args)

"""
    GetJourneyDateRangeKpi()

Retrieves (queries) pre-aggregated data for a standard engagement metric that applies to a journey.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "JourneyId": "The unique identifier for the journey.",
  "KpiName": "The name of the metric, also referred to as a key performance indicator (KPI), to retrieve data for. This value describes the associated metric and consists of two or more terms, which are comprised of lowercase alphanumeric characters, separated by a hyphen. Examples are email-open-rate and successful-delivery-rate. For a list of valid values, see the Amazon Pinpoint Developer Guide."
}

Optional Parameters
{
  "StartTime": "The first date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-19T20:00:00Z for 8:00 PM UTC July 19, 2019. This value should also be fewer than 90 days from the current day.",
  "NextToken": "The  string that specifies which page of results to return in a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "EndTime": "The last date and time to retrieve data for, as part of an inclusive date range that filters the query results. This value should be in extended ISO 8601 format and use Coordinated Universal Time (UTC), for example: 2019-07-26T20:00:00Z for 8:00 PM UTC July 26, 2019.",
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics."
}
"""
GetJourneyDateRangeKpi(args) = pinpoint("GET", "/v1/apps/{application-id}/journeys/{journey-id}/kpis/daterange/{kpi-name}", args)

"""
    UpdateRecommenderConfiguration()

Updates an Amazon Pinpoint configuration for a recommender model.

Required Parameters
{
  "UpdateRecommenderConfiguration": "",
  "RecommenderId": "The unique identifier for the recommender model configuration. This identifier is displayed as the Recommender ID on the Amazon Pinpoint console."
}
"""
UpdateRecommenderConfiguration(args) = pinpoint("PUT", "/v1/recommenders/{recommender-id}", args)

"""
    DeleteApnsSandboxChannel()

Disables the APNs sandbox channel for an application and deletes any existing settings for the channel.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}
"""
DeleteApnsSandboxChannel(args) = pinpoint("DELETE", "/v1/apps/{application-id}/channels/apns_sandbox", args)

"""
    GetJourneyExecutionActivityMetrics()

Retrieves (queries) pre-aggregated data for a standard execution metric that applies to a journey activity.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "JourneyId": "The unique identifier for the journey.",
  "JourneyActivityId": "The unique identifier for the journey activity."
}

Optional Parameters
{
  "NextToken": "The  string that specifies which page of results to return in a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics."
}
"""
GetJourneyExecutionActivityMetrics(args) = pinpoint("GET", "/v1/apps/{application-id}/journeys/{journey-id}/activities/{journey-activity-id}/execution-metrics", args)

"""
    GetCampaigns()

Retrieves information about the status, configuration, and other settings for all the campaigns that are associated with an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console."
}

Optional Parameters
{
  "PageSize": "The maximum number of items to include in each page of a paginated response. This parameter is currently not supported for application, campaign, and journey metrics.",
  "Token": "The NextToken string that specifies which page of results to return in a paginated response."
}
"""
GetCampaigns(args) = pinpoint("GET", "/v1/apps/{application-id}/campaigns", args)

"""
    GetVoiceTemplate()

Retrieves the content and settings of a message template for messages that are sent through the voice channel.

Required Parameters
{
  "TemplateName": "The name of the message template. A template name must start with an alphanumeric character and can contain a maximum of 128 characters. The characters can be alphanumeric characters, underscores (_), or hyphens (-). Template names are case sensitive."
}

Optional Parameters
{
  "Version": "The unique identifier for the version of the message template to update, retrieve information about, or delete. To retrieve identifiers and other information for all the versions of a template, use the Template Versions resource. If specified, this value must match the identifier for an existing template version. If specified for an update operation, this value must match the identifier for the latest existing version of the template. This restriction helps ensure that race conditions don't occur. If you don't specify a value for this parameter, Amazon Pinpoint does the following: For a get operation, retrieves information about the active version of the template. For an update operation, saves the updates to (overwrites) the latest existing version of the template, if the create-new-version parameter isn't used or is set to false. For a delete operation, deletes the template, including all versions of the template."
}
"""
GetVoiceTemplate(args) = pinpoint("GET", "/v1/templates/{template-name}/voice", args)

"""
    UpdateVoiceChannel()

Enables the voice channel for an application or updates the status and settings of the voice channel for an application.

Required Parameters
{
  "ApplicationId": "The unique identifier for the application. This identifier is displayed as the Project ID on the Amazon Pinpoint console.",
  "VoiceChannelRequest": ""
}
"""
UpdateVoiceChannel(args) = pinpoint("PUT", "/v1/apps/{application-id}/channels/voice", args)
