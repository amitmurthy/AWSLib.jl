include("../AWSServices.jl")
using .AWSServices: organizations

"""
    DisableAWSServiceAccess()

Disables the integration of an AWS service (the service that is specified by ServicePrincipal) with AWS Organizations. When you disable integration, the specified service no longer can create a service-linked role in new accounts in your organization. This means the service can't perform operations on your behalf on any new accounts in your organization. The service can still perform operations in older accounts until the service completes its clean-up from AWS Organizations.   We recommend that you disable integration between AWS Organizations and the specified AWS service by using the console or commands that are provided by the specified service. Doing so ensures that the other service is aware that it can clean up any resources that are required only for the integration. How the service cleans up its resources in the organization's accounts depends on that service. For more information, see the documentation for the other AWS service.  After you perform the DisableAWSServiceAccess operation, the specified service can no longer perform operations in your organization's accounts unless the operations are explicitly permitted by the IAM policies that are attached to your roles. For more information about integrating other services with AWS Organizations, including the list of services that work with Organizations, see Integrating AWS Organizations with Other AWS Services in the AWS Organizations User Guide.  This operation can be called only from the organization's master account.

Required Parameters
{
  "ServicePrincipal": "The service principal name of the AWS service for which you want to disable integration with your organization. This is typically in the form of a URL, such as  service-abbreviation.amazonaws.com."
}
"""
DisableAWSServiceAccess(args) = organizations("DisableAWSServiceAccess", args)

"""
    CancelHandshake()

Cancels a handshake. Canceling a handshake sets the handshake state to CANCELED.  This operation can be called only from the account that originated the handshake. The recipient of the handshake can't cancel it, but can use DeclineHandshake instead. After a handshake is canceled, the recipient can no longer respond to that handshake. After you cancel a handshake, it continues to appear in the results of relevant APIs for only 30 days. After that, it's deleted.

Required Parameters
{
  "HandshakeId": "The unique identifier (ID) of the handshake that you want to cancel. You can get the ID from the ListHandshakesForOrganization operation. The regex pattern for handshake ID string requires \"h-\" followed by from 8 to 32 lowercase letters or digits."
}
"""
CancelHandshake(args) = organizations("CancelHandshake", args)

"""
    DescribeHandshake()

Retrieves information about a previously requested handshake. The handshake ID comes from the response to the original InviteAccountToOrganization operation that generated the handshake. You can access handshakes that are ACCEPTED, DECLINED, or CANCELED for only 30 days after they change to that state. They're then deleted and no longer accessible. This operation can be called from any account in the organization.

Required Parameters
{
  "HandshakeId": "The unique identifier (ID) of the handshake that you want information about. You can get the ID from the original call to InviteAccountToOrganization, or from a call to ListHandshakesForAccount or ListHandshakesForOrganization. The regex pattern for handshake ID string requires \"h-\" followed by from 8 to 32 lowercase letters or digits."
}
"""
DescribeHandshake(args) = organizations("DescribeHandshake", args)

"""
    DescribeEffectivePolicy()

Returns the contents of the effective tag policy for the account. The effective tag policy is the aggregation of any tag policies the account inherits, plus any policy directly that is attached to the account.  This action returns information on tag policies only. For more information on policy inheritance, see How Policy Inheritance Works in the AWS Organizations User Guide. This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Required Parameters
{
  "PolicyType": "The type of policy that you want information about."
}

Optional Parameters
{
  "TargetId": "When you're signed in as the master account, specify the ID of the account that you want details about. Specifying an organization root or OU as the target is not supported. "
}
"""
DescribeEffectivePolicy(args) = organizations("DescribeEffectivePolicy", args)

"""
    TagResource()

Adds one or more tags to the specified resource. Currently, you can tag and untag accounts in AWS Organizations. This operation can be called only from the organization's master account.

Required Parameters
{
  "Tags": "The tag to add to the specified resource. Specifying the tag key is required. You can set the value of a tag to an empty string, but you can't set the value of a tag to null.",
  "ResourceId": "The ID of the resource to add a tag to."
}
"""
TagResource(args) = organizations("TagResource", args)

"""
    DescribeOrganization()

Retrieves information about the organization that the user's account belongs to. This operation can be called from any account in the organization.  Even if a policy type is shown as available in the organization, you can disable it separately at the root level with DisablePolicyType. Use ListRoots to see the status of policy types for a specified root. 
"""
DescribeOrganization() = organizations("DescribeOrganization")
DescribeOrganization(args) = organizations("DescribeOrganization", args)

"""
    ListPoliciesForTarget()

Lists the policies that are directly attached to the specified target root, organizational unit (OU), or account. You must specify the policy type that you want included in the returned list.  Always check the NextToken response parameter for a null value when calling a List* operation. These operations can occasionally return an empty set of results even when there are more results available. The NextToken response parameter value is null only when there are no more results to display.  This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Required Parameters
{
  "Filter": "The type of policy that you want to include in the returned list.",
  "TargetId": "The unique identifier (ID) of the root, organizational unit, or account whose policies you want to list. The regex pattern for a target ID string requires one of the following:    Root - A string that begins with \"r-\" followed by from 4 to 32 lowercase letters or digits.    Account - A string that consists of exactly 12 digits.    Organizational unit (OU) - A string that begins with \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters or digits.  "
}

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from."
}
"""
ListPoliciesForTarget(args) = organizations("ListPoliciesForTarget", args)

"""
    DetachPolicy()

Detaches a policy from a target root, organizational unit (OU), or account. If the policy being detached is a service control policy (SCP), the changes to permissions for IAM users and roles in affected accounts are immediate.  Note: Every root, OU, and account must have at least one SCP attached. If you want to replace the default FullAWSAccess policy with one that limits the permissions that can be delegated, you must attach the replacement policy before you can remove the default one. This is the authorization strategy of an "allow list". If you instead attach a second SCP and leave the FullAWSAccess SCP still attached, and specify "Effect": "Deny" in the second SCP to override the "Effect": "Allow" in the FullAWSAccess policy (or any other attached SCP), you're using the authorization strategy of a "deny list". This operation can be called only from the organization's master account.

Required Parameters
{
  "PolicyId": "The unique identifier (ID) of the policy you want to detach. You can get the ID from the ListPolicies or ListPoliciesForTarget operations. The regex pattern for a policy ID string requires \"p-\" followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_).",
  "TargetId": "The unique identifier (ID) of the root, OU, or account that you want to detach the policy from. You can get the ID from the ListRoots, ListOrganizationalUnitsForParent, or ListAccounts operations. The regex pattern for a target ID string requires one of the following:    Root - A string that begins with \"r-\" followed by from 4 to 32 lowercase letters or digits.    Account - A string that consists of exactly 12 digits.    Organizational unit (OU) - A string that begins with \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters or digits.  "
}
"""
DetachPolicy(args) = organizations("DetachPolicy", args)

