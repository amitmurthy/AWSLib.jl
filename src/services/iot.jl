include("../AWSServices.jl")
using .AWSServices: iot

"""
    DeleteMitigationAction()

Deletes a defined mitigation action from your AWS account.

Required Parameters
{
  "actionName": "The name of the mitigation action that you want to delete."
}
"""
DeleteMitigationAction(args) = iot("DELETE", "/mitigationactions/actions/{actionName}", args)

"""
    DescribeJobExecution()

Describes a job execution.

Required Parameters
{
  "jobId": "The unique identifier you assigned to this job when it was created.",
  "thingName": "The name of the thing on which the job execution is running."
}

Optional Parameters
{
  "executionNumber": "A string (consisting of the digits \"0\" through \"9\" which is used to specify a particular job execution on a particular device."
}
"""
DescribeJobExecution(args) = iot("GET", "/things/{thingName}/jobs/{jobId}", args)

"""
    AttachSecurityProfile()

Associates a Device Defender security profile with a thing group or this account. Each thing group or account can have up to five security profiles associated with it.

Required Parameters
{
  "securityProfileTargetArn": "The ARN of the target (thing group) to which the security profile is attached.",
  "securityProfileName": "The security profile that is attached."
}
"""
AttachSecurityProfile(args) = iot("PUT", "/security-profiles/{securityProfileName}/targets", args)

"""
    ListTargetsForPolicy()

List targets for the specified policy.

Required Parameters
{
  "policyName": "The policy name."
}

Optional Parameters
{
  "pageSize": "The maximum number of results to return at one time.",
  "marker": "A marker used to get the next set of results."
}
"""
ListTargetsForPolicy(args) = iot("POST", "/policy-targets/{policyName}", args)

"""
    ListThingTypes()

Lists the existing thing types.

Optional Parameters
{
  "thingTypeName": "The name of the thing type.",
  "maxResults": "The maximum number of results to return in this operation.",
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListThingTypes() = iot("GET", "/thing-types")
ListThingTypes(args) = iot("GET", "/thing-types", args)

"""
    TransferCertificate()

Transfers the specified certificate to the specified AWS account. You can cancel the transfer until it is acknowledged by the recipient. No notification is sent to the transfer destination's account. It is up to the caller to notify the transfer target. The certificate being transferred must not be in the ACTIVE state. You can use the UpdateCertificate API to deactivate it. The certificate must not have any policies attached to it. You can use the DetachPrincipalPolicy API to detach them.

Required Parameters
{
  "certificateId": "The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)",
  "targetAwsAccount": "The AWS account."
}

Optional Parameters
{
  "transferMessage": "The transfer message."
}
"""
TransferCertificate(args) = iot("PATCH", "/transfer-certificate/{certificateId}", args)

"""
    CreateCertificateFromCsr()

Creates an X.509 certificate using the specified certificate signing request.  Note: The CSR must include a public key that is either an RSA key with a length of at least 2048 bits or an ECC key from NIST P-256 or NIST P-384 curves.   Note: Reusing the same certificate signing request (CSR) results in a distinct certificate. You can create multiple certificates in a batch by creating a directory, copying multiple .csr files into that directory, and then specifying that directory on the command line. The following commands show how to create a batch of certificates given a batch of CSRs. Assuming a set of CSRs are located inside of the directory my-csr-directory: On Linux and OS X, the command is:   ls my-csr-directory/ | xargs -I {} aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/{} This command lists all of the CSRs in my-csr-directory and pipes each CSR file name to the aws iot create-certificate-from-csr AWS CLI command to create a certificate for the corresponding CSR. The aws iot create-certificate-from-csr part of the command can also be run in parallel to speed up the certificate creation process:   ls my-csr-directory/ | xargs -P 10 -I {} aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/{} On Windows PowerShell, the command to create certificates for all CSRs in my-csr-directory is: &gt; ls -Name my-csr-directory | %{aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/ _} On a Windows command prompt, the command to create certificates for all CSRs in my-csr-directory is: &gt; forfiles /p my-csr-directory /c "cmd /c aws iot create-certificate-from-csr --certificate-signing-request file://@path"

Required Parameters
{
  "certificateSigningRequest": "The certificate signing request (CSR)."
}

Optional Parameters
{
  "setAsActive": "Specifies whether the certificate is active."
}
"""
CreateCertificateFromCsr(args) = iot("POST", "/certificates", args)

"""
    GetPolicyVersion()

Gets information about the specified policy version.

Required Parameters
{
  "policyName": "The name of the policy.",
  "policyVersionId": "The policy version ID."
}
"""
GetPolicyVersion(args) = iot("GET", "/policies/{policyName}/version/{policyVersionId}", args)

"""
    DeleteDynamicThingGroup()

Deletes a dynamic thing group.

Required Parameters
{
  "thingGroupName": "The name of the dynamic thing group to delete."
}

Optional Parameters
{
  "expectedVersion": "The expected version of the dynamic thing group to delete."
}
"""
DeleteDynamicThingGroup(args) = iot("DELETE", "/dynamic-thing-groups/{thingGroupName}", args)

"""
    ListTopicRules()

Lists the rules for the specific topic.

Optional Parameters
{
  "ruleDisabled": "Specifies whether the rule is disabled.",
  "topic": "The topic.",
  "maxResults": "The maximum number of results to return.",
  "nextToken": "A token used to retrieve the next value."
}
"""
ListTopicRules() = iot("GET", "/rules")
ListTopicRules(args) = iot("GET", "/rules", args)

"""
    DescribeProvisioningTemplate()

Returns information about a fleet provisioning template.

Required Parameters
{
  "templateName": "The name of the fleet provisioning template."
}
"""
DescribeProvisioningTemplate(args) = iot("GET", "/provisioning-templates/{templateName}", args)

"""
    ListIndices()

Lists the search indices.

Optional Parameters
{
  "maxResults": "The maximum number of results to return at one time.",
  "nextToken": "The token used to get the next set of results, or null if there are no additional results."
}
"""
ListIndices() = iot("GET", "/indices")
ListIndices(args) = iot("GET", "/indices", args)

"""
    DescribeThingGroup()

Describe a thing group.

Required Parameters
{
  "thingGroupName": "The name of the thing group."
}
"""
DescribeThingGroup(args) = iot("GET", "/thing-groups/{thingGroupName}", args)

"""
    StopThingRegistrationTask()

Cancels a bulk thing provisioning task.

Required Parameters
{
  "taskId": "The bulk thing provisioning task ID."
}
"""
StopThingRegistrationTask(args) = iot("PUT", "/thing-registration-tasks/{taskId}/cancel", args)

"""
    DescribeMitigationAction()

Gets information about a mitigation action.

Required Parameters
{
  "actionName": "The friendly name that uniquely identifies the mitigation action."
}
"""
DescribeMitigationAction(args) = iot("GET", "/mitigationactions/actions/{actionName}", args)

"""
    ListThingGroupsForThing()

List the thing groups to which the specified thing belongs.

Required Parameters
{
  "thingName": "The thing name."
}

