include("../AWSServices.jl")
using .AWSServices: dlm

"""
    ListTagsForResource()

Lists the tags for the specified resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource."
}
"""
ListTagsForResource(args) = dlm("GET", "/tags/{resourceArn}", args)

"""
    UntagResource()

Removes the specified tags from the specified resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource.",
  "TagKeys": "The tag keys."
}
"""
UntagResource(args) = dlm("DELETE", "/tags/{resourceArn}", args)

"""
    GetLifecyclePolicy()

Gets detailed information about the specified lifecycle policy.

Required Parameters
{
  "PolicyId": "The identifier of the lifecycle policy."
}
"""
GetLifecyclePolicy(args) = dlm("GET", "/policies/{policyId}/", args)

"""
    CreateLifecyclePolicy()

Creates a policy to manage the lifecycle of the specified AWS resources. You can create up to 100 lifecycle policies.

Required Parameters
{
  "PolicyDetails": "The configuration details of the lifecycle policy.",
  "Description": "A description of the lifecycle policy. The characters ^[0-9A-Za-z _-]+  are supported.",
  "State": "The desired activation state of the lifecycle policy after creation.",
  "ExecutionRoleArn": "The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle policy."
}

Optional Parameters
{
  "Tags": "The tags to apply to the lifecycle policy during creation."
}
"""
CreateLifecyclePolicy(args) = dlm("POST", "/policies", args)

"""
    GetLifecyclePolicies()

Gets summary information about all or the specified data lifecycle policies. To get complete information about a policy, use GetLifecyclePolicy.

Optional Parameters
{
  "TagsToAdd": "The tags to add to objects created by the policy. Tags are strings in the format key=value. These user-defined tags are added in addition to the AWS-added lifecycle tags.",
  "TargetTags": "The target tag for a policy. Tags are strings in the format key=value.",
  "PolicyIds": "The identifiers of the data lifecycle policies.",
  "State": "The activation state.",
  "ResourceTypes": "The resource type."
}
"""
GetLifecyclePolicies() = dlm("GET", "/policies")
GetLifecyclePolicies(args) = dlm("GET", "/policies", args)

"""
    UpdateLifecyclePolicy()

Updates the specified lifecycle policy.

Required Parameters
{
  "PolicyId": "The identifier of the lifecycle policy."
}

Optional Parameters
{
  "PolicyDetails": "The configuration of the lifecycle policy. You cannot update the policy type or the resource type.",
  "Description": "A description of the lifecycle policy.",
  "State": "The desired activation state of the lifecycle policy after creation.",
  "ExecutionRoleArn": "The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle policy."
}
"""
UpdateLifecyclePolicy(args) = dlm("PATCH", "/policies/{policyId}", args)

"""
    DeleteLifecyclePolicy()

Deletes the specified lifecycle policy and halts the automated operations that the policy specified.

Required Parameters
{
  "PolicyId": "The identifier of the lifecycle policy."
}
"""
DeleteLifecyclePolicy(args) = dlm("DELETE", "/policies/{policyId}/", args)

"""
    TagResource()

Adds the specified tags to the specified resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource.",
  "Tags": "One or more tags."
}
"""
TagResource(args) = dlm("POST", "/tags/{resourceArn}", args)