"""
    ListTargetsForPolicy()

Lists all the roots, organizational units (OUs), and accounts that the specified policy is attached to.  Always check the NextToken response parameter for a null value when calling a List* operation. These operations can occasionally return an empty set of results even when there are more results available. The NextToken response parameter value is null only when there are no more results to display.  This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Required Parameters
{
  "PolicyId": "The unique identifier (ID) of the policy whose attachments you want to know. The regex pattern for a policy ID string requires \"p-\" followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_)."
}

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from."
}
"""
ListTargetsForPolicy(args) = organizations("ListTargetsForPolicy", args)

"""
    DescribeOrganizationalUnit()

Retrieves information about an organizational unit (OU). This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Required Parameters
{
  "OrganizationalUnitId": "The unique identifier (ID) of the organizational unit that you want details about. You can get the ID from the ListOrganizationalUnitsForParent operation. The regex pattern for an organizational unit ID string requires \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of the root that contains the OU). This string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters or digits."
}
"""
DescribeOrganizationalUnit(args) = organizations("DescribeOrganizationalUnit", args)

"""
    EnableAllFeatures()

Enables all features in an organization. This enables the use of organization policies that can restrict the services and actions that can be called in each account. Until you enable all features, you have access only to consolidated billing, and you can't use any of the advanced account administration features that AWS Organizations supports. For more information, see Enabling All Features in Your Organization in the AWS Organizations User Guide.   This operation is required only for organizations that were created explicitly with only the consolidated billing features enabled. Calling this operation sends a handshake to every invited account in the organization. The feature set change can be finalized and the additional features enabled only after all administrators in the invited accounts approve the change by accepting the handshake.  After you enable all features, you can separately enable or disable individual policy types in a root using EnablePolicyType and DisablePolicyType. To see the status of policy types in a root, use ListRoots. After all invited member accounts accept the handshake, you finalize the feature set change by accepting the handshake that contains "Action": "ENABLE_ALL_FEATURES". This completes the change. After you enable all features in your organization, the master account in the organization can apply policies on all member accounts. These policies can restrict what users and even administrators in those accounts can do. The master account can apply policies that prevent accounts from leaving the organization. Ensure that your account administrators are aware of this. This operation can be called only from the organization's master account. 
"""
EnableAllFeatures() = organizations("EnableAllFeatures")
EnableAllFeatures(args) = organizations("EnableAllFeatures", args)

"""
    ListOrganizationalUnitsForParent()

Lists the organizational units (OUs) in a parent organizational unit or root.  Always check the NextToken response parameter for a null value when calling a List* operation. These operations can occasionally return an empty set of results even when there are more results available. The NextToken response parameter value is null only when there are no more results to display.  This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Required Parameters
{
  "ParentId": "The unique identifier (ID) of the root or OU whose child OUs you want to list. The regex pattern for a parent ID string requires one of the following:    Root - A string that begins with \"r-\" followed by from 4 to 32 lowercase letters or digits.    Organizational unit (OU) - A string that begins with \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters or digits.  "
}

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from."
}
"""
ListOrganizationalUnitsForParent(args) = organizations("ListOrganizationalUnitsForParent", args)

"""
    ListChildren()

Lists all of the organizational units (OUs) or accounts that are contained in the specified parent OU or root. This operation, along with ListParents enables you to traverse the tree structure that makes up this root.  Always check the NextToken response parameter for a null value when calling a List* operation. These operations can occasionally return an empty set of results even when there are more results available. The NextToken response parameter value is null only when there are no more results to display.  This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Required Parameters
{
  "ParentId": "The unique identifier (ID) for the parent root or OU whose children you want to list. The regex pattern for a parent ID string requires one of the following:    Root - A string that begins with \"r-\" followed by from 4 to 32 lowercase letters or digits.    Organizational unit (OU) - A string that begins with \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters or digits.  ",
  "ChildType": "Filters the output to include only the specified child type."
}

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from."
}
"""
ListChildren(args) = organizations("ListChildren", args)

"""
    ListCreateAccountStatus()

Lists the account creation requests that match the specified status that is currently being tracked for the organization.  Always check the NextToken response parameter for a null value when calling a List* operation. These operations can occasionally return an empty set of results even when there are more results available. The NextToken response parameter value is null only when there are no more results to display.  This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from.",
  "States": "A list of one or more states that you want included in the response. If this parameter isn't present, all requests are included in the response."
}
"""
ListCreateAccountStatus() = organizations("ListCreateAccountStatus")
ListCreateAccountStatus(args) = organizations("ListCreateAccountStatus", args)

"""
    ListDelegatedServicesForAccount()

List the AWS services for which the specified account is a delegated administrator.  This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Required Parameters
{
  "AccountId": "The account ID number of a delegated administrator account in the organization."
}

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from."
}
"""
ListDelegatedServicesForAccount(args) = organizations("ListDelegatedServicesForAccount", args)

"""
    DeletePolicy()

Deletes the specified policy from your organization. Before you perform this operation, you must first detach the policy from all organizational units (OUs), roots, and accounts. This operation can be called only from the organization's master account.

Required Parameters
{
  "PolicyId": "The unique identifier (ID) of the policy that you want to delete. You can get the ID from the ListPolicies or ListPoliciesForTarget operations. The regex pattern for a policy ID string requires \"p-\" followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_)."
}
"""
DeletePolicy(args) = organizations("DeletePolicy", args)