Optional Parameters
{
  "maxResults": "The maximum number of results to return at one time.",
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListThingGroupsForThing(args) = iot("GET", "/things/{thingName}/thing-groups", args)

"""
    TestInvokeAuthorizer()

Tests a custom authorization behavior by invoking a specified custom authorizer. Use this to test and debug the custom authorization behavior of devices that connect to the AWS IoT device gateway.

Required Parameters
{
  "authorizerName": "The custom authorizer name."
}

Optional Parameters
{
  "token": "The token returned by your custom authentication service.",
  "httpContext": "Specifies a test HTTP authorization request.",
  "mqttContext": "Specifies a test MQTT authorization request.",
  "tokenSignature": "The signature made with the token and your custom authentication service's private key.",
  "tlsContext": "Specifies a test TLS authorization request."
}
"""
TestInvokeAuthorizer(args) = iot("POST", "/authorizer/{authorizerName}/test", args)

"""
    ListAuthorizers()

Lists the authorizers registered in your account.

Optional Parameters
{
  "ascendingOrder": "Return the list of authorizers in ascending alphabetical order.",
  "pageSize": "The maximum number of results to return at one time.",
  "status": "The status of the list authorizers request.",
  "marker": "A marker used to get the next set of results."
}
"""
ListAuthorizers() = iot("GET", "/authorizers/")
ListAuthorizers(args) = iot("GET", "/authorizers/", args)

"""
    CancelAuditTask()

Cancels an audit that is in progress. The audit can be either scheduled or on-demand. If the audit is not in progress, an "InvalidRequestException" occurs.

Required Parameters
{
  "taskId": "The ID of the audit you want to cancel. You can only cancel an audit that is \"IN_PROGRESS\"."
}
"""
CancelAuditTask(args) = iot("PUT", "/audit/tasks/{taskId}/cancel", args)

"""
    CreateProvisioningTemplate()

Creates a fleet provisioning template.

Required Parameters
{
  "provisioningRoleArn": "The role ARN for the role associated with the fleet provisioning template. This IoT role grants permission to provision a device.",
  "templateName": "The name of the fleet provisioning template.",
  "templateBody": "The JSON formatted contents of the fleet provisioning template."
}

Optional Parameters
{
  "enabled": "True to enable the fleet provisioning template, otherwise false.",
  "tags": "Metadata which can be used to manage the fleet provisioning template.  For URI Request parameters use format: ...key1=value1&amp;key2=value2... For the CLI command-line parameter use format: &amp;&amp;tags \"key1=value1&amp;key2=value2...\" For the cli-input-json file use format: \"tags\": \"key1=value1&amp;key2=value2...\" ",
  "description": "The description of the fleet provisioning template."
}
"""
CreateProvisioningTemplate(args) = iot("POST", "/provisioning-templates", args)

"""
    ListBillingGroups()

Lists the billing groups you have created.

Optional Parameters
{
  "namePrefixFilter": "Limit the results to billing groups whose names have the given prefix.",
  "maxResults": "The maximum number of results to return per request.",
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListBillingGroups() = iot("GET", "/billing-groups")
ListBillingGroups(args) = iot("GET", "/billing-groups", args)

"""
    ListScheduledAudits()

Lists all of your scheduled audits.

Optional Parameters
{
  "maxResults": "The maximum number of results to return at one time. The default is 25.",
  "nextToken": "The token for the next set of results."
}
"""
ListScheduledAudits() = iot("GET", "/audit/scheduledaudits")
ListScheduledAudits(args) = iot("GET", "/audit/scheduledaudits", args)

"""
    ListTargetsForSecurityProfile()

Lists the targets (thing groups) associated with a given Device Defender security profile.

Required Parameters
{
  "securityProfileName": "The security profile."
}

Optional Parameters
{
  "maxResults": "The maximum number of results to return at one time.",
  "nextToken": "The token for the next set of results."
}
"""
ListTargetsForSecurityProfile(args) = iot("GET", "/security-profiles/{securityProfileName}/targets", args)

"""
    CreateRoleAlias()

Creates a role alias.

Required Parameters
{
  "roleArn": "The role ARN.",
  "roleAlias": "The role alias that points to a role ARN. This allows you to change the role without having to update the device."
}

Optional Parameters
{
  "credentialDurationSeconds": "How long (in seconds) the credentials will be valid."
}
"""
CreateRoleAlias(args) = iot("POST", "/role-aliases/{roleAlias}", args)

"""
    CreateBillingGroup()

Creates a billing group.

Required Parameters
{
  "billingGroupName": "The name you wish to give to the billing group."
}

Optional Parameters
{
  "tags": "Metadata which can be used to manage the billing group.",
  "billingGroupProperties": "The properties of the billing group."
}
"""
CreateBillingGroup(args) = iot("POST", "/billing-groups/{billingGroupName}", args)

"""
    DeleteJob()

Deletes a job and its related job executions. Deleting a job may take time, depending on the number of job executions created for the job and various other factors. While the job is being deleted, the status of the job will be shown as "DELETION_IN_PROGRESS". Attempting to delete or cancel a job whose status is already "DELETION_IN_PROGRESS" will result in an error. Only 10 jobs may have status "DELETION_IN_PROGRESS" at the same time, or a LimitExceededException will occur.

Required Parameters
{
  "jobId": "The ID of the job to be deleted. After a job deletion is completed, you may reuse this jobId when you create a new job. However, this is not recommended, and you must ensure that your devices are not using the jobId to refer to the deleted job."
}

Optional Parameters
{
  "force": "(Optional) When true, you can delete a job which is \"IN_PROGRESS\". Otherwise, you can only delete a job which is in a terminal state (\"COMPLETED\" or \"CANCELED\") or an exception will occur. The default is false.  Deleting a job which is \"IN_PROGRESS\", will cause a device which is executing the job to be unable to access job information or update the job execution status. Use caution and ensure that each device executing a job which is deleted is able to recover to a valid state. "
}
"""
DeleteJob(args) = iot("DELETE", "/jobs/{jobId}", args)

"""
    StartThingRegistrationTask()

Creates a bulk thing provisioning task.

Required Parameters
{
  "roleArn": "The IAM role ARN that grants permission the input file.",
  "inputFileKey": "The name of input file within the S3 bucket. This file contains a newline delimited JSON file. Each line contains the parameter values to provision one device (thing).",
  "inputFileBucket": "The S3 bucket that contains the input file.",
  "templateBody": "The provisioning template."
}
"""
StartThingRegistrationTask(args) = iot("POST", "/thing-registration-tasks", args)

"""
    RejectCertificateTransfer()

Rejects a pending certificate transfer. After AWS IoT rejects a certificate transfer, the certificate status changes from PENDING_TRANSFER to INACTIVE. To check for pending certificate transfers, call ListCertificates to enumerate your certificates. This operation can only be called by the transfer destination. After it is called, the certificate will be returned to the source's account in the INACTIVE state.

Required Parameters
{
  "certificateId": "The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)"
}

Optional Parameters
{
  "rejectReason": "The reason the certificate transfer was rejected."
}
"""
RejectCertificateTransfer(args) = iot("PATCH", "/reject-certificate-transfer/{certificateId}", args)

"""
    AttachThingPrincipal()

Attaches the specified principal to the specified thing. A principal can be X.509 certificates, IAM users, groups, and roles, Amazon Cognito identities or federated identities.

Required Parameters
{
  "thingName": "The name of the thing.",
  "principal": "The principal, which can be a certificate ARN (as returned from the CreateCertificate operation) or an Amazon Cognito ID."
}
"""
AttachThingPrincipal(args) = iot("PUT", "/things/{thingName}/principals", args)

"""
    DescribeStream()

Gets information about a stream.

Required Parameters
{
  "streamId": "The stream ID."
}
"""
DescribeStream(args) = iot("GET", "/streams/{streamId}", args)

"""
    AddThingToBillingGroup()

Adds a thing to a billing group.

Optional Parameters
{
  "billingGroupArn": "The ARN of the billing group.",
  "thingName": "The name of the thing to be added to the billing group.",
  "billingGroupName": "The name of the billing group.",
  "thingArn": "The ARN of the thing to be added to the billing group."
}
"""
AddThingToBillingGroup() = iot("PUT", "/billing-groups/addThingToBillingGroup")
AddThingToBillingGroup(args) = iot("PUT", "/billing-groups/addThingToBillingGroup", args)

"""
    StartOnDemandAuditTask()

Starts an on-demand Device Defender audit.

Required Parameters
{
  "targetCheckNames": "Which checks are performed during the audit. The checks you specify must be enabled for your account or an exception occurs. Use DescribeAccountAuditConfiguration to see the list of all checks, including those that are enabled or UpdateAccountAuditConfiguration to select which checks are enabled."
}
"""
StartOnDemandAuditTask(args) = iot("POST", "/audit/tasks", args)

"""
    ListThingsInThingGroup()

Lists the things in the specified group.

Required Parameters
{
  "thingGroupName": "The thing group name."
}

Optional Parameters
{
  "recursive": "When true, list things in this thing group and in all child groups as well.",
  "maxResults": "The maximum number of results to return at one time.",
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListThingsInThingGroup(args) = iot("GET", "/thing-groups/{thingGroupName}/things", args)

"""
    ListThingsInBillingGroup()

Lists the things you have added to the given billing group.

Required Parameters
{
  "billingGroupName": "The name of the billing group."
}

Optional Parameters
{
  "maxResults": "The maximum number of results to return per request.",
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListThingsInBillingGroup(args) = iot("GET", "/billing-groups/{billingGroupName}/things", args)

"""
    ListPolicyVersions()

Lists the versions of the specified policy and identifies the default version.

Required Parameters
{
  "policyName": "The policy name."
}
"""
ListPolicyVersions(args) = iot("GET", "/policies/{policyName}/version", args)

"""
    CreateDynamicThingGroup()

Creates a dynamic thing group.

Required Parameters
{
  "thingGroupName": "The dynamic thing group name to create.",
  "queryString": "The dynamic thing group search query string. See Query Syntax for information about query string syntax."
}

Optional Parameters
{
  "queryVersion": "The dynamic thing group query version.  Currently one query version is supported: \"2017-09-30\". If not specified, the query version defaults to this value. ",
  "thingGroupProperties": "The dynamic thing group properties.",
  "indexName": "The dynamic thing group index name.  Currently one index is supported: \"AWS_Things\". ",
  "tags": "Metadata which can be used to manage the dynamic thing group."
}
"""
CreateDynamicThingGroup(args) = iot("POST", "/dynamic-thing-groups/{thingGroupName}", args)

"""
    DescribeCACertificate()

Describes a registered CA certificate.

Required Parameters
{
  "certificateId": "The CA certificate identifier."
}
"""
DescribeCACertificate(args) = iot("GET", "/cacertificate/{caCertificateId}", args)

"""
    RegisterCACertificate()

Registers a CA certificate with AWS IoT. This CA certificate can then be used to sign device certificates, which can be then registered with AWS IoT. You can register up to 10 CA certificates per AWS account that have the same subject field. This enables you to have up to 10 certificate authorities sign your device certificates. If you have more than one CA certificate registered, make sure you pass the CA certificate when you register your device certificates with the RegisterCertificate API.

Required Parameters
{
  "verificationCertificate": "The private key verification certificate.",
  "caCertificate": "The CA certificate."
}

Optional Parameters
{
  "allowAutoRegistration": "Allows this CA certificate to be used for auto registration of device certificates.",
  "registrationConfig": "Information about the registration configuration.",
  "setAsActive": "A boolean value that specifies if the CA certificate is set to active."
}
"""
RegisterCACertificate(args) = iot("POST", "/cacertificate", args)

"""
    UpdateRoleAlias()

Updates a role alias.

Required Parameters
{
  "roleAlias": "The role alias to update."
}

Optional Parameters
{
  "roleArn": "The role ARN.",
  "credentialDurationSeconds": "The number of seconds the credential will be valid."
}
"""
UpdateRoleAlias(args) = iot("PUT", "/role-aliases/{roleAlias}", args)

"""
    DeleteThing()

Deletes the specified thing. Returns successfully with no error if the deletion is successful or you specify a thing that doesn't exist.

Required Parameters
{
  "thingName": "The name of the thing to delete."
}

Optional Parameters
{
  "expectedVersion": "The expected version of the thing record in the registry. If the version of the record in the registry does not match the expected version specified in the request, the DeleteThing request is rejected with a VersionConflictException."
}
"""
DeleteThing(args) = iot("DELETE", "/things/{thingName}", args)

"""
    DeleteProvisioningTemplateVersion()

Deletes a fleet provisioning template version.

Required Parameters
{
  "versionId": "The fleet provisioning template version ID to delete.",
  "templateName": "The name of the fleet provisioning template version to delete."
}
"""
DeleteProvisioningTemplateVersion(args) = iot("DELETE", "/provisioning-templates/{templateName}/versions/{versionId}", args)

"""
    TestAuthorization()

Tests if a specified principal is authorized to perform an AWS IoT action on a specified resource. Use this to test and debug the authorization behavior of devices that connect to the AWS IoT device gateway.

Required Parameters
{
  "authInfos": "A list of authorization info objects. Simulating authorization will create a response for each authInfo object in the list."
}

Optional Parameters
{
  "policyNamesToSkip": "When testing custom authorization, the policies specified here are treated as if they are not attached to the principal being authorized.",
  "cognitoIdentityPoolId": "The Cognito identity pool ID.",
  "clientId": "The MQTT client ID.",
  "principal": "The principal.",
  "policyNamesToAdd": "When testing custom authorization, the policies specified here are treated as if they are attached to the principal being authorized."
}
"""
TestAuthorization(args) = iot("POST", "/test-authorization", args)

"""
    ValidateSecurityProfileBehaviors()

Validates a Device Defender security profile behaviors specification.

Required Parameters
{
  "behaviors": "Specifies the behaviors that, when violated by a device (thing), cause an alert."
}
"""
ValidateSecurityProfileBehaviors(args) = iot("POST", "/security-profile-behaviors/validate", args)

"""
    ListStreams()

Lists all of the streams in your AWS account.

Optional Parameters
{
  "ascendingOrder": "Set to true to return the list of streams in ascending order.",
  "maxResults": "The maximum number of results to return at a time.",
  "nextToken": "A token used to get the next set of results."
}
"""
ListStreams() = iot("GET", "/streams")
ListStreams(args) = iot("GET", "/streams", args)

"""
    GetTopicRuleDestination()

Gets information about a topic rule destination.

Required Parameters
{
  "arn": "The ARN of the topic rule destination."
}
"""
GetTopicRuleDestination(args) = iot("GET", "/destinations/{arn+}", args)

"""
    RemoveThingFromBillingGroup()

Removes the given thing from the billing group.

Optional Parameters
{
  "billingGroupArn": "The ARN of the billing group.",
  "thingName": "The name of the thing to be removed from the billing group.",
  "billingGroupName": "The name of the billing group.",
  "thingArn": "The ARN of the thing to be removed from the billing group."
}
"""
RemoveThingFromBillingGroup() = iot("PUT", "/billing-groups/removeThingFromBillingGroup")
RemoveThingFromBillingGroup(args) = iot("PUT", "/billing-groups/removeThingFromBillingGroup", args)

"""
    DeleteAuthorizer()

Deletes an authorizer.

Required Parameters
{
  "authorizerName": "The name of the authorizer to delete."
}
"""
DeleteAuthorizer(args) = iot("DELETE", "/authorizer/{authorizerName}", args)

"""
    ListProvisioningTemplates()

Lists the fleet provisioning templates in your AWS account.

Optional Parameters
{
  "maxResults": "The maximum number of results to return at one time.",
  "nextToken": "A token to retrieve the next set of results."
}
"""
ListProvisioningTemplates() = iot("GET", "/provisioning-templates")
ListProvisioningTemplates(args) = iot("GET", "/provisioning-templates", args)

"""
    AddThingToThingGroup()

Adds a thing to a thing group.

Optional Parameters
{
  "thingGroupName": "The name of the group to which you are adding a thing.",
  "overrideDynamicGroups": "Override dynamic thing groups with static thing groups when 10-group limit is reached. If a thing belongs to 10 thing groups, and one or more of those groups are dynamic thing groups, adding a thing to a static group removes the thing from the last dynamic group.",
  "thingName": "The name of the thing to add to a group.",
  "thingGroupArn": "The ARN of the group to which you are adding a thing.",
  "thingArn": "The ARN of the thing to add to a group."
}
"""
AddThingToThingGroup() = iot("PUT", "/thing-groups/addThingToThingGroup")
AddThingToThingGroup(args) = iot("PUT", "/thing-groups/addThingToThingGroup", args)

"""
    UpdateScheduledAudit()

Updates a scheduled audit, including which checks are performed and how often the audit takes place.

Required Parameters
{
  "scheduledAuditName": "The name of the scheduled audit. (Max. 128 chars)"
}

Optional Parameters
{
  "dayOfMonth": "The day of the month on which the scheduled audit takes place. Can be \"1\" through \"31\" or \"LAST\". This field is required if the \"frequency\" parameter is set to \"MONTHLY\". If days 29-31 are specified, and the month does not have that many days, the audit takes place on the \"LAST\" day of the month.",
  "frequency": "How often the scheduled audit takes place. Can be one of \"DAILY\", \"WEEKLY\", \"BIWEEKLY\", or \"MONTHLY\". The start time of each audit is determined by the system.",
  "dayOfWeek": "The day of the week on which the scheduled audit takes place. Can be one of \"SUN\", \"MON\", \"TUE\", \"WED\", \"THU\", \"FRI\", or \"SAT\". This field is required if the \"frequency\" parameter is set to \"WEEKLY\" or \"BIWEEKLY\".",
  "targetCheckNames": "Which checks are performed during the scheduled audit. Checks must be enabled for your account. (Use DescribeAccountAuditConfiguration to see the list of all checks, including those that are enabled or use UpdateAccountAuditConfiguration to select which checks are enabled.)"
}
"""
UpdateScheduledAudit(args) = iot("PATCH", "/audit/scheduledaudits/{scheduledAuditName}", args)

"""
    UpdateCertificate()

Updates the status of the specified certificate. This operation is idempotent. Moving a certificate from the ACTIVE state (including REVOKED) will not disconnect currently connected devices, but these devices will be unable to reconnect. The ACTIVE state is required to authenticate devices connecting to AWS IoT using a certificate.

Required Parameters
{
  "newStatus": "The new status.  Note: Setting the status to PENDING_TRANSFER or PENDING_ACTIVATION will result in an exception being thrown. PENDING_TRANSFER and PENDING_ACTIVATION are statuses used internally by AWS IoT. They are not intended for developer use.  Note: The status value REGISTER_INACTIVE is deprecated and should not be used.",
  "certificateId": "The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)"
}
"""
UpdateCertificate(args) = iot("PUT", "/certificates/{certificateId}", args)

"""
    UpdateAuthorizer()

Updates an authorizer.

Required Parameters
{
  "authorizerName": "The authorizer name."
}

Optional Parameters
{
  "status": "The status of the update authorizer request.",
  "tokenKeyName": "The key used to extract the token from the HTTP headers. ",
  "authorizerFunctionArn": "The ARN of the authorizer's Lambda function.",
  "tokenSigningPublicKeys": "The public keys used to verify the token signature."
}
"""
UpdateAuthorizer(args) = iot("PUT", "/authorizer/{authorizerName}", args)

"""
    CreateScheduledAudit()

Creates a scheduled audit that is run at a specified time interval.

Required Parameters
{
  "scheduledAuditName": "The name you want to give to the scheduled audit. (Max. 128 chars)",
  "frequency": "How often the scheduled audit takes place. Can be one of \"DAILY\", \"WEEKLY\", \"BIWEEKLY\" or \"MONTHLY\". The start time of each audit is determined by the system.",
  "targetCheckNames": "Which checks are performed during the scheduled audit. Checks must be enabled for your account. (Use DescribeAccountAuditConfiguration to see the list of all checks, including those that are enabled or use UpdateAccountAuditConfiguration to select which checks are enabled.)"
}

Optional Parameters
{
  "dayOfMonth": "The day of the month on which the scheduled audit takes place. Can be \"1\" through \"31\" or \"LAST\". This field is required if the \"frequency\" parameter is set to \"MONTHLY\". If days 29-31 are specified, and the month does not have that many days, the audit takes place on the \"LAST\" day of the month.",
  "dayOfWeek": "The day of the week on which the scheduled audit takes place. Can be one of \"SUN\", \"MON\", \"TUE\", \"WED\", \"THU\", \"FRI\", or \"SAT\". This field is required if the \"frequency\" parameter is set to \"WEEKLY\" or \"BIWEEKLY\".",
  "tags": "Metadata that can be used to manage the scheduled audit."
}
"""
CreateScheduledAudit(args) = iot("POST", "/audit/scheduledaudits/{scheduledAuditName}", args)

"""
    ListPrincipalThings()

Lists the things associated with the specified principal. A principal can be X.509 certificates, IAM users, groups, and roles, Amazon Cognito identities or federated identities. 

Required Parameters
{
  "principal": "The principal."
}

Optional Parameters
{
  "maxResults": "The maximum number of results to return in this operation.",
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListPrincipalThings(args) = iot("GET", "/principals/things", args)

"""
    DescribeAuditMitigationActionsTask()

Gets information about an audit mitigation task that is used to apply mitigation actions to a set of audit findings. Properties include the actions being applied, the audit checks to which they're being applied, the task status, and aggregated task statistics.

Required Parameters
{
  "taskId": "The unique identifier for the audit mitigation task."
}
"""
DescribeAuditMitigationActionsTask(args) = iot("GET", "/audit/mitigationactions/tasks/{taskId}", args)

"""
    ListRoleAliases()

Lists the role aliases registered in your account.

Optional Parameters
{
  "ascendingOrder": "Return the list of role aliases in ascending alphabetical order.",
  "pageSize": "The maximum number of results to return at one time.",
  "marker": "A marker used to get the next set of results."
}
"""
ListRoleAliases() = iot("GET", "/role-aliases")
ListRoleAliases(args) = iot("GET", "/role-aliases", args)

"""
    CreateStream()

Creates a stream for delivering one or more large files in chunks over MQTT. A stream transports data bytes in chunks or blocks packaged as MQTT messages from a source like S3. You can have one or more files associated with a stream.

Required Parameters
{
  "roleArn": "An IAM role that allows the IoT service principal assumes to access your S3 files.",
  "streamId": "The stream ID.",
  "files": "The files to stream."
}

Optional Parameters
{
  "tags": "Metadata which can be used to manage streams.",
  "description": "A description of the stream."
}
"""
CreateStream(args) = iot("POST", "/streams/{streamId}", args)

"""
    EnableTopicRule()

Enables the rule.

Required Parameters
{
  "ruleName": "The name of the topic rule to enable."
}
"""
EnableTopicRule(args) = iot("POST", "/rules/{ruleName}/enable", args)

"""
    DetachSecurityProfile()

Disassociates a Device Defender security profile from a thing group or from this account.

Required Parameters
{
  "securityProfileTargetArn": "The ARN of the thing group from which the security profile is detached.",
  "securityProfileName": "The security profile that is detached."
}
"""
DetachSecurityProfile(args) = iot("DELETE", "/security-profiles/{securityProfileName}/targets", args)

"""
    GetCardinality()

Returns the approximate count of unique values that match the query.

Required Parameters
{
  "queryString": "The search query."
}

Optional Parameters
{
  "queryVersion": "The query version.",
  "indexName": "The name of the index to search.",
  "aggregationField": "The field to aggregate."
}
"""
GetCardinality(args) = iot("POST", "/indices/cardinality", args)

"""
    UpdateAccountAuditConfiguration()

Configures or reconfigures the Device Defender audit settings for this account. Settings include how audit notifications are sent and which audit checks are enabled or disabled.

Optional Parameters
{
  "roleArn": "The ARN of the role that grants permission to AWS IoT to access information about your devices, policies, certificates and other items as required when performing an audit.",
  "auditNotificationTargetConfigurations": "Information about the targets to which audit notifications are sent.",
  "auditCheckConfigurations": "Specifies which audit checks are enabled and disabled for this account. Use DescribeAccountAuditConfiguration to see the list of all checks, including those that are currently enabled. Some data collection might start immediately when certain checks are enabled. When a check is disabled, any data collected so far in relation to the check is deleted. You cannot disable a check if it is used by any scheduled audit. You must first delete the check from the scheduled audit or delete the scheduled audit itself. On the first call to UpdateAccountAuditConfiguration, this parameter is required and must specify at least one enabled check."
}
"""
UpdateAccountAuditConfiguration() = iot("PATCH", "/audit/configuration")
UpdateAccountAuditConfiguration(args) = iot("PATCH", "/audit/configuration", args)

"""
    DeleteDomainConfiguration()

Deletes the specified domain configuration.  The domain configuration feature is in public preview and is subject to change. 

Required Parameters
{
  "domainConfigurationName": "The name of the domain configuration to be deleted."
}
"""
DeleteDomainConfiguration(args) = iot("DELETE", "/domainConfigurations/{domainConfigurationName}", args)

"""
    CreateKeysAndCertificate()

Creates a 2048-bit RSA key pair and issues an X.509 certificate using the issued public key. You can also call CreateKeysAndCertificate over MQTT from a device, for more information, see Provisioning MQTT API.  Note This is the only time AWS IoT issues the private key for this certificate, so it is important to keep it in a secure location.

Optional Parameters
{
  "setAsActive": "Specifies whether the certificate is active."
}
"""
CreateKeysAndCertificate() = iot("POST", "/keys-and-certificate")
CreateKeysAndCertificate(args) = iot("POST", "/keys-and-certificate", args)

"""
    UpdateSecurityProfile()

Updates a Device Defender security profile.

Required Parameters
{
  "securityProfileName": "The name of the security profile you want to update."
}

Optional Parameters
{
  "deleteAlertTargets": "If true, delete all alertTargets defined for this security profile. If any alertTargets are defined in the current invocation, an exception occurs.",
  "behaviors": "Specifies the behaviors that, when violated by a device (thing), cause an alert.",
  "alertTargets": "Where the alerts are sent. (Alerts are always sent to the console.)",
  "deleteBehaviors": "If true, delete all behaviors defined for this security profile. If any behaviors are defined in the current invocation, an exception occurs.",
  "expectedVersion": "The expected version of the security profile. A new version is generated whenever the security profile is updated. If you specify a value that is different from the actual version, a VersionConflictException is thrown.",
  "deleteAdditionalMetricsToRetain": "If true, delete all additionalMetricsToRetain defined for this security profile. If any additionalMetricsToRetain are defined in the current invocation, an exception occurs.",
  "additionalMetricsToRetain": "A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's behaviors, but it is also retained for any metric specified here.",
  "securityProfileDescription": "A description of the security profile."
}
"""
UpdateSecurityProfile(args) = iot("PATCH", "/security-profiles/{securityProfileName}", args)

"""
    ListThings()

Lists your things. Use the attributeName and attributeValue parameters to filter your things. For example, calling ListThings with attributeName=Color and attributeValue=Red retrieves all things in the registry that contain an attribute Color with the value Red. 

Optional Parameters
{
  "attributeValue": "The attribute value used to search for things.",
  "thingTypeName": "The name of the thing type used to search for things.",
  "attributeName": "The attribute name used to search for things.",
  "maxResults": "The maximum number of results to return in this operation.",
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListThings() = iot("GET", "/things")
ListThings(args) = iot("GET", "/things", args)

"""
    UpdateTopicRuleDestination()

Updates a topic rule destination. You use this to change the status, endpoint URL, or confirmation URL of the destination.

Required Parameters
{
  "status": "The status of the topic rule destination. Valid values are:  IN_PROGRESS  A topic rule destination was created but has not been confirmed. You can set status to IN_PROGRESS by calling UpdateTopicRuleDestination. Calling UpdateTopicRuleDestination causes a new confirmation challenge to be sent to your confirmation endpoint.  ENABLED  Confirmation was completed, and traffic to this destination is allowed. You can set status to DISABLED by calling UpdateTopicRuleDestination.  DISABLED  Confirmation was completed, and traffic to this destination is not allowed. You can set status to ENABLED by calling UpdateTopicRuleDestination.  ERROR  Confirmation could not be completed, for example if the confirmation timed out. You can call GetTopicRuleDestination for details about the error. You can set status to IN_PROGRESS by calling UpdateTopicRuleDestination. Calling UpdateTopicRuleDestination causes a new confirmation challenge to be sent to your confirmation endpoint.  ",
  "arn": "The ARN of the topic rule destination."
}
"""
UpdateTopicRuleDestination(args) = iot("PATCH", "/destinations", args)

"""
    ListCertificatesByCA()

List the device certificates signed by the specified CA certificate.

Required Parameters
{
  "caCertificateId": "The ID of the CA certificate. This operation will list all registered device certificate that were signed by this CA certificate."
}

Optional Parameters
{
  "ascendingOrder": "Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.",
  "pageSize": "The result page size.",
  "marker": "The marker for the next set of results."
}
"""
ListCertificatesByCA(args) = iot("GET", "/certificates-by-ca/{caCertificateId}", args)

"""
    ListJobExecutionsForThing()

Lists the job executions for the specified thing.

Required Parameters
{
  "thingName": "The thing name."
}

Optional Parameters
{
  "status": "An optional filter that lets you search for jobs that have the specified status.",
  "maxResults": "The maximum number of results to be returned per request.",
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListJobExecutionsForThing(args) = iot("GET", "/things/{thingName}/jobs", args)

"""
    UpdateBillingGroup()

Updates information about the billing group.

Required Parameters
{
  "billingGroupName": "The name of the billing group.",
  "billingGroupProperties": "The properties of the billing group."
}

Optional Parameters
{
  "expectedVersion": "The expected version of the billing group. If the version of the billing group does not match the expected version specified in the request, the UpdateBillingGroup request is rejected with a VersionConflictException."
}
"""
UpdateBillingGroup(args) = iot("PATCH", "/billing-groups/{billingGroupName}", args)

"""
    ListActiveViolations()

Lists the active violations for a given Device Defender security profile.

Optional Parameters
{
  "thingName": "The name of the thing whose active violations are listed.",
  "maxResults": "The maximum number of results to return at one time.",
  "securityProfileName": "The name of the Device Defender security profile for which violations are listed.",
  "nextToken": "The token for the next set of results."
}
"""
ListActiveViolations() = iot("GET", "/active-violations")
ListActiveViolations(args) = iot("GET", "/active-violations", args)

"""
    DeleteCACertificate()

Deletes a registered CA certificate.

Required Parameters
{
  "certificateId": "The ID of the certificate to delete. (The last part of the certificate ARN contains the certificate ID.)"
}
"""
DeleteCACertificate(args) = iot("DELETE", "/cacertificate/{caCertificateId}", args)

"""
    DescribeAccountAuditConfiguration()

Gets information about the Device Defender audit settings for this account. Settings include how audit notifications are sent and which audit checks are enabled or disabled.
"""
DescribeAccountAuditConfiguration() = iot("GET", "/audit/configuration")
DescribeAccountAuditConfiguration(args) = iot("GET", "/audit/configuration", args)

"""
    CreateProvisioningClaim()

Creates a provisioning claim.

Required Parameters
{
  "templateName": "The name of the provisioning template to use."
}
"""
CreateProvisioningClaim(args) = iot("POST", "/provisioning-templates/{templateName}/provisioning-claim", args)

"""
    CreateJob()

Creates a job.

Required Parameters
{
  "jobId": "A job identifier which must be unique for your AWS account. We recommend using a UUID. Alpha-numeric characters, \"-\" and \"_\" are valid for use here.",
  "targets": "A list of things and thing groups to which the job should be sent."
}

Optional Parameters
{
  "document": "The job document.  If the job document resides in an S3 bucket, you must use a placeholder link when specifying the document. The placeholder link is of the following form:   {aws:iot:s3-presigned-url:https://s3.amazonaws.com/bucket/key}  where bucket is your bucket name and key is the object in the bucket to which you are linking. ",
  "documentSource": "An S3 link to the job document.",
  "targetSelection": "Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a thing when the thing is added to a target group, even after the job was completed by all things originally in the group.",
  "jobExecutionsRolloutConfig": "Allows you to create a staged rollout of the job.",
  "presignedUrlConfig": "Configuration information for pre-signed S3 URLs.",
  "abortConfig": "Allows you to create criteria to abort a job.",
  "timeoutConfig": "Specifies the amount of time each device has to finish its execution of the job. The timer is started when the job execution status is set to IN_PROGRESS. If the job execution status is not set to another terminal state before the time expires, it will be automatically set to TIMED_OUT.",
  "tags": "Metadata which can be used to manage the job.",
  "description": "A short text description of the job."
}
"""
CreateJob(args) = iot("PUT", "/jobs/{jobId}", args)

"""
    DeleteTopicRuleDestination()

Deletes a topic rule destination.

Required Parameters
{
  "arn": "The ARN of the topic rule destination to delete."
}
"""
DeleteTopicRuleDestination(args) = iot("DELETE", "/destinations/{arn+}", args)

"""
    ListV2LoggingLevels()

Lists logging levels.

Optional Parameters
{
  "targetType": "The type of resource for which you are configuring logging. Must be THING_Group.",
  "maxResults": "The maximum number of results to return at one time.",
  "nextToken": "The token used to get the next set of results, or null if there are no additional results."
}
"""
ListV2LoggingLevels() = iot("GET", "/v2LoggingLevel")
ListV2LoggingLevels(args) = iot("GET", "/v2LoggingLevel", args)

"""
    DescribeScheduledAudit()

Gets information about a scheduled audit.

Required Parameters
{
  "scheduledAuditName": "The name of the scheduled audit whose information you want to get."
}
"""
DescribeScheduledAudit(args) = iot("GET", "/audit/scheduledaudits/{scheduledAuditName}", args)

"""
    GetEffectivePolicies()

Gets a list of the policies that have an effect on the authorization behavior of the specified device when it connects to the AWS IoT device gateway.

Optional Parameters
{
  "thingName": "The thing name.",
  "cognitoIdentityPoolId": "The Cognito identity pool ID.",
  "principal": "The principal."
}
"""
GetEffectivePolicies() = iot("POST", "/effective-policies")
GetEffectivePolicies(args) = iot("POST", "/effective-policies", args)

"""
    CancelAuditMitigationActionsTask()

Cancels a mitigation action task that is in progress. If the task is not in progress, an InvalidRequestException occurs.

Required Parameters
{
  "taskId": "The unique identifier for the task that you want to cancel. "
}
"""
CancelAuditMitigationActionsTask(args) = iot("PUT", "/audit/mitigationactions/tasks/{taskId}/cancel", args)

"""
    DescribeThing()

Gets information about the specified thing.

Required Parameters
{
  "thingName": "The name of the thing."
}
"""
DescribeThing(args) = iot("GET", "/things/{thingName}", args)

"""
    CancelJob()

Cancels a job.

Required Parameters
{
  "jobId": "The unique identifier you assigned to this job when it was created."
}

Optional Parameters
{
  "reasonCode": "(Optional)A reason code string that explains why the job was canceled.",
  "force": "(Optional) If true job executions with status \"IN_PROGRESS\" and \"QUEUED\" are canceled, otherwise only job executions with status \"QUEUED\" are canceled. The default is false. Canceling a job which is \"IN_PROGRESS\", will cause a device which is executing the job to be unable to update the job execution status. Use caution and ensure that each device executing a job which is canceled is able to recover to a valid state.",
  "comment": "An optional comment string describing why the job was canceled."
}
"""
CancelJob(args) = iot("PUT", "/jobs/{jobId}/cancel", args)

"""
    ListThingPrincipals()

Lists the principals associated with the specified thing. A principal can be X.509 certificates, IAM users, groups, and roles, Amazon Cognito identities or federated identities.

Required Parameters
{
  "thingName": "The name of the thing."
}
"""
ListThingPrincipals(args) = iot("GET", "/things/{thingName}/principals", args)

"""
    SetDefaultPolicyVersion()

Sets the specified version of the specified policy as the policy's default (operative) version. This action affects all certificates to which the policy is attached. To list the principals the policy is attached to, use the ListPrincipalPolicy API.

Required Parameters
{
  "policyName": "The policy name.",
  "policyVersionId": "The policy version ID."
}
"""
SetDefaultPolicyVersion(args) = iot("PATCH", "/policies/{policyName}/version/{policyVersionId}", args)

"""
    DeleteTopicRule()

Deletes the rule.

Required Parameters
{
  "ruleName": "The name of the rule."
}
"""
DeleteTopicRule(args) = iot("DELETE", "/rules/{ruleName}", args)

"""
    CreateThingGroup()

Create a thing group.  This is a control plane operation. See Authorization for information about authorizing control plane actions. 

Required Parameters
{
  "thingGroupName": "The thing group name to create."
}

Optional Parameters
{
  "thingGroupProperties": "The thing group properties.",
  "parentGroupName": "The name of the parent thing group.",
  "tags": "Metadata which can be used to manage the thing group."
}
"""
CreateThingGroup(args) = iot("POST", "/thing-groups/{thingGroupName}", args)

"""
    GetIndexingConfiguration()

Gets the indexing configuration.
"""
GetIndexingConfiguration() = iot("GET", "/indexing/config")
GetIndexingConfiguration(args) = iot("GET", "/indexing/config", args)

"""
    DescribeJob()

Describes a job.

Required Parameters
{
  "jobId": "The unique identifier you assigned to this job when it was created."
}
"""
DescribeJob(args) = iot("GET", "/jobs/{jobId}", args)

"""
    ListJobs()

Lists jobs.

Optional Parameters
{
  "thingGroupName": "A filter that limits the returned jobs to those for the specified group.",
  "targetSelection": "Specifies whether the job will continue to run (CONTINUOUS), or will be complete after all those things specified as targets have completed the job (SNAPSHOT). If continuous, the job may also be run on a thing when a change is detected in a target. For example, a job will run on a thing when the thing is added to a target group, even after the job was completed by all things originally in the group. ",
  "status": "An optional filter that lets you search for jobs that have the specified status.",
  "thingGroupId": "A filter that limits the returned jobs to those for the specified group.",
  "maxResults": "The maximum number of results to return per request.",
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListJobs() = iot("GET", "/jobs")
ListJobs(args) = iot("GET", "/jobs", args)

"""
    ListAuditTasks()

Lists the Device Defender audits that have been performed during a given time period.

Required Parameters
{
  "startTime": "The beginning of the time period. Audit information is retained for a limited time (180 days). Requesting a start time prior to what is retained results in an \"InvalidRequestException\".",
  "endTime": "The end of the time period."
}

Optional Parameters
{
  "taskStatus": "A filter to limit the output to audits with the specified completion status: can be one of \"IN_PROGRESS\", \"COMPLETED\", \"FAILED\", or \"CANCELED\".",
  "maxResults": "The maximum number of results to return at one time. The default is 25.",
  "taskType": "A filter to limit the output to the specified type of audit: can be one of \"ON_DEMAND_AUDIT_TASK\" or \"SCHEDULED__AUDIT_TASK\".",
  "nextToken": "The token for the next set of results."
}
"""
ListAuditTasks(args) = iot("GET", "/audit/tasks", args)

"""
    DescribeEventConfigurations()

Describes event configurations.
"""
DescribeEventConfigurations() = iot("GET", "/event-configurations")
DescribeEventConfigurations(args) = iot("GET", "/event-configurations", args)

"""
    AttachPrincipalPolicy()

Attaches the specified policy to the specified principal (certificate or other credential).  Note: This API is deprecated. Please use AttachPolicy instead.

Required Parameters
{
  "policyName": "The policy name.",
  "principal": "The principal, which can be a certificate ARN (as returned from the CreateCertificate operation) or an Amazon Cognito ID."
}
"""
AttachPrincipalPolicy(args) = iot("PUT", "/principal-policies/{policyName}", args)

"""
    ListPrincipalPolicies()

Lists the policies attached to the specified principal. If you use an Cognito identity, the ID must be in AmazonCognito Identity format.  Note: This API is deprecated. Please use ListAttachedPolicies instead.

Required Parameters
{
  "principal": "The principal."
}

Optional Parameters
{
  "ascendingOrder": "Specifies the order for results. If true, results are returned in ascending creation order.",
  "pageSize": "The result page size.",
  "marker": "The marker for the next set of results."
}
"""
ListPrincipalPolicies(args) = iot("GET", "/principal-policies", args)

"""
    UpdateStream()

Updates an existing stream. The stream version will be incremented by one.

Required Parameters
{
  "streamId": "The stream ID."
}

Optional Parameters
{
  "roleArn": "An IAM role that allows the IoT service principal assumes to access your S3 files.",
  "files": "The files associated with the stream.",
  "description": "The description of the stream."
}
"""
UpdateStream(args) = iot("PUT", "/streams/{streamId}", args)

"""
    TagResource()

Adds to or modifies the tags of the given resource. Tags are metadata which can be used to manage a resource.

Required Parameters
{
  "resourceArn": "The ARN of the resource.",
  "tags": "The new or modified tags for the resource."
}
"""
TagResource(args) = iot("POST", "/tags", args)

"""
    ListTopicRuleDestinations()

Lists all the topic rule destinations in your AWS account.

Optional Parameters
{
  "maxResults": "The maximum number of results to return at one time.",
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListTopicRuleDestinations() = iot("GET", "/destinations")
ListTopicRuleDestinations(args) = iot("GET", "/destinations", args)

"""
    CreatePolicyVersion()

Creates a new version of the specified AWS IoT policy. To update a policy, create a new policy version. A managed policy can have up to five versions. If the policy has five versions, you must use DeletePolicyVersion to delete an existing version before you create a new one. Optionally, you can set the new version as the policy's default version. The default version is the operative version (that is, the version that is in effect for the certificates to which the policy is attached).

Required Parameters
{
  "policyName": "The policy name.",
  "policyDocument": "The JSON document that describes the policy. Minimum length of 1. Maximum length of 2048, excluding whitespace."
}

Optional Parameters
{
  "setAsDefault": "Specifies whether the policy version is set as the default. When this parameter is true, the new policy version becomes the operative version (that is, the version that is in effect for the certificates to which the policy is attached)."
}
"""
CreatePolicyVersion(args) = iot("POST", "/policies/{policyName}/version", args)

"""
    GetRegistrationCode()

Gets a registration code used to register a CA certificate with AWS IoT.
"""
GetRegistrationCode() = iot("GET", "/registrationcode")
GetRegistrationCode(args) = iot("GET", "/registrationcode", args)

"""
    AcceptCertificateTransfer()

Accepts a pending certificate transfer. The default state of the certificate is INACTIVE. To check for pending certificate transfers, call ListCertificates to enumerate your certificates.

Required Parameters
{
  "certificateId": "The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)"
}

Optional Parameters
{
  "setAsActive": "Specifies whether the certificate is active."
}
"""
AcceptCertificateTransfer(args) = iot("PATCH", "/accept-certificate-transfer/{certificateId}", args)

"""
    DescribeSecurityProfile()

Gets information about a Device Defender security profile.

Required Parameters
{
  "securityProfileName": "The name of the security profile whose information you want to get."
}
"""
DescribeSecurityProfile(args) = iot("GET", "/security-profiles/{securityProfileName}", args)

"""
    DetachPolicy()

Detaches a policy from the specified target.

Required Parameters
{
  "policyName": "The policy to detach.",
  "target": "The target from which the policy will be detached."
}
"""
DetachPolicy(args) = iot("POST", "/target-policies/{policyName}", args)

"""
    DetachPrincipalPolicy()

Removes the specified policy from the specified certificate.  Note: This API is deprecated. Please use DetachPolicy instead.

Required Parameters
{
  "policyName": "The name of the policy to detach.",
  "principal": "The principal. If the principal is a certificate, specify the certificate ARN. If the principal is an Amazon Cognito identity, specify the identity ID."
}
"""
DetachPrincipalPolicy(args) = iot("DELETE", "/principal-policies/{policyName}", args)

"""
    DescribeAuditFinding()

Gets information about a single audit finding. Properties include the reason for noncompliance, the severity of the issue, and when the audit that returned the finding was started.

Required Parameters
{
  "findingId": "A unique identifier for a single audit finding. You can use this identifier to apply mitigation actions to the finding."
}
"""
DescribeAuditFinding(args) = iot("GET", "/audit/findings/{findingId}", args)

"""
    RegisterThing()

Provisions a thing in the device registry. RegisterThing calls other AWS IoT control plane APIs. These calls might exceed your account level  AWS IoT Throttling Limits and cause throttle errors. Please contact AWS Customer Support to raise your throttling limits if necessary.

Required Parameters
{
  "templateBody": "The provisioning template. See Provisioning Devices That Have Device Certificates for more information."
}

Optional Parameters
{
  "parameters": "The parameters for provisioning a thing. See Programmatic Provisioning for more information."
}
"""
RegisterThing(args) = iot("POST", "/things", args)

"""
    CreateDomainConfiguration()

Creates a domain configuration.  The domain configuration feature is in public preview and is subject to change. 

Required Parameters
{
  "domainConfigurationName": "The name of the domain configuration. This value must be unique to a region."
}

Optional Parameters
{
  "serviceType": "The type of service delivered by the endpoint.",
  "validationCertificateArn": "The certificate used to validate the server certificate and prove domain name ownership. This certificate must be signed by a public certificate authority. This value is not required for AWS-managed domains.",
  "authorizerConfig": "An object that specifies the authorization service for a domain.",
  "domainName": "The name of the domain.",
  "serverCertificateArns": "The ARNs of the certificates that AWS IoT passes to the device during the TLS handshake. Currently you can specify only one certificate ARN. This value is not required for AWS-managed domains."
}
"""
CreateDomainConfiguration(args) = iot("POST", "/domainConfigurations/{domainConfigurationName}", args)

"""
    ListOTAUpdates()

Lists OTA updates.

Optional Parameters
{
  "maxResults": "The maximum number of results to return at one time.",
  "otaUpdateStatus": "The OTA update job status.",
  "nextToken": "A token used to retrieve the next set of results."
}
"""
ListOTAUpdates() = iot("GET", "/otaUpdates")
ListOTAUpdates(args) = iot("GET", "/otaUpdates", args)

"""
    CreateProvisioningTemplateVersion()

Creates a new version of a fleet provisioning template.

Required Parameters
{
  "templateName": "The name of the fleet provisioning template.",
  "templateBody": "The JSON formatted contents of the fleet provisioning template."
}

Optional Parameters
{
  "setAsDefault": "Sets a fleet provision template version as the default version."
}
"""
CreateProvisioningTemplateVersion(args) = iot("POST", "/provisioning-templates/{templateName}/versions", args)

"""
    UpdateMitigationAction()

Updates the definition for the specified mitigation action.

Required Parameters
{
  "actionName": "The friendly name for the mitigation action. You can't change the name by using UpdateMitigationAction. Instead, you must delete and re-create the mitigation action with the new name."
}

Optional Parameters
{
  "roleArn": "The ARN of the IAM role that is used to apply the mitigation action.",
  "actionParams": "Defines the type of action and the parameters for that action."
}
"""
UpdateMitigationAction(args) = iot("PATCH", "/mitigationactions/actions/{actionName}", args)

"""
    UntagResource()

Removes the given tags (metadata) from the resource.

Required Parameters
{
  "resourceArn": "The ARN of the resource.",
  "tagKeys": "A list of the keys of the tags to be removed from the resource."
}
"""
UntagResource(args) = iot("POST", "/untag", args)

"""
    ListThingRegistrationTasks()

List bulk thing provisioning tasks.

Optional Parameters
{
  "status": "The status of the bulk thing provisioning task.",
  "maxResults": "The maximum number of results to return at one time.",
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListThingRegistrationTasks() = iot("GET", "/thing-registration-tasks")
ListThingRegistrationTasks(args) = iot("GET", "/thing-registration-tasks", args)

"""
    StartAuditMitigationActionsTask()

Starts a task that applies a set of mitigation actions to the specified target.

Required Parameters
{
  "clientRequestToken": "Each audit mitigation task must have a unique client request token. If you try to start a new task with the same token as a task that already exists, an exception occurs. If you omit this value, a unique client request token is generated automatically.",
  "target": "Specifies the audit findings to which the mitigation actions are applied. You can apply them to a type of audit check, to all findings from an audit, or to a speecific set of findings.",
  "auditCheckToActionsMapping": "For an audit check, specifies which mitigation actions to apply. Those actions must be defined in your AWS account.",
  "taskId": "A unique identifier for the task. You can use this identifier to check the status of the task or to cancel it."
}
"""
StartAuditMitigationActionsTask(args) = iot("POST", "/audit/mitigationactions/tasks/{taskId}", args)

"""
    ListPolicyPrincipals()

Lists the principals associated with the specified policy.  Note: This API is deprecated. Please use ListTargetsForPolicy instead.

Required Parameters
{
  "policyName": "The policy name."
}

Optional Parameters
{
  "ascendingOrder": "Specifies the order for results. If true, the results are returned in ascending creation order.",
  "pageSize": "The result page size.",
  "marker": "The marker for the next set of results."
}
"""
ListPolicyPrincipals(args) = iot("GET", "/policy-principals", args)

"""
    ListOutgoingCertificates()

Lists certificates that are being transferred but not yet accepted.

Optional Parameters
{
  "ascendingOrder": "Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.",
  "pageSize": "The result page size.",
  "marker": "The marker for the next set of results."
}
"""
ListOutgoingCertificates() = iot("GET", "/certificates-out-going")
ListOutgoingCertificates(args) = iot("GET", "/certificates-out-going", args)

"""
    AssociateTargetsWithJob()

Associates a group with a continuous job. The following criteria must be met:    The job must have been created with the targetSelection field set to "CONTINUOUS".   The job status must currently be "IN_PROGRESS".   The total number of targets associated with a job must not exceed 100.  

Required Parameters
{
  "jobId": "The unique identifier you assigned to this job when it was created.",
  "targets": "A list of thing group ARNs that define the targets of the job."
}

Optional Parameters
{
  "comment": "An optional comment string describing why the job was associated with the targets."
}
"""
AssociateTargetsWithJob(args) = iot("POST", "/jobs/{jobId}/targets", args)

"""
    DeleteAccountAuditConfiguration()

Restores the default settings for Device Defender audits for this account. Any configuration data you entered is deleted and all audit checks are reset to disabled. 

Optional Parameters
{
  "deleteScheduledAudits": "If true, all scheduled audits are deleted."
}
"""
DeleteAccountAuditConfiguration() = iot("DELETE", "/audit/configuration")
DeleteAccountAuditConfiguration(args) = iot("DELETE", "/audit/configuration", args)

"""
    RemoveThingFromThingGroup()

Remove the specified thing from the specified group.

Optional Parameters
{
  "thingGroupName": "The group name.",
  "thingName": "The name of the thing to remove from the group.",
  "thingGroupArn": "The group ARN.",
  "thingArn": "The ARN of the thing to remove from the group."
}
"""
RemoveThingFromThingGroup() = iot("PUT", "/thing-groups/removeThingFromThingGroup")
RemoveThingFromThingGroup(args) = iot("PUT", "/thing-groups/removeThingFromThingGroup", args)

"""
    CreateThingType()

Creates a new thing type.

Required Parameters
{
  "thingTypeName": "The name of the thing type."
}

Optional Parameters
{
  "thingTypeProperties": "The ThingTypeProperties for the thing type to create. It contains information about the new thing type including a description, and a list of searchable thing attribute names.",
  "tags": "Metadata which can be used to manage the thing type."
}
"""
CreateThingType(args) = iot("POST", "/thing-types/{thingTypeName}", args)

"""
    ListCertificates()

Lists the certificates registered in your AWS account. The results are paginated with a default page size of 25. You can use the returned marker to retrieve additional results.

Optional Parameters
{
  "ascendingOrder": "Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.",
  "pageSize": "The result page size.",
  "marker": "The marker for the next set of results."
}
"""
ListCertificates() = iot("GET", "/certificates")
ListCertificates(args) = iot("GET", "/certificates", args)

"""
    DeletePolicyVersion()

Deletes the specified version of the specified policy. You cannot delete the default version of a policy using this API. To delete the default version of a policy, use DeletePolicy. To find out which version of a policy is marked as the default version, use ListPolicyVersions.

Required Parameters
{
  "policyName": "The name of the policy.",
  "policyVersionId": "The policy version ID."
}
"""
DeletePolicyVersion(args) = iot("DELETE", "/policies/{policyName}/version/{policyVersionId}", args)

"""
    DescribeIndex()

Describes a search index.

Required Parameters
{
  "indexName": "The index name."
}
"""
DescribeIndex(args) = iot("GET", "/indices/{indexName}", args)

"""
    ListThingRegistrationTaskReports()

Information about the thing registration tasks.

Required Parameters
{
  "reportType": "The type of task report.",
  "taskId": "The id of the task."
}

Optional Parameters
{
  "maxResults": "The maximum number of results to return per request.",
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListThingRegistrationTaskReports(args) = iot("GET", "/thing-registration-tasks/{taskId}/reports", args)

"""
    ListAuditMitigationActionsExecutions()

Gets the status of audit mitigation action tasks that were executed.

Required Parameters
{
  "findingId": "Specify this filter to limit results to those that were applied to a specific audit finding.",
  "taskId": "Specify this filter to limit results to actions for a specific audit mitigation actions task."
}

Optional Parameters
{
  "actionStatus": "Specify this filter to limit results to those with a specific status.",
  "maxResults": "The maximum number of results to return at one time. The default is 25.",
  "nextToken": "The token for the next set of results."
}
"""
ListAuditMitigationActionsExecutions(args) = iot("GET", "/audit/mitigationactions/executions", args)

"""
    DeleteV2LoggingLevel()

Deletes a logging level.

Required Parameters
{
  "targetName": "The name of the resource for which you are configuring logging.",
  "targetType": "The type of resource for which you are configuring logging. Must be THING_Group."
}
"""
DeleteV2LoggingLevel(args) = iot("DELETE", "/v2LoggingLevel", args)

"""
    CreateThing()

Creates a thing record in the registry. If this call is made multiple times using the same thing name and configuration, the call will succeed. If this call is made with the same thing name but different configuration a ResourceAlreadyExistsException is thrown.  This is a control plane operation. See Authorization for information about authorizing control plane actions. 

Required Parameters
{
  "thingName": "The name of the thing to create."
}

Optional Parameters
{
  "thingTypeName": "The name of the thing type associated with the new thing.",
  "attributePayload": "The attribute payload, which consists of up to three name/value pairs in a JSON document. For example:  { \"attributes \":{ \"string1 \": \"string2 \"}} ",
  "billingGroupName": "The name of the billing group the thing will be added to."
}
"""
CreateThing(args) = iot("POST", "/things/{thingName}", args)

"""
    GetStatistics()

Returns the count, average, sum, minimum, maximum, sum of squares, variance, and standard deviation for the specified aggregated field. If the aggregation field is of type String, only the count statistic is returned.

Required Parameters
{
  "queryString": "The query used to search. You can specify \"*\" for the query string to get the count of all indexed things in your AWS account."
}

Optional Parameters
{
  "queryVersion": "The version of the query used to search.",
  "indexName": "The name of the index to search. The default value is AWS_Things.",
  "aggregationField": "The aggregation field name."
}
"""
GetStatistics(args) = iot("POST", "/indices/statistics", args)

"""
    ListAuditFindings()

Lists the findings (results) of a Device Defender audit or of the audits performed during a specified time period. (Findings are retained for 180 days.)

Optional Parameters
{
  "startTime": "A filter to limit results to those found after the specified time. You must specify either the startTime and endTime or the taskId, but not both.",
  "checkName": "A filter to limit results to the findings for the specified audit check.",
  "maxResults": "The maximum number of results to return at one time. The default is 25.",
  "resourceIdentifier": "Information identifying the noncompliant resource.",
  "nextToken": "The token for the next set of results.",
  "endTime": "A filter to limit results to those found before the specified time. You must specify either the startTime and endTime or the taskId, but not both.",
  "taskId": "A filter to limit results to the audit with the specified ID. You must specify either the taskId or the startTime and endTime, but not both."
}
"""
ListAuditFindings() = iot("POST", "/audit/findings")
ListAuditFindings(args) = iot("POST", "/audit/findings", args)

"""
    CancelJobExecution()

Cancels the execution of a job for a given thing.

Required Parameters
{
  "jobId": "The ID of the job to be canceled.",
  "thingName": "The name of the thing whose execution of the job will be canceled."
}

Optional Parameters
{
  "expectedVersion": "(Optional) The expected current version of the job execution. Each time you update the job execution, its version is incremented. If the version of the job execution stored in Jobs does not match, the update is rejected with a VersionMismatch error, and an ErrorResponse that contains the current job execution status data is returned. (This makes it unnecessary to perform a separate DescribeJobExecution request in order to obtain the job execution status data.)",
  "statusDetails": "A collection of name/value pairs that describe the status of the job execution. If not specified, the statusDetails are unchanged. You can specify at most 10 name/value pairs.",
  "force": "(Optional) If true the job execution will be canceled if it has status IN_PROGRESS or QUEUED, otherwise the job execution will be canceled only if it has status QUEUED. If you attempt to cancel a job execution that is IN_PROGRESS, and you do not set force to true, then an InvalidStateTransitionException will be thrown. The default is false. Canceling a job execution which is \"IN_PROGRESS\", will cause the device to be unable to update the job execution status. Use caution and ensure that the device is able to recover to a valid state."
}
"""
CancelJobExecution(args) = iot("PUT", "/things/{thingName}/jobs/{jobId}/cancel", args)

"""
    DeleteOTAUpdate()

Delete an OTA update.

Required Parameters
{
  "otaUpdateId": "The OTA update ID to delete."
}

Optional Parameters
{
  "deleteStream": "Specifies if the stream associated with an OTA update should be deleted when the OTA update is deleted.",
  "forceDeleteAWSJob": "Specifies if the AWS Job associated with the OTA update should be deleted with the OTA update is deleted."
}
"""
DeleteOTAUpdate(args) = iot("DELETE", "/otaUpdates/{otaUpdateId}", args)

"""
    ListAttachedPolicies()

Lists the policies attached to the specified thing group.

Required Parameters
{
  "target": "The group or principal for which the policies will be listed."
}

Optional Parameters
{
  "recursive": "When true, recursively list attached policies.",
  "pageSize": "The maximum number of results to be returned per request.",
  "marker": "The token to retrieve the next set of results."
}
"""
ListAttachedPolicies(args) = iot("POST", "/attached-policies/{target}", args)

"""
    CreateAuthorizer()

Creates an authorizer.

Required Parameters
{
  "authorizerName": "The authorizer name.",
  "authorizerFunctionArn": "The ARN of the authorizer's Lambda function."
}

Optional Parameters
{
  "signingDisabled": "Specifies whether AWS IoT validates the token signature in an authorization request.",
  "status": "The status of the create authorizer request.",
  "tokenKeyName": "The name of the token key used to extract the token from the HTTP headers.",
  "tokenSigningPublicKeys": "The public keys used to verify the digital signature returned by your custom authentication service."
}
"""
CreateAuthorizer(args) = iot("POST", "/authorizer/{authorizerName}", args)

"""
    GetOTAUpdate()

Gets an OTA update.

Required Parameters
{
  "otaUpdateId": "The OTA update ID."
}
"""
GetOTAUpdate(args) = iot("GET", "/otaUpdates/{otaUpdateId}", args)

"""
    UpdateThingGroup()

Update a thing group.

Required Parameters
{
  "thingGroupName": "The thing group to update.",
  "thingGroupProperties": "The thing group properties."
}

Optional Parameters
{
  "expectedVersion": "The expected version of the thing group. If this does not match the version of the thing group being updated, the update will fail."
}
"""
UpdateThingGroup(args) = iot("PATCH", "/thing-groups/{thingGroupName}", args)

"""
    ListMitigationActions()

Gets a list of all mitigation actions that match the specified filter criteria.

Optional Parameters
{
  "actionType": "Specify a value to limit the result to mitigation actions with a specific action type.",
  "maxResults": "The maximum number of results to return at one time. The default is 25.",
  "nextToken": "The token for the next set of results."
}
"""
ListMitigationActions() = iot("GET", "/mitigationactions/actions")
ListMitigationActions(args) = iot("GET", "/mitigationactions/actions", args)

"""
    DisableTopicRule()

Disables the rule.

Required Parameters
{
  "ruleName": "The name of the rule to disable."
}
"""
DisableTopicRule(args) = iot("POST", "/rules/{ruleName}/disable", args)

"""
    UpdateThingGroupsForThing()

Updates the groups to which the thing belongs.

Optional Parameters
{
  "thingGroupsToRemove": "The groups from which the thing will be removed.",
  "overrideDynamicGroups": "Override dynamic thing groups with static thing groups when 10-group limit is reached. If a thing belongs to 10 thing groups, and one or more of those groups are dynamic thing groups, adding a thing to a static group removes the thing from the last dynamic group.",
  "thingName": "The thing whose group memberships will be updated.",
  "thingGroupsToAdd": "The groups to which the thing will be added."
}
"""
UpdateThingGroupsForThing() = iot("PUT", "/thing-groups/updateThingGroupsForThing")
UpdateThingGroupsForThing(args) = iot("PUT", "/thing-groups/updateThingGroupsForThing", args)

"""
    DeleteProvisioningTemplate()

Deletes a fleet provisioning template.

Required Parameters
{
  "templateName": "The name of the fleet provision template to delete."
}
"""
DeleteProvisioningTemplate(args) = iot("DELETE", "/provisioning-templates/{templateName}", args)

"""
    DescribeThingRegistrationTask()

Describes a bulk thing provisioning task.

Required Parameters
{
  "taskId": "The task ID."
}
"""
DescribeThingRegistrationTask(args) = iot("GET", "/thing-registration-tasks/{taskId}", args)

"""
    ListDomainConfigurations()

Gets a list of domain configurations for the user. This list is sorted alphabetically by domain configuration name.  The domain configuration feature is in public preview and is subject to change. 

Optional Parameters
{
  "pageSize": "The result page size.",
  "serviceType": "The type of service delivered by the endpoint.",
  "marker": "The marker for the next set of results."
}
"""
ListDomainConfigurations() = iot("GET", "/domainConfigurations")
ListDomainConfigurations(args) = iot("GET", "/domainConfigurations", args)

"""
    DetachThingPrincipal()

Detaches the specified principal from the specified thing. A principal can be X.509 certificates, IAM users, groups, and roles, Amazon Cognito identities or federated identities.  This call is asynchronous. It might take several seconds for the detachment to propagate. 

Required Parameters
{
  "thingName": "The name of the thing.",
  "principal": "If the principal is a certificate, this value must be ARN of the certificate. If the principal is an Amazon Cognito identity, this value must be the ID of the Amazon Cognito identity."
}
"""
DetachThingPrincipal(args) = iot("DELETE", "/things/{thingName}/principals", args)

"""
    DescribeBillingGroup()

Returns information about a billing group.

Required Parameters
{
  "billingGroupName": "The name of the billing group."
}
"""
DescribeBillingGroup(args) = iot("GET", "/billing-groups/{billingGroupName}", args)

"""
    RegisterCertificate()

Registers a device certificate with AWS IoT. If you have more than one CA certificate that has the same subject field, you must specify the CA certificate that was used to sign the device certificate being registered.

Required Parameters
{
  "certificatePem": "The certificate data, in PEM format."
}

Optional Parameters
{
  "caCertificatePem": "The CA certificate used to sign the device certificate being registered.",
  "status": "The status of the register certificate request.",
  "setAsActive": "A boolean value that specifies if the certificate is set to active."
}
"""
RegisterCertificate(args) = iot("POST", "/certificate/register", args)

"""
    DescribeProvisioningTemplateVersion()

Returns information about a fleet provisioning template version.

Required Parameters
{
  "versionId": "The fleet provisioning template version ID.",
  "templateName": "The template name."
}
"""
DescribeProvisioningTemplateVersion(args) = iot("GET", "/provisioning-templates/{templateName}/versions/{versionId}", args)

"""
    GetPercentiles()

Groups the aggregated values that match the query into percentile groupings. The default percentile groupings are: 1,5,25,50,75,95,99, although you can specify your own when you call GetPercentiles. This function returns a value for each percentile group specified (or the default percentile groupings). The percentile group "1" contains the aggregated field value that occurs in approximately one percent of the values that match the query. The percentile group "5" contains the aggregated field value that occurs in approximately five percent of the values that match the query, and so on. The result is an approximation, the more values that match the query, the more accurate the percentile values.

Required Parameters
{
  "queryString": "The query string."
}

Optional Parameters
{
  "queryVersion": "The query version.",
  "percents": "The percentile groups returned.",
  "indexName": "The name of the index to search.",
  "aggregationField": "The field to aggregate."
}
"""
GetPercentiles(args) = iot("POST", "/indices/percentiles", args)

"""
    DeleteStream()

Deletes a stream.

Required Parameters
{
  "streamId": "The stream ID."
}
"""
DeleteStream(args) = iot("DELETE", "/streams/{streamId}", args)

"""
    DeleteJobExecution()

Deletes a job execution.

Required Parameters
{
  "jobId": "The ID of the job whose execution on a particular device will be deleted.",
  "thingName": "The name of the thing whose job execution will be deleted.",
  "executionNumber": "The ID of the job execution to be deleted. The executionNumber refers to the execution of a particular job on a particular device. Note that once a job execution is deleted, the executionNumber may be reused by IoT, so be sure you get and use the correct value here."
}

Optional Parameters
{
  "force": "(Optional) When true, you can delete a job execution which is \"IN_PROGRESS\". Otherwise, you can only delete a job execution which is in a terminal state (\"SUCCEEDED\", \"FAILED\", \"REJECTED\", \"REMOVED\" or \"CANCELED\") or an exception will occur. The default is false.  Deleting a job execution which is \"IN_PROGRESS\", will cause the device to be unable to access job information or update the job execution status. Use caution and ensure that the device is able to recover to a valid state. "
}
"""
DeleteJobExecution(args) = iot("DELETE", "/things/{thingName}/jobs/{jobId}/executionNumber/{executionNumber}", args)

"""
    UpdateEventConfigurations()

Updates the event configurations.

Optional Parameters
{
  "eventConfigurations": "The new event configuration values."
}
"""
UpdateEventConfigurations() = iot("PATCH", "/event-configurations")
UpdateEventConfigurations(args) = iot("PATCH", "/event-configurations", args)

"""
    DescribeDefaultAuthorizer()

Describes the default authorizer.
"""
DescribeDefaultAuthorizer() = iot("GET", "/default-authorizer")
DescribeDefaultAuthorizer(args) = iot("GET", "/default-authorizer", args)

"""
    GetPolicy()

Gets information about the specified policy with the policy document of the default version.

Required Parameters
{
  "policyName": "The name of the policy."
}
"""
GetPolicy(args) = iot("GET", "/policies/{policyName}", args)

"""
    ListViolationEvents()

Lists the Device Defender security profile violations discovered during the given time period. You can use filters to limit the results to those alerts issued for a particular security profile, behavior, or thing (device).

Required Parameters
{
  "startTime": "The start time for the alerts to be listed.",
  "endTime": "The end time for the alerts to be listed."
}

Optional Parameters
{
  "thingName": "A filter to limit results to those alerts caused by the specified thing.",
  "maxResults": "The maximum number of results to return at one time.",
  "securityProfileName": "A filter to limit results to those alerts generated by the specified security profile.",
  "nextToken": "The token for the next set of results."
}
"""
ListViolationEvents(args) = iot("GET", "/violation-events", args)

"""
    UpdateDomainConfiguration()

Updates values stored in the domain configuration. Domain configurations for default endpoints can't be updated.  The domain configuration feature is in public preview and is subject to change. 

Required Parameters
{
  "domainConfigurationName": "The name of the domain configuration to be updated."
}

Optional Parameters
{
  "removeAuthorizerConfig": "Removes the authorization configuration from a domain.",
  "authorizerConfig": "An object that specifies the authorization service for a domain.",
  "domainConfigurationStatus": "The status to which the domain configuration should be updated."
}
"""
UpdateDomainConfiguration(args) = iot("PUT", "/domainConfigurations/{domainConfigurationName}", args)

"""
    UpdateThing()

Updates the data for a thing.

Required Parameters
{
  "thingName": "The name of the thing to update."
}

Optional Parameters
{
  "thingTypeName": "The name of the thing type.",
  "removeThingType": "Remove a thing type association. If true, the association is removed.",
  "expectedVersion": "The expected version of the thing record in the registry. If the version of the record in the registry does not match the expected version specified in the request, the UpdateThing request is rejected with a VersionConflictException.",
  "attributePayload": "A list of thing attributes, a JSON string containing name-value pairs. For example:  { \"attributes \":{ \"name1 \": \"value2 \"}}  This data is used to add new attributes or update existing attributes."
}
"""
UpdateThing(args) = iot("PATCH", "/things/{thingName}", args)

"""
    GetLoggingOptions()

Gets the logging options. NOTE: use of this command is not recommended. Use GetV2LoggingOptions instead.
"""
GetLoggingOptions() = iot("GET", "/loggingOptions")
GetLoggingOptions(args) = iot("GET", "/loggingOptions", args)

"""
    DescribeEndpoint()

Returns a unique endpoint specific to the AWS account making the call.

Optional Parameters
{
  "endpointType": "The endpoint type. Valid endpoint types include:    iot:Data - Returns a VeriSign signed data endpoint.      iot:Data-ATS - Returns an ATS signed data endpoint.      iot:CredentialProvider - Returns an AWS IoT credentials provider API endpoint.      iot:Jobs - Returns an AWS IoT device management Jobs API endpoint.   We strongly recommend that customers use the newer iot:Data-ATS endpoint type to avoid issues related to the widespread distrust of Symantec certificate authorities."
}
"""
DescribeEndpoint() = iot("GET", "/endpoint")
DescribeEndpoint(args) = iot("GET", "/endpoint", args)

"""
    DeleteScheduledAudit()

Deletes a scheduled audit.

Required Parameters
{
  "scheduledAuditName": "The name of the scheduled audit you want to delete."
}
"""
DeleteScheduledAudit(args) = iot("DELETE", "/audit/scheduledaudits/{scheduledAuditName}", args)

"""
    ReplaceTopicRule()

Replaces the rule. You must specify all parameters for the new rule. Creating rules is an administrator-level action. Any user who has permission to create rules will be able to access data processed by the rule.

Required Parameters
{
  "ruleName": "The name of the rule.",
  "topicRulePayload": "The rule payload."
}
"""
ReplaceTopicRule(args) = iot("PATCH", "/rules/{ruleName}", args)

"""
    DescribeThingType()

Gets information about the specified thing type.

Required Parameters
{
  "thingTypeName": "The name of the thing type."
}
"""
DescribeThingType(args) = iot("GET", "/thing-types/{thingTypeName}", args)

"""
    ListProvisioningTemplateVersions()

A list of fleet provisioning template versions.

Required Parameters
{
  "templateName": "The name of the fleet provisioning template."
}

Optional Parameters
{
  "maxResults": "The maximum number of results to return at one time.",
  "nextToken": "A token to retrieve the next set of results."
}
"""
ListProvisioningTemplateVersions(args) = iot("GET", "/provisioning-templates/{templateName}/versions", args)

"""
    SetLoggingOptions()

Sets the logging options. NOTE: use of this command is not recommended. Use SetV2LoggingOptions instead.

Required Parameters
{
  "loggingOptionsPayload": "The logging options payload."
}
"""
SetLoggingOptions(args) = iot("POST", "/loggingOptions", args)

"""
    CreateMitigationAction()

Defines an action that can be applied to audit findings by using StartAuditMitigationActionsTask. Each mitigation action can apply only one type of change.

Required Parameters
{
  "roleArn": "The ARN of the IAM role that is used to apply the mitigation action.",
  "actionName": "A friendly name for the action. Choose a friendly name that accurately describes the action (for example, EnableLoggingAction).",
  "actionParams": "Defines the type of action and the parameters for that action."
}

Optional Parameters
{
  "tags": "Metadata that can be used to manage the mitigation action."
}
"""
CreateMitigationAction(args) = iot("POST", "/mitigationactions/actions/{actionName}", args)

"""
    UpdateJob()

Updates supported fields of the specified job.

Required Parameters
{
  "jobId": "The ID of the job to be updated."
}

Optional Parameters
{
  "presignedUrlConfig": "Configuration information for pre-signed S3 URLs.",
  "jobExecutionsRolloutConfig": "Allows you to create a staged rollout of the job.",
  "abortConfig": "Allows you to create criteria to abort a job.",
  "timeoutConfig": "Specifies the amount of time each device has to finish its execution of the job. The timer is started when the job execution status is set to IN_PROGRESS. If the job execution status is not set to another terminal state before the time expires, it will be automatically set to TIMED_OUT. ",
  "description": "A short text description of the job."
}
"""
UpdateJob(args) = iot("PATCH", "/jobs/{jobId}", args)

"""
    CreateTopicRule()

Creates a rule. Creating rules is an administrator-level action. Any user who has permission to create rules will be able to access data processed by the rule.

Required Parameters
{
  "ruleName": "The name of the rule.",
  "topicRulePayload": "The rule payload."
}

Optional Parameters
{
  "tags": "Metadata which can be used to manage the topic rule.  For URI Request parameters use format: ...key1=value1&amp;key2=value2... For the CLI command-line parameter use format: --tags \"key1=value1&amp;key2=value2...\" For the cli-input-json file use format: \"tags\": \"key1=value1&amp;key2=value2...\" "
}
"""
CreateTopicRule(args) = iot("POST", "/rules/{ruleName}", args)

"""
    CreateOTAUpdate()

Creates an AWS IoT OTAUpdate on a target group of things or groups.

Required Parameters
{
  "roleArn": "The IAM role that allows access to the AWS IoT Jobs service.",
  "otaUpdateId": "The ID of the OTA update to be created.",
  "files": "The files to be streamed by the OTA update.",
  "targets": "The targeted devices to receive OTA updates."
}

Optional Parameters
{
  "additionalParameters": "A list of additional OTA update parameters which are name-value pairs.",
  "protocols": "The protocol used to transfer the OTA update image. Valid values are [HTTP], [MQTT], [HTTP, MQTT]. When both HTTP and MQTT are specified, the target device can choose the protocol.",
  "awsJobExecutionsRolloutConfig": "Configuration for the rollout of OTA updates.",
  "targetSelection": "Specifies whether the update will continue to run (CONTINUOUS), or will be complete after all the things specified as targets have completed the update (SNAPSHOT). If continuous, the update may also be run on a thing when a change is detected in a target. For example, an update will run on a thing when the thing is added to a target group, even after the update was completed by all things originally in the group. Valid values: CONTINUOUS | SNAPSHOT.",
  "awsJobPresignedUrlConfig": "Configuration information for pre-signed URLs.",
  "tags": "Metadata which can be used to manage updates.",
  "description": "The description of the OTA update."
}
"""
CreateOTAUpdate(args) = iot("POST", "/otaUpdates/{otaUpdateId}", args)

"""
    UpdateProvisioningTemplate()

Updates a fleet provisioning template.

Required Parameters
{
  "templateName": "The name of the fleet provisioning template."
}

Optional Parameters
{
  "provisioningRoleArn": "The ARN of the role associated with the provisioning template. This IoT role grants permission to provision a device.",
  "defaultVersionId": "The ID of the default provisioning template version.",
  "enabled": "True to enable the fleet provisioning template, otherwise false.",
  "description": "The description of the fleet provisioning template."
}
"""
UpdateProvisioningTemplate(args) = iot("PATCH", "/provisioning-templates/{templateName}", args)

"""
    SetV2LoggingOptions()

Sets the logging options for the V2 logging service.

Optional Parameters
{
  "roleArn": "The ARN of the role that allows IoT to write to Cloudwatch logs.",
  "defaultLogLevel": "The default logging level.",
  "disableAllLogs": "If true all logs are disabled. The default is false."
}
"""
SetV2LoggingOptions() = iot("POST", "/v2LoggingOptions")
SetV2LoggingOptions(args) = iot("POST", "/v2LoggingOptions", args)

"""
    DeleteRegistrationCode()

Deletes a CA certificate registration code.
"""
DeleteRegistrationCode() = iot("DELETE", "/registrationcode")
DeleteRegistrationCode(args) = iot("DELETE", "/registrationcode", args)

"""
    CreateTopicRuleDestination()

Creates a topic rule destination. The destination must be confirmed prior to use.

Required Parameters
{
  "destinationConfiguration": "The topic rule destination configuration."
}
"""
CreateTopicRuleDestination(args) = iot("POST", "/destinations", args)

"""
    ListCACertificates()

Lists the CA certificates registered for your AWS account. The results are paginated with a default page size of 25. You can use the returned marker to retrieve additional results.

Optional Parameters
{
  "ascendingOrder": "Determines the order of the results.",
  "pageSize": "The result page size.",
  "marker": "The marker for the next set of results."
}
"""
ListCACertificates() = iot("GET", "/cacertificates")
ListCACertificates(args) = iot("GET", "/cacertificates", args)

"""
    DescribeCertificate()

Gets information about the specified certificate.

Required Parameters
{
  "certificateId": "The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)"
}
"""
DescribeCertificate(args) = iot("GET", "/certificates/{certificateId}", args)

"""
    DeletePolicy()

Deletes the specified policy. A policy cannot be deleted if it has non-default versions or it is attached to any certificate. To delete a policy, use the DeletePolicyVersion API to delete all non-default versions of the policy; use the DetachPrincipalPolicy API to detach the policy from any certificate; and then use the DeletePolicy API to delete the policy. When a policy is deleted using DeletePolicy, its default version is deleted with it.

Required Parameters
{
  "policyName": "The name of the policy to delete."
}
"""
DeletePolicy(args) = iot("DELETE", "/policies/{policyName}", args)

"""
    DescribeDomainConfiguration()

Gets summary information about a domain configuration.  The domain configuration feature is in public preview and is subject to change. 

Required Parameters
{
  "domainConfigurationName": "The name of the domain configuration."
}
"""
DescribeDomainConfiguration(args) = iot("GET", "/domainConfigurations/{domainConfigurationName}", args)

"""
    DescribeAuditTask()

Gets information about a Device Defender audit.

Required Parameters
{
  "taskId": "The ID of the audit whose information you want to get."
}
"""
DescribeAuditTask(args) = iot("GET", "/audit/tasks/{taskId}", args)

"""
    DeprecateThingType()

Deprecates a thing type. You can not associate new things with deprecated thing type.

Required Parameters
{
  "thingTypeName": "The name of the thing type to deprecate."
}

Optional Parameters
{
  "undoDeprecate": "Whether to undeprecate a deprecated thing type. If true, the thing type will not be deprecated anymore and you can associate it with things."
}
"""
DeprecateThingType(args) = iot("POST", "/thing-types/{thingTypeName}/deprecate", args)

"""
    DeleteSecurityProfile()

Deletes a Device Defender security profile.

Required Parameters
{
  "securityProfileName": "The name of the security profile to be deleted."
}

Optional Parameters
{
  "expectedVersion": "The expected version of the security profile. A new version is generated whenever the security profile is updated. If you specify a value that is different from the actual version, a VersionConflictException is thrown."
}
"""
DeleteSecurityProfile(args) = iot("DELETE", "/security-profiles/{securityProfileName}", args)

"""
    UpdateDynamicThingGroup()

Updates a dynamic thing group.

Required Parameters
{
  "thingGroupName": "The name of the dynamic thing group to update.",
  "thingGroupProperties": "The dynamic thing group properties to update."
}

Optional Parameters
{
  "queryVersion": "The dynamic thing group query version to update.  Currently one query version is supported: \"2017-09-30\". If not specified, the query version defaults to this value. ",
  "expectedVersion": "The expected version of the dynamic thing group to update.",
  "indexName": "The dynamic thing group index to update.  Currently one index is supported: 'AWS_Things'. ",
  "queryString": "The dynamic thing group search query string to update."
}
"""
UpdateDynamicThingGroup(args) = iot("PATCH", "/dynamic-thing-groups/{thingGroupName}", args)

"""
    ListTagsForResource()

Lists the tags (metadata) you have assigned to the resource.

Required Parameters
{
  "resourceArn": "The ARN of the resource."
}

Optional Parameters
{
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListTagsForResource(args) = iot("GET", "/tags", args)

"""
    ListSecurityProfiles()

Lists the Device Defender security profiles you have created. You can use filters to list only those security profiles associated with a thing group or only those associated with your account.

Optional Parameters
{
  "maxResults": "The maximum number of results to return at one time.",
  "nextToken": "The token for the next set of results."
}
"""
ListSecurityProfiles() = iot("GET", "/security-profiles")
ListSecurityProfiles(args) = iot("GET", "/security-profiles", args)

"""
    ListAuditMitigationActionsTasks()

Gets a list of audit mitigation action tasks that match the specified filters.

Required Parameters
{
  "startTime": "Specify this filter to limit results to tasks that began on or after a specific date and time.",
  "endTime": "Specify this filter to limit results to tasks that were completed or canceled on or before a specific date and time."
}

Optional Parameters
{
  "auditTaskId": "Specify this filter to limit results to tasks that were applied to results for a specific audit.",
  "taskStatus": "Specify this filter to limit results to tasks that are in a specific state.",
  "findingId": "Specify this filter to limit results to tasks that were applied to a specific audit finding.",
  "maxResults": "The maximum number of results to return at one time. The default is 25.",
  "nextToken": "The token for the next set of results."
}
"""
ListAuditMitigationActionsTasks(args) = iot("GET", "/audit/mitigationactions/tasks", args)

"""
    DeleteCertificate()

Deletes the specified certificate. A certificate cannot be deleted if it has a policy or IoT thing attached to it or if its status is set to ACTIVE. To delete a certificate, first use the DetachPrincipalPolicy API to detach all policies. Next, use the UpdateCertificate API to set the certificate to the INACTIVE status.

Required Parameters
{
  "certificateId": "The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)"
}

Optional Parameters
{
  "forceDelete": "Forces the deletion of a certificate if it is inactive and is not attached to an IoT thing."
}
"""
DeleteCertificate(args) = iot("DELETE", "/certificates/{certificateId}", args)

"""
    ListJobExecutionsForJob()

Lists the job executions for a job.

Required Parameters
{
  "jobId": "The unique identifier you assigned to this job when it was created."
}

Optional Parameters
{
  "status": "The status of the job.",
  "maxResults": "The maximum number of results to be returned per request.",
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListJobExecutionsForJob(args) = iot("GET", "/jobs/{jobId}/things", args)

"""
    UpdateCACertificate()

Updates a registered CA certificate.

Required Parameters
{
  "certificateId": "The CA certificate identifier."
}

Optional Parameters
{
  "newStatus": "The updated status of the CA certificate.  Note: The status value REGISTER_INACTIVE is deprecated and should not be used.",
  "newAutoRegistrationStatus": "The new value for the auto registration status. Valid values are: \"ENABLE\" or \"DISABLE\".",
  "registrationConfig": "Information about the registration configuration.",
  "removeAutoRegistration": "If true, removes auto registration."
}
"""
UpdateCACertificate(args) = iot("PUT", "/cacertificate/{caCertificateId}", args)

"""
    UpdateIndexingConfiguration()

Updates the search configuration.

Optional Parameters
{
  "thingIndexingConfiguration": "Thing indexing configuration.",
  "thingGroupIndexingConfiguration": "Thing group indexing configuration."
}
"""
UpdateIndexingConfiguration() = iot("POST", "/indexing/config")
UpdateIndexingConfiguration(args) = iot("POST", "/indexing/config", args)

"""
    ListThingGroups()

List the thing groups in your account.

Optional Parameters
{
  "namePrefixFilter": "A filter that limits the results to those with the specified name prefix.",
  "recursive": "If true, return child groups as well.",
  "maxResults": "The maximum number of results to return at one time.",
  "parentGroup": "A filter that limits the results to those with the specified parent group.",
  "nextToken": "The token to retrieve the next set of results."
}
"""
ListThingGroups() = iot("GET", "/thing-groups")
ListThingGroups(args) = iot("GET", "/thing-groups", args)

"""
    DeleteThingGroup()

Deletes a thing group.

Required Parameters
{
  "thingGroupName": "The name of the thing group to delete."
}

Optional Parameters
{
  "expectedVersion": "The expected version of the thing group to delete."
}
"""
DeleteThingGroup(args) = iot("DELETE", "/thing-groups/{thingGroupName}", args)

"""
    ClearDefaultAuthorizer()

Clears the default authorizer.
"""
ClearDefaultAuthorizer() = iot("DELETE", "/default-authorizer")
ClearDefaultAuthorizer(args) = iot("DELETE", "/default-authorizer", args)

"""
    AttachPolicy()

Attaches a policy to the specified target.

Required Parameters
{
  "policyName": "The name of the policy to attach.",
  "target": "The identity to which the policy is attached."
}
"""
AttachPolicy(args) = iot("PUT", "/target-policies/{policyName}", args)

"""
    GetTopicRule()

Gets information about the rule.

Required Parameters
{
  "ruleName": "The name of the rule."
}
"""
GetTopicRule(args) = iot("GET", "/rules/{ruleName}", args)

"""
    DescribeAuthorizer()

Describes an authorizer.

Required Parameters
{
  "authorizerName": "The name of the authorizer to describe."
}
"""
DescribeAuthorizer(args) = iot("GET", "/authorizer/{authorizerName}", args)

"""
    SetDefaultAuthorizer()

Sets the default authorizer. This will be used if a websocket connection is made without specifying an authorizer.

Required Parameters
{
  "authorizerName": "The authorizer name."
}
"""
SetDefaultAuthorizer(args) = iot("POST", "/default-authorizer", args)

"""
    CreateSecurityProfile()

Creates a Device Defender security profile.

Required Parameters
{
  "securityProfileName": "The name you are giving to the security profile."
}

Optional Parameters
{
  "behaviors": "Specifies the behaviors that, when violated by a device (thing), cause an alert.",
  "alertTargets": "Specifies the destinations to which alerts are sent. (Alerts are always sent to the console.) Alerts are generated when a device (thing) violates a behavior.",
  "tags": "Metadata that can be used to manage the security profile.",
  "additionalMetricsToRetain": "A list of metrics whose data is retained (stored). By default, data is retained for any metric used in the profile's behaviors, but it is also retained for any metric specified here.",
  "securityProfileDescription": "A description of the security profile."
}
"""
CreateSecurityProfile(args) = iot("POST", "/security-profiles/{securityProfileName}", args)

"""
    ListPolicies()

Lists your policies.

Optional Parameters
{
  "ascendingOrder": "Specifies the order for results. If true, the results are returned in ascending creation order.",
  "pageSize": "The result page size.",
  "marker": "The marker for the next set of results."
}
"""
ListPolicies() = iot("GET", "/policies")
ListPolicies(args) = iot("GET", "/policies", args)

"""
    ListSecurityProfilesForTarget()

Lists the Device Defender security profiles attached to a target (thing group).

Required Parameters
{
  "securityProfileTargetArn": "The ARN of the target (thing group) whose attached security profiles you want to get."
}

Optional Parameters
{
  "recursive": "If true, return child groups too.",
  "maxResults": "The maximum number of results to return at one time.",
  "nextToken": "The token for the next set of results."
}
"""
ListSecurityProfilesForTarget(args) = iot("GET", "/security-profiles-for-target", args)

"""
    CreatePolicy()

Creates an AWS IoT policy. The created policy is the default version for the policy. This operation creates a policy version with a version identifier of 1 and sets 1 as the policy's default version.

Required Parameters
{
  "policyName": "The policy name.",
  "policyDocument": "The JSON document that describes the policy. policyDocument must have a minimum length of 1, with a maximum length of 2048, excluding whitespace."
}
"""
CreatePolicy(args) = iot("POST", "/policies/{policyName}", args)

"""
    DeleteBillingGroup()

Deletes the billing group.

Required Parameters
{
  "billingGroupName": "The name of the billing group."
}

Optional Parameters
{
  "expectedVersion": "The expected version of the billing group. If the version of the billing group does not match the expected version specified in the request, the DeleteBillingGroup request is rejected with a VersionConflictException."
}
"""
DeleteBillingGroup(args) = iot("DELETE", "/billing-groups/{billingGroupName}", args)

"""
    GetV2LoggingOptions()

Gets the fine grained logging options.
"""
GetV2LoggingOptions() = iot("GET", "/v2LoggingOptions")
GetV2LoggingOptions(args) = iot("GET", "/v2LoggingOptions", args)

"""
    DeleteThingType()

Deletes the specified thing type. You cannot delete a thing type if it has things associated with it. To delete a thing type, first mark it as deprecated by calling DeprecateThingType, then remove any associated things by calling UpdateThing to change the thing type on any associated thing, and finally use DeleteThingType to delete the thing type.

Required Parameters
{
  "thingTypeName": "The name of the thing type."
}
"""
DeleteThingType(args) = iot("DELETE", "/thing-types/{thingTypeName}", args)

"""
    SetV2LoggingLevel()

Sets the logging level.

Required Parameters
{
  "logTarget": "The log target.",
  "logLevel": "The log level."
}
"""
SetV2LoggingLevel(args) = iot("POST", "/v2LoggingLevel", args)

"""
    ConfirmTopicRuleDestination()

Confirms a topic rule destination. When you create a rule requiring a destination, AWS IoT sends a confirmation message to the endpoint or base address you specify. The message includes a token which you pass back when calling ConfirmTopicRuleDestination to confirm that you own or have access to the endpoint.

Required Parameters
{
  "confirmationToken": "The token used to confirm ownership or access to the topic rule confirmation URL."
}
"""
ConfirmTopicRuleDestination(args) = iot("GET", "/confirmdestination/{confirmationToken+}", args)

"""
    SearchIndex()

The query search index.

Required Parameters
{
  "queryString": "The search query string."
}

Optional Parameters
{
  "queryVersion": "The query version.",
  "indexName": "The search index name.",
  "maxResults": "The maximum number of results to return at one time.",
  "nextToken": "The token used to get the next set of results, or null if there are no additional results."
}
"""
SearchIndex(args) = iot("POST", "/indices/search", args)

"""
    CancelCertificateTransfer()

Cancels a pending transfer for the specified certificate.  Note Only the transfer source account can use this operation to cancel a transfer. (Transfer destinations can use RejectCertificateTransfer instead.) After transfer, AWS IoT returns the certificate to the source account in the INACTIVE state. After the destination account has accepted the transfer, the transfer cannot be cancelled. After a certificate transfer is cancelled, the status of the certificate changes from PENDING_TRANSFER to INACTIVE.

Required Parameters
{
  "certificateId": "The ID of the certificate. (The last part of the certificate ARN contains the certificate ID.)"
}
"""
CancelCertificateTransfer(args) = iot("PATCH", "/cancel-certificate-transfer/{certificateId}", args)

"""
    DeleteRoleAlias()

Deletes a role alias

Required Parameters
{
  "roleAlias": "The role alias to delete."
}
"""
DeleteRoleAlias(args) = iot("DELETE", "/role-aliases/{roleAlias}", args)

"""
    DescribeRoleAlias()

Describes a role alias.

Required Parameters
{
  "roleAlias": "The role alias to describe."
}
"""
DescribeRoleAlias(args) = iot("GET", "/role-aliases/{roleAlias}", args)

"""
    GetJobDocument()

Gets a job document.

Required Parameters
{
  "jobId": "The unique identifier you assigned to this job when it was created."
}
"""
GetJobDocument(args) = iot("GET", "/jobs/{jobId}/job-document", args)