"""
    CreateOrganization()

Creates an AWS organization. The account whose user is calling the CreateOrganization operation automatically becomes the master account of the new organization. This operation must be called using credentials from the account that is to become the new organization's master account. The principal must also have the relevant IAM permissions. By default (or if you set the FeatureSet parameter to ALL), the new organization is created with all features enabled and service control policies automatically enabled in the root. If you instead choose to create the organization supporting only the consolidated billing features by setting the FeatureSet parameter to CONSOLIDATED_BILLING", no policy types are enabled by default, and you can't use organization policies

Optional Parameters
{
  "FeatureSet": "Specifies the feature set supported by the new organization. Each feature set supports different levels of functionality.    CONSOLIDATED_BILLING: All member accounts have their bills consolidated to and paid by the master account. For more information, see Consolidated billing in the AWS Organizations User Guide.   The consolidated billing feature subset isn't available for organizations in the AWS GovCloud (US) Region.    ALL: In addition to all the features supported by the consolidated billing feature set, the master account can also apply any policy type to any member account in the organization. For more information, see All features in the AWS Organizations User Guide.   "
}
"""
CreateOrganization() = organizations("CreateOrganization")
CreateOrganization(args) = organizations("CreateOrganization", args)

"""
    ListParents()

Lists the root or organizational units (OUs) that serve as the immediate parent of the specified child OU or account. This operation, along with ListChildren enables you to traverse the tree structure that makes up this root.  Always check the NextToken response parameter for a null value when calling a List* operation. These operations can occasionally return an empty set of results even when there are more results available. The NextToken response parameter value is null only when there are no more results to display.  This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.  In the current release, a child can have only a single parent.  

Required Parameters
{
  "ChildId": "The unique identifier (ID) of the OU or account whose parent containers you want to list. Don't specify a root. The regex pattern for a child ID string requires one of the following:    Account - A string that consists of exactly 12 digits.    Organizational unit (OU) - A string that begins with \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of the root that contains the OU). This string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters or digits.  "
}

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from."
}
"""
ListParents(args) = organizations("ListParents", args)

"""
    ListAWSServiceAccessForOrganization()

Returns a list of the AWS services that you enabled to integrate with your organization. After a service on this list creates the resources that it requires for the integration, it can perform operations on your organization and its accounts. For more information about integrating other services with AWS Organizations, including the list of services that currently work with Organizations, see Integrating AWS Organizations with Other AWS Services in the AWS Organizations User Guide.  This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from."
}
"""
ListAWSServiceAccessForOrganization() = organizations("ListAWSServiceAccessForOrganization")
ListAWSServiceAccessForOrganization(args) = organizations("ListAWSServiceAccessForOrganization", args)

"""
    ListAccounts()

Lists all the accounts in the organization. To request only the accounts in a specified root or organizational unit (OU), use the ListAccountsForParent operation instead.  Always check the NextToken response parameter for a null value when calling a List* operation. These operations can occasionally return an empty set of results even when there are more results available. The NextToken response parameter value is null only when there are no more results to display.  This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from."
}
"""
ListAccounts() = organizations("ListAccounts")
ListAccounts(args) = organizations("ListAccounts", args)

"""
    UntagResource()

Removes a tag from the specified resource.  Currently, you can tag and untag accounts in AWS Organizations. This operation can be called only from the organization's master account.

Required Parameters
{
  "ResourceId": "The ID of the resource to remove the tag from.",
  "TagKeys": "The tag to remove from the specified resource."
}
"""
UntagResource(args) = organizations("UntagResource", args)

"""
    DisablePolicyType()

Disables an organizational control policy type in a root. A policy of a certain type can be attached to entities in a root only if that type is enabled in the root. After you perform this operation, you no longer can attach policies of the specified type to that root or to any organizational unit (OU) or account in that root. You can undo this by using the EnablePolicyType operation. This is an asynchronous request that AWS performs in the background. If you disable a policy for a root, it still appears enabled for the organization if all features are enabled for the organization. AWS recommends that you first use ListRoots to see the status of policy types for a specified root, and then use this operation.  This operation can be called only from the organization's master account.  To view the status of available policy types in the organization, use DescribeOrganization.

Required Parameters
{
  "PolicyType": "The policy type that you want to disable in this root.",
  "RootId": "The unique identifier (ID) of the root in which you want to disable a policy type. You can get the ID from the ListRoots operation. The regex pattern for a root ID string requires \"r-\" followed by from 4 to 32 lowercase letters or digits."
}
"""
DisablePolicyType(args) = organizations("DisablePolicyType", args)

"""
    ListDelegatedAdministrators()

Lists the AWS accounts that are designated as delegated administrators in this organization. This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "ServicePrincipal": "Specifies a service principal name. If specified, then the operation lists the delegated administrators only for the specified service. If you don't specify a service principal, the operation lists all delegated administrators for all services in your organization.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from."
}
"""
ListDelegatedAdministrators() = organizations("ListDelegatedAdministrators")
ListDelegatedAdministrators(args) = organizations("ListDelegatedAdministrators", args)

"""
    DeregisterDelegatedAdministrator()

Removes the specified member AWS account as a delegated administrator for the specified AWS service. You can run this action only for AWS services that support this feature. For a current list of services that support it, see AWS Services That Support Using Delegated Administrators in the AWS Organizations User Guide.  This operation can be called only from the organization's master account.

Required Parameters
{
  "ServicePrincipal": "The service principal name of an AWS service for which the account is a delegated administrator. Delegated administrator privileges are revoked for only the specified AWS service from the member account. If the specified service is the only service for which the member account is a delegated administrator, the operation also revokes Organizations read action permissions.",
  "AccountId": "The account ID number of the member account in the organization that you want to deregister as a delegated administrator."
}
"""
DeregisterDelegatedAdministrator(args) = organizations("DeregisterDelegatedAdministrator", args)

"""
    RemoveAccountFromOrganization()

Removes the specified account from the organization. The removed account becomes a standalone account that isn't a member of any organization. It's no longer subject to any policies and is responsible for its own bill payments. The organization's master account is no longer charged for any expenses accrued by the member account after it's removed from the organization. This operation can be called only from the organization's master account. Member accounts can remove themselves with LeaveOrganization instead.  You can remove an account from your organization only if the account is configured with the information required to operate as a standalone account. When you create an account in an organization using the AWS Organizations console, API, or CLI commands, the information required of standalone accounts is not automatically collected. For an account that you want to make standalone, you must accept the end user license agreement (EULA), choose a support plan, provide and verify the required contact information, and provide a current payment method. AWS uses the payment method to charge for any billable (not free tier) AWS activity that occurs while the account isn't attached to an organization. To remove an account that doesn't yet have this information, you must sign in as the member account and follow the steps at  To leave an organization when all required account information has not yet been provided in the AWS Organizations User Guide.  

Required Parameters
{
  "AccountId": "The unique identifier (ID) of the member account that you want to remove from the organization. The regex pattern for an account ID string requires exactly 12 digits."
}
"""
RemoveAccountFromOrganization(args) = organizations("RemoveAccountFromOrganization", args)

"""
    UpdateOrganizationalUnit()

Renames the specified organizational unit (OU). The ID and ARN don't change. The child OUs and accounts remain in place, and any attached policies of the OU remain attached.  This operation can be called only from the organization's master account.

Required Parameters
{
  "OrganizationalUnitId": "The unique identifier (ID) of the OU that you want to rename. You can get the ID from the ListOrganizationalUnitsForParent operation. The regex pattern for an organizational unit ID string requires \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of the root that contains the OU). This string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters or digits."
}

Optional Parameters
{
  "Name": "The new name that you want to assign to the OU. The regex pattern that is used to validate this parameter is a string of any of the characters in the ASCII character range."
}
"""
UpdateOrganizationalUnit(args) = organizations("UpdateOrganizationalUnit", args)

"""
    ListTagsForResource()

Lists tags for the specified resource.  Currently, you can list tags on an account in AWS Organizations. This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Required Parameters
{
  "ResourceId": "The ID of the resource that you want to retrieve tags for. "
}

Optional Parameters
{
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from."
}
"""
ListTagsForResource(args) = organizations("ListTagsForResource", args)

"""
    MoveAccount()

Moves an account from its current source parent root or organizational unit (OU) to the specified destination parent root or OU. This operation can be called only from the organization's master account.

Required Parameters
{
  "AccountId": "The unique identifier (ID) of the account that you want to move. The regex pattern for an account ID string requires exactly 12 digits.",
  "SourceParentId": "The unique identifier (ID) of the root or organizational unit that you want to move the account from. The regex pattern for a parent ID string requires one of the following:    Root - A string that begins with \"r-\" followed by from 4 to 32 lowercase letters or digits.    Organizational unit (OU) - A string that begins with \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters or digits.  ",
  "DestinationParentId": "The unique identifier (ID) of the root or organizational unit that you want to move the account to. The regex pattern for a parent ID string requires one of the following:    Root - A string that begins with \"r-\" followed by from 4 to 32 lowercase letters or digits.    Organizational unit (OU) - A string that begins with \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters or digits.  "
}
"""
MoveAccount(args) = organizations("MoveAccount", args)

"""
    DeleteOrganizationalUnit()

Deletes an organizational unit (OU) from a root or another OU. You must first remove all accounts and child OUs from the OU that you want to delete. This operation can be called only from the organization's master account.

Required Parameters
{
  "OrganizationalUnitId": "The unique identifier (ID) of the organizational unit that you want to delete. You can get the ID from the ListOrganizationalUnitsForParent operation. The regex pattern for an organizational unit ID string requires \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of the root that contains the OU). This string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters or digits."
}
"""
DeleteOrganizationalUnit(args) = organizations("DeleteOrganizationalUnit", args)

"""
    DeleteOrganization()

Deletes the organization. You can delete an organization only by using credentials from the master account. The organization must be empty of member accounts.
"""
DeleteOrganization() = organizations("DeleteOrganization")
DeleteOrganization(args) = organizations("DeleteOrganization", args)

"""
    AttachPolicy()

Attaches a policy to a root, an organizational unit (OU), or an individual account. How the policy affects accounts depends on the type of policy:    Service control policy (SCP) - An SCP specifies what permissions can be delegated to users in affected member accounts. The scope of influence for a policy depends on what you attach the policy to:   If you attach an SCP to a root, it affects all accounts in the organization.   If you attach an SCP to an OU, it affects all accounts in that OU and in any child OUs.   If you attach the policy directly to an account, it affects only that account.   SCPs are JSON policies that specify the maximum permissions for an organization or organizational unit (OU). You can attach one SCP to a higher level root or OU, and a different SCP to a child OU or to an account. The child policy can further restrict only the permissions that pass through the parent filter and are available to the child. An SCP that is attached to a child can't grant a permission that the parent hasn't already granted. For example, imagine that the parent SCP allows permissions A, B, C, D, and E. The child SCP allows C, D, E, F, and G. The result is that the accounts affected by the child SCP are allowed to use only C, D, and E. They can't use A or B because the child OU filtered them out. They also can't use F and G because the parent OU filtered them out. They can't be granted back by the child SCP; child SCPs can only filter the permissions they receive from the parent SCP. AWS Organizations attaches a default SCP named "FullAWSAccess to every root, OU, and account. This default SCP allows all services and actions, enabling any new child OU or account to inherit the permissions of the parent root or OU. If you detach the default policy, you must replace it with a policy that specifies the permissions that you want to allow in that OU or account. For more information about how AWS Organizations policies permissions work, see Using Service Control Policies in the AWS Organizations User Guide.    This operation can be called only from the organization's master account.

Required Parameters
{
  "PolicyId": "The unique identifier (ID) of the policy that you want to attach to the target. You can get the ID for the policy by calling the ListPolicies operation. The regex pattern for a policy ID string requires \"p-\" followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_).",
  "TargetId": "The unique identifier (ID) of the root, OU, or account that you want to attach the policy to. You can get the ID by calling the ListRoots, ListOrganizationalUnitsForParent, or ListAccounts operations. The regex pattern for a target ID string requires one of the following:    Root - A string that begins with \"r-\" followed by from 4 to 32 lowercase letters or digits.    Account - A string that consists of exactly 12 digits.    Organizational unit (OU) - A string that begins with \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters or digits.  "
}
"""
AttachPolicy(args) = organizations("AttachPolicy", args)

"""
    CreateOrganizationalUnit()

Creates an organizational unit (OU) within a root or parent OU. An OU is a container for accounts that enables you to organize your accounts to apply policies according to your business requirements. The number of levels deep that you can nest OUs is dependent upon the policy types enabled for that root. For service control policies, the limit is five.  For more information about OUs, see Managing Organizational Units in the AWS Organizations User Guide.  This operation can be called only from the organization's master account.

Required Parameters
{
  "ParentId": "The unique identifier (ID) of the parent root or OU that you want to create the new OU in. The regex pattern for a parent ID string requires one of the following:    Root - A string that begins with \"r-\" followed by from 4 to 32 lowercase letters or digits.    Organizational unit (OU) - A string that begins with \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters or digits.  ",
  "Name": "The friendly name to assign to the new OU."
}
"""
CreateOrganizationalUnit(args) = organizations("CreateOrganizationalUnit", args)

"""
    ListRoots()

Lists the roots that are defined in the current organization.  Always check the NextToken response parameter for a null value when calling a List* operation. These operations can occasionally return an empty set of results even when there are more results available. The NextToken response parameter value is null only when there are no more results to display.  This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.  Policy types can be enabled and disabled in roots. This is distinct from whether they're available in the organization. When you enable all features, you make policy types available for use in that organization. Individual policy types can then be enabled and disabled in a root. To see the availability of a policy type in an organization, use DescribeOrganization. 

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from."
}
"""
ListRoots() = organizations("ListRoots")
ListRoots(args) = organizations("ListRoots", args)

"""
    InviteAccountToOrganization()

Sends an invitation to another account to join your organization as a member account. AWS Organizations sends email on your behalf to the email address that is associated with the other account's owner. The invitation is implemented as a Handshake whose details are in the response.    You can invite AWS accounts only from the same seller as the master account. For example, if your organization's master account was created by Amazon Internet Services Pvt. Ltd (AISPL), an AWS seller in India, you can invite only other AISPL accounts to your organization. You can't combine accounts from AISPL and AWS or from any other AWS seller. For more information, see Consolidated Billing in India.   If you receive an exception that indicates that you exceeded your account limits for the organization or that the operation failed because your organization is still initializing, wait one hour and then try again. If the error persists after an hour, contact AWS Support.    This operation can be called only from the organization's master account.

Required Parameters
{
  "Target": "The identifier (ID) of the AWS account that you want to invite to join your organization. This is a JSON object that contains the following elements:   { \"Type\": \"ACCOUNT\", \"Id\": \"&lt; account id number &gt;\" }  If you use the AWS CLI, you can submit this as a single string, similar to the following example:  --target Id=123456789012,Type=ACCOUNT  If you specify \"Type\": \"ACCOUNT\", you must provide the AWS account ID number as the Id. If you specify \"Type\": \"EMAIL\", you must specify the email address that is associated with the account.  --target Id=diego@example.com,Type=EMAIL "
}

Optional Parameters
{
  "Notes": "Additional information that you want to include in the generated email to the recipient account owner."
}
"""
InviteAccountToOrganization(args) = organizations("InviteAccountToOrganization", args)

"""
    LeaveOrganization()

Removes a member account from its parent organization. This version of the operation is performed by the account that wants to leave. To remove a member account as a user in the master account, use RemoveAccountFromOrganization instead. This operation can be called only from a member account in the organization.    The master account in an organization with all features enabled can set service control policies (SCPs) that can restrict what administrators of member accounts can do. This includes preventing them from successfully calling LeaveOrganization and leaving the organization.    You can leave an organization as a member account only if the account is configured with the information required to operate as a standalone account. When you create an account in an organization using the AWS Organizations console, API, or CLI commands, the information required of standalone accounts is not automatically collected. For each account that you want to make standalone, you must do the following steps:   Accept the end user license agreement (EULA)   Choose a support plan   Provide and verify the required contact information   Provide a current payment method   AWS uses the payment method to charge for any billable (not free tier) AWS activity that occurs while the account isn't attached to an organization. Follow the steps at  To leave an organization when all required account information has not yet been provided in the AWS Organizations User Guide.    You can leave an organization only after you enable IAM user access to billing in your account. For more information, see Activating Access to the Billing and Cost Management Console in the AWS Billing and Cost Management User Guide.    
"""
LeaveOrganization() = organizations("LeaveOrganization")
LeaveOrganization(args) = organizations("LeaveOrganization", args)

"""
    ListAccountsForParent()

Lists the accounts in an organization that are contained by the specified target root or organizational unit (OU). If you specify the root, you get a list of all the accounts that aren't in any OU. If you specify an OU, you get a list of all the accounts in only that OU and not in any child OUs. To get a list of all accounts in the organization, use the ListAccounts operation.  Always check the NextToken response parameter for a null value when calling a List* operation. These operations can occasionally return an empty set of results even when there are more results available. The NextToken response parameter value is null only when there are no more results to display.  This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Required Parameters
{
  "ParentId": "The unique identifier (ID) for the parent root or organization unit (OU) whose accounts you want to list."
}

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from."
}
"""
ListAccountsForParent(args) = organizations("ListAccountsForParent", args)

"""
    EnablePolicyType()

Enables a policy type in a root. After you enable a policy type in a root, you can attach policies of that type to the root, any organizational unit (OU), or account in that root. You can undo this by using the DisablePolicyType operation. This is an asynchronous request that AWS performs in the background. AWS recommends that you first use ListRoots to see the status of policy types for a specified root, and then use this operation.  This operation can be called only from the organization's master account. You can enable a policy type in a root only if that policy type is available in the organization. To view the status of available policy types in the organization, use DescribeOrganization.

Required Parameters
{
  "PolicyType": "The policy type that you want to enable.",
  "RootId": "The unique identifier (ID) of the root in which you want to enable a policy type. You can get the ID from the ListRoots operation. The regex pattern for a root ID string requires \"r-\" followed by from 4 to 32 lowercase letters or digits."
}
"""
EnablePolicyType(args) = organizations("EnablePolicyType", args)

"""
    UpdatePolicy()

Updates an existing policy with a new name, description, or content. If you don't supply any parameter, that value remains unchanged. You can't change a policy's type. This operation can be called only from the organization's master account.

Required Parameters
{
  "PolicyId": "The unique identifier (ID) of the policy that you want to update. The regex pattern for a policy ID string requires \"p-\" followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_)."
}

Optional Parameters
{
  "Description": "If provided, the new description for the policy.",
  "Content": "If provided, the new content for the policy. The text must be correctly formatted JSON that complies with the syntax for the policy's type. For more information, see Service Control Policy Syntax in the AWS Organizations User Guide. ",
  "Name": "If provided, the new name for the policy. The regex pattern that is used to validate this parameter is a string of any of the characters in the ASCII character range."
}
"""
UpdatePolicy(args) = organizations("UpdatePolicy", args)

"""
    ListPolicies()

Retrieves the list of all policies in an organization of a specified type.  Always check the NextToken response parameter for a null value when calling a List* operation. These operations can occasionally return an empty set of results even when there are more results available. The NextToken response parameter value is null only when there are no more results to display.  This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Required Parameters
{
  "Filter": "Specifies the type of policy that you want to include in the response."
}

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from."
}
"""
ListPolicies(args) = organizations("ListPolicies", args)

"""
    AcceptHandshake()

Sends a response to the originator of a handshake agreeing to the action proposed by the handshake request.  This operation can be called only by the following principals when they also have the relevant IAM permissions:    Invitation to join or Approve all features request handshakes: only a principal from the member account.  The user who calls the API for an invitation to join must have the organizations:AcceptHandshake permission. If you enabled all features in the organization, the user must also have the iam:CreateServiceLinkedRole permission so that AWS Organizations can create the required service-linked role named AWSServiceRoleForOrganizations. For more information, see AWS Organizations and Service-Linked Roles in the AWS Organizations User Guide.    Enable all features final confirmation handshake: only a principal from the master account. For more information about invitations, see Inviting an AWS Account to Join Your Organization in the AWS Organizations User Guide. For more information about requests to enable all features in the organization, see Enabling All Features in Your Organization in the AWS Organizations User Guide.    After you accept a handshake, it continues to appear in the results of relevant APIs for only 30 days. After that, it's deleted.

Required Parameters
{
  "HandshakeId": "The unique identifier (ID) of the handshake that you want to accept. The regex pattern for handshake ID string requires \"h-\" followed by from 8 to 32 lowercase letters or digits."
}
"""
AcceptHandshake(args) = organizations("AcceptHandshake", args)

"""
    CreatePolicy()

Creates a policy of a specified type that you can attach to a root, an organizational unit (OU), or an individual AWS account. For more information about policies and their use, see Managing Organization Policies. This operation can be called only from the organization's master account.

Required Parameters
{
  "Description": "An optional description to assign to the policy.",
  "Content": "The policy content to add to the new policy. For example, if you create a service control policy (SCP), this string must be JSON text that specifies the permissions that admins in attached accounts can delegate to their users, groups, and roles. For more information about the SCP syntax, see Service Control Policy Syntax in the AWS Organizations User Guide. ",
  "Type": "The type of policy to create.  In the current release, the only type of policy that you can create is a service control policy (SCP). ",
  "Name": "The friendly name to assign to the policy. The regex pattern that is used to validate this parameter is a string of any of the characters in the ASCII character range."
}
"""
CreatePolicy(args) = organizations("CreatePolicy", args)

"""
    DescribeCreateAccountStatus()

Retrieves the current status of an asynchronous request to create an account. This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Required Parameters
{
  "CreateAccountRequestId": "Specifies the operationId that uniquely identifies the request. You can get the ID from the response to an earlier CreateAccount request, or from the ListCreateAccountStatus operation. The regex pattern for a create account request ID string requires \"car-\" followed by from 8 to 32 lowercase letters or digits."
}
"""
DescribeCreateAccountStatus(args) = organizations("DescribeCreateAccountStatus", args)

"""
    CreateAccount()

Creates an AWS account that is automatically a member of the organization whose credentials made the request. This is an asynchronous request that AWS performs in the background. Because CreateAccount operates asynchronously, it can return a successful completion message even though account initialization might still be in progress. You might need to wait a few minutes before you can successfully access the account. To check the status of the request, do one of the following:   Use the OperationId response element from this operation to provide as a parameter to the DescribeCreateAccountStatus operation.   Check the AWS CloudTrail log for the CreateAccountResult event. For information on using AWS CloudTrail with AWS Organizations, see Monitoring the Activity in Your Organization in the AWS Organizations User Guide.     The user who calls the API to create an account must have the organizations:CreateAccount permission. If you enabled all features in the organization, AWS Organizations creates the required service-linked role named AWSServiceRoleForOrganizations. For more information, see AWS Organizations and Service-Linked Roles in the AWS Organizations User Guide. AWS Organizations preconfigures the new member account with a role (named OrganizationAccountAccessRole by default) that grants users in the master account administrator permissions in the new member account. Principals in the master account can assume the role. AWS Organizations clones the company name and address information for the new account from the organization's master account. This operation can be called only from the organization's master account. For more information about creating accounts, see Creating an AWS Account in Your Organization in the AWS Organizations User Guide.     When you create an account in an organization using the AWS Organizations console, API, or CLI commands, the information required for the account to operate as a standalone account, such as a payment method and signing the end user license agreement (EULA) is not automatically collected. If you must remove an account from your organization later, you can do so only after you provide the missing information. Follow the steps at  To leave an organization as a member account in the AWS Organizations User Guide.   If you get an exception that indicates that you exceeded your account limits for the organization, contact AWS Support.   If you get an exception that indicates that the operation failed because your organization is still initializing, wait one hour and then try again. If the error persists, contact AWS Support.   Using CreateAccount to create multiple temporary accounts isn't recommended. You can only close an account from the Billing and Cost Management Console, and you must be signed in as the root user. For information on the requirements and process for closing an account, see Closing an AWS Account in the AWS Organizations User Guide.     When you create a member account with this operation, you can choose whether to create the account with the IAM User and Role Access to Billing Information switch enabled. If you enable it, IAM users and roles that have appropriate permissions can view billing information for the account. If you disable it, only the account root user can access billing information. For information about how to disable this switch for an account, see Granting Access to Your Billing Information and Tools. 

Required Parameters
{
  "Email": "The email address of the owner to assign to the new member account. This email address must not already be associated with another AWS account. You must use a valid email address to complete account creation. You can't access the root user of the account or remove an account that was created with an invalid email address.",
  "AccountName": "The friendly name of the member account."
}

Optional Parameters
{
  "IamUserAccessToBilling": "If set to ALLOW, the new account enables IAM users to access account billing information if they have the required permissions. If set to DENY, only the root user of the new account can access account billing information. For more information, see Activating Access to the Billing and Cost Management Console in the AWS Billing and Cost Management User Guide. If you don't specify this parameter, the value defaults to ALLOW, and IAM users and roles with the required permissions can access billing information for the new account.",
  "RoleName": "(Optional) The name of an IAM role that AWS Organizations automatically preconfigures in the new member account. This role trusts the master account, allowing users in the master account to assume the role, as permitted by the master account administrator. The role has administrator permissions in the new member account. If you don't specify this parameter, the role name defaults to OrganizationAccountAccessRole. For more information about how to use this role to access the member account, see the following links:    Accessing and Administering the Member Accounts in Your Organization in the AWS Organizations User Guide    Steps 2 and 3 in Tutorial: Delegate Access Across AWS Accounts Using IAM Roles in the IAM User Guide    The regex pattern that is used to validate this parameter. The pattern can include uppercase letters, lowercase letters, digits with no spaces, and any of the following characters: =,.@-"
}
"""
CreateAccount(args) = organizations("CreateAccount", args)

"""
    DeclineHandshake()

Declines a handshake request. This sets the handshake state to DECLINED and effectively deactivates the request. This operation can be called only from the account that received the handshake. The originator of the handshake can use CancelHandshake instead. The originator can't reactivate a declined request, but can reinitiate the process with a new handshake request. After you decline a handshake, it continues to appear in the results of relevant APIs for only 30 days. After that, it's deleted.

Required Parameters
{
  "HandshakeId": "The unique identifier (ID) of the handshake that you want to decline. You can get the ID from the ListHandshakesForAccount operation. The regex pattern for handshake ID string requires \"h-\" followed by from 8 to 32 lowercase letters or digits."
}
"""
DeclineHandshake(args) = organizations("DeclineHandshake", args)

"""
    DescribePolicy()

Retrieves information about a policy. This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Required Parameters
{
  "PolicyId": "The unique identifier (ID) of the policy that you want details about. You can get the ID from the ListPolicies or ListPoliciesForTarget operations. The regex pattern for a policy ID string requires \"p-\" followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_)."
}
"""
DescribePolicy(args) = organizations("DescribePolicy", args)

"""
    DescribeAccount()

Retrieves AWS Organizations-related information about the specified account. This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Required Parameters
{
  "AccountId": "The unique identifier (ID) of the AWS account that you want information about. You can get the ID from the ListAccounts or ListAccountsForParent operations. The regex pattern for an account ID string requires exactly 12 digits."
}
"""
DescribeAccount(args) = organizations("DescribeAccount", args)

"""
    RegisterDelegatedAdministrator()

Enables the specified member account to administer the Organizations features of the specified AWS service. It grants read-only access to AWS Organizations service data. The account still requires IAM permissions to access and administer the AWS service. You can run this action only for AWS services that support this feature. For a current list of services that support it, see AWS Services That Support Using Delegated Administrators in the AWS Organizations User Guide.  This operation can be called only from the organization's master account.

Required Parameters
{
  "ServicePrincipal": "The service principal of the AWS service for which you want to make the member account a delegated administrator.",
  "AccountId": "The account ID number of the member account in the organization to register as a delegated administrator."
}
"""
RegisterDelegatedAdministrator(args) = organizations("RegisterDelegatedAdministrator", args)

"""
    CreateGovCloudAccount()

This action is available if all of the following are true:   You're authorized to create accounts in the AWS GovCloud (US) Region. For more information on the AWS GovCloud (US) Region, see the  AWS GovCloud User Guide.    You already have an account in the AWS GovCloud (US) Region that is associated with your master account in the commercial Region.    You call this action from the master account of your organization in the commercial Region.   You have the organizations:CreateGovCloudAccount permission. AWS Organizations creates the required service-linked role named AWSServiceRoleForOrganizations. For more information, see AWS Organizations and Service-Linked Roles in the AWS Organizations User Guide.    AWS automatically enables AWS CloudTrail for AWS GovCloud (US) accounts, but you should also do the following:   Verify that AWS CloudTrail is enabled to store logs.   Create an S3 bucket for AWS CloudTrail log storage. For more information, see Verifying AWS CloudTrail Is Enabled in the AWS GovCloud User Guide.    You call this action from the master account of your organization in the commercial Region to create a standalone AWS account in the AWS GovCloud (US) Region. After the account is created, the master account of an organization in the AWS GovCloud (US) Region can invite it to that organization. For more information on inviting standalone accounts in the AWS GovCloud (US) to join an organization, see AWS Organizations in the AWS GovCloud User Guide.  Calling CreateGovCloudAccount is an asynchronous request that AWS performs in the background. Because CreateGovCloudAccount operates asynchronously, it can return a successful completion message even though account initialization might still be in progress. You might need to wait a few minutes before you can successfully access the account. To check the status of the request, do one of the following:   Use the OperationId response element from this operation to provide as a parameter to the DescribeCreateAccountStatus operation.   Check the AWS CloudTrail log for the CreateAccountResult event. For information on using AWS CloudTrail with Organizations, see Monitoring the Activity in Your Organization in the AWS Organizations User Guide.     When you call the CreateGovCloudAccount action, you create two accounts: a standalone account in the AWS GovCloud (US) Region and an associated account in the commercial Region for billing and support purposes. The account in the commercial Region is automatically a member of the organization whose credentials made the request. Both accounts are associated with the same email address. A role is created in the new account in the commercial Region that allows the master account in the organization in the commercial Region to assume it. An AWS GovCloud (US) account is then created and associated with the commercial account that you just created. A role is created in the new AWS GovCloud (US) account that can be assumed by the AWS GovCloud (US) account that is associated with the master account of the commercial organization. For more information and to view a diagram that explains how account access works, see AWS Organizations in the AWS GovCloud User Guide.  For more information about creating accounts, see Creating an AWS Account in Your Organization in the AWS Organizations User Guide.     When you create an account in an organization using the AWS Organizations console, API, or CLI commands, the information required for the account to operate as a standalone account, such as a payment method and signing the end user license agreement (EULA) is not automatically collected. If you must remove an account from your organization later, you can do so only after you provide the missing information. Follow the steps at  To leave an organization as a member account in the AWS Organizations User Guide.    If you get an exception that indicates that you exceeded your account limits for the organization, contact AWS Support.   If you get an exception that indicates that the operation failed because your organization is still initializing, wait one hour and then try again. If the error persists, contact AWS Support.   Using CreateGovCloudAccount to create multiple temporary accounts isn't recommended. You can only close an account from the AWS Billing and Cost Management console, and you must be signed in as the root user. For information on the requirements and process for closing an account, see Closing an AWS Account in the AWS Organizations User Guide.     When you create a member account with this operation, you can choose whether to create the account with the IAM User and Role Access to Billing Information switch enabled. If you enable it, IAM users and roles that have appropriate permissions can view billing information for the account. If you disable it, only the account root user can access billing information. For information about how to disable this switch for an account, see Granting Access to Your Billing Information and Tools. 

Required Parameters
{
  "Email": "The email address of the owner to assign to the new member account in the commercial Region. This email address must not already be associated with another AWS account. You must use a valid email address to complete account creation. You can't access the root user of the account or remove an account that was created with an invalid email address. Like all request parameters for CreateGovCloudAccount, the request for the email address for the AWS GovCloud (US) account originates from the commercial Region, not from the AWS GovCloud (US) Region.",
  "AccountName": "The friendly name of the member account."
}

Optional Parameters
{
  "IamUserAccessToBilling": "If set to ALLOW, the new linked account in the commercial Region enables IAM users to access account billing information if they have the required permissions. If set to DENY, only the root user of the new account can access account billing information. For more information, see Activating Access to the Billing and Cost Management Console in the AWS Billing and Cost Management User Guide.  If you don't specify this parameter, the value defaults to ALLOW, and IAM users and roles with the required permissions can access billing information for the new account.",
  "RoleName": "(Optional) The name of an IAM role that AWS Organizations automatically preconfigures in the new member accounts in both the AWS GovCloud (US) Region and in the commercial Region. This role trusts the master account, allowing users in the master account to assume the role, as permitted by the master account administrator. The role has administrator permissions in the new member account. If you don't specify this parameter, the role name defaults to OrganizationAccountAccessRole. For more information about how to use this role to access the member account, see Accessing and Administering the Member Accounts in Your Organization in the AWS Organizations User Guide and steps 2 and 3 in Tutorial: Delegate Access Across AWS Accounts Using IAM Roles in the IAM User Guide.  The regex pattern that is used to validate this parameter. The pattern can include uppercase letters, lowercase letters, digits with no spaces, and any of the following characters: =,.@-"
}
"""
CreateGovCloudAccount(args) = organizations("CreateGovCloudAccount", args)

"""
    EnableAWSServiceAccess()

Enables the integration of an AWS service (the service that is specified by ServicePrincipal) with AWS Organizations. When you enable integration, you allow the specified service to create a service-linked role in all the accounts in your organization. This allows the service to perform operations on your behalf in your organization and its accounts.  We recommend that you enable integration between AWS Organizations and the specified AWS service by using the console or commands that are provided by the specified service. Doing so ensures that the service is aware that it can create the resources that are required for the integration. How the service creates those resources in the organization's accounts depends on that service. For more information, see the documentation for the other AWS service.  For more information about enabling services to integrate with AWS Organizations, see Integrating AWS Organizations with Other AWS Services in the AWS Organizations User Guide.  This operation can be called only from the organization's master account and only if the organization has enabled all features.

Required Parameters
{
  "ServicePrincipal": "The service principal name of the AWS service for which you want to enable integration with your organization. This is typically in the form of a URL, such as  service-abbreviation.amazonaws.com."
}
"""
EnableAWSServiceAccess(args) = organizations("EnableAWSServiceAccess", args)

"""
    ListHandshakesForOrganization()

Lists the handshakes that are associated with the organization that the requesting user is part of. The ListHandshakesForOrganization operation returns a list of handshake structures. Each structure contains details and status about a handshake. Handshakes that are ACCEPTED, DECLINED, or CANCELED appear in the results of this API for only 30 days after changing to that state. After that, they're deleted and no longer accessible.  Always check the NextToken response parameter for a null value when calling a List* operation. These operations can occasionally return an empty set of results even when there are more results available. The NextToken response parameter value is null only when there are no more results to display.  This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from.",
  "Filter": "A filter of the handshakes that you want included in the response. The default is all types. Use the ActionType element to limit the output to only a specified type, such as INVITE, ENABLE-ALL-FEATURES, or APPROVE-ALL-FEATURES. Alternatively, for the ENABLE-ALL-FEATURES handshake that generates a separate child handshake for each member account, you can specify the ParentHandshakeId to see only the handshakes that were generated by that parent request."
}
"""
ListHandshakesForOrganization() = organizations("ListHandshakesForOrganization")
ListHandshakesForOrganization(args) = organizations("ListHandshakesForOrganization", args)

"""
    ListHandshakesForAccount()

Lists the current handshakes that are associated with the account of the requesting user. Handshakes that are ACCEPTED, DECLINED, or CANCELED appear in the results of this API for only 30 days after changing to that state. After that, they're deleted and no longer accessible.  Always check the NextToken response parameter for a null value when calling a List* operation. These operations can occasionally return an empty set of results even when there are more results available. The NextToken response parameter value is null only when there are no more results to display.  This operation can be called only from the organization's master account or by a member account that is a delegated administrator for an AWS service.

Optional Parameters
{
  "MaxResults": "The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the NextToken response element is present and has a value (is not null). Include that value as the NextToken request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check NextToken after every operation to ensure that you receive all of the results.",
  "NextToken": "The parameter for receiving additional results if you receive a NextToken response in a previous request. A NextToken response indicates that more output is available. Set this parameter to the value of the previous call's NextToken response to indicate where the output should continue from.",
  "Filter": "Filters the handshakes that you want included in the response. The default is all types. Use the ActionType element to limit the output to only a specified type, such as INVITE, ENABLE_ALL_FEATURES, or APPROVE_ALL_FEATURES. Alternatively, for the ENABLE_ALL_FEATURES handshake that generates a separate child handshake for each member account, you can specify ParentHandshakeId to see only the handshakes that were generated by that parent request."
}
"""
ListHandshakesForAccount() = organizations("ListHandshakesForAccount")
ListHandshakesForAccount(args) = organizations("ListHandshakesForAccount", args)
