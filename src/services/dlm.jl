# This file is auto-generated by AWSMetadata.jl
include("../AWSServices.jl")
using .AWSServices: dlm

"""
    CreateLifecyclePolicy()

Creates a policy to manage the lifecycle of the specified AWS resources. You can create up to 100 lifecycle policies.

Required Parameters
{
  "Description": "A description of the lifecycle policy. The characters ^[0-9A-Za-z _-]+  are supported.",
  "ExecutionRoleArn": "The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle policy.",
  "PolicyDetails": "The configuration details of the lifecycle policy.",
  "State": "The desired activation state of the lifecycle policy after creation."
}

Optional Parameters
{
  "Tags": "The tags to apply to the lifecycle policy during creation."
}
"""
CreateLifecyclePolicy(Description, ExecutionRoleArn, PolicyDetails, State) = dlm("POST", "/policies")
CreateLifecyclePolicy(Description, ExecutionRoleArn, PolicyDetails, State, args) = dlm("POST", "/policies", args)
CreateLifecyclePolicy(a...; b...) = CreateLifecyclePolicy(a..., b)

"""
    DeleteLifecyclePolicy()

Deletes the specified lifecycle policy and halts the automated operations that the policy specified.

Required Parameters
{
  "PolicyId": "The identifier of the lifecycle policy."
}
"""
DeleteLifecyclePolicy(PolicyId) = dlm("DELETE", "/policies/$(policyId)/")
DeleteLifecyclePolicy(PolicyId, args) = dlm("DELETE", "/policies/$(policyId)/", args)
DeleteLifecyclePolicy(a...; b...) = DeleteLifecyclePolicy(a..., b)

"""
    GetLifecyclePolicies()

Gets summary information about all or the specified data lifecycle policies. To get complete information about a policy, use GetLifecyclePolicy.

Optional Parameters
{
  "PolicyIds": "The identifiers of the data lifecycle policies.",
  "ResourceTypes": "The resource type.",
  "State": "The activation state.",
  "TagsToAdd": "The tags to add to objects created by the policy. Tags are strings in the format key=value. These user-defined tags are added in addition to the AWS-added lifecycle tags.",
  "TargetTags": "The target tag for a policy. Tags are strings in the format key=value."
}
"""
GetLifecyclePolicies() = dlm("GET", "/policies")
GetLifecyclePolicies(args) = dlm("GET", "/policies", args)
GetLifecyclePolicies(a...; b...) = GetLifecyclePolicies(a..., b)

"""
    GetLifecyclePolicy()

Gets detailed information about the specified lifecycle policy.

Required Parameters
{
  "PolicyId": "The identifier of the lifecycle policy."
}
"""
GetLifecyclePolicy(PolicyId) = dlm("GET", "/policies/$(policyId)/")
GetLifecyclePolicy(PolicyId, args) = dlm("GET", "/policies/$(policyId)/", args)
GetLifecyclePolicy(a...; b...) = GetLifecyclePolicy(a..., b)

"""
    ListTagsForResource()

Lists the tags for the specified resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource."
}
"""
ListTagsForResource(ResourceArn) = dlm("GET", "/tags/$(resourceArn)")
ListTagsForResource(ResourceArn, args) = dlm("GET", "/tags/$(resourceArn)", args)
ListTagsForResource(a...; b...) = ListTagsForResource(a..., b)

"""
    TagResource()

Adds the specified tags to the specified resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource.",
  "Tags": "One or more tags."
}
"""
TagResource(ResourceArn, Tags) = dlm("POST", "/tags/$(resourceArn)")
TagResource(ResourceArn, Tags, args) = dlm("POST", "/tags/$(resourceArn)", args)
TagResource(a...; b...) = TagResource(a..., b)

"""
    UntagResource()

Removes the specified tags from the specified resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource.",
  "TagKeys": "The tag keys."
}
"""
UntagResource(ResourceArn, TagKeys) = dlm("DELETE", "/tags/$(resourceArn)")
UntagResource(ResourceArn, TagKeys, args) = dlm("DELETE", "/tags/$(resourceArn)", args)
UntagResource(a...; b...) = UntagResource(a..., b)

"""
    UpdateLifecyclePolicy()

Updates the specified lifecycle policy.

Required Parameters
{
  "PolicyId": "The identifier of the lifecycle policy."
}

Optional Parameters
{
  "Description": "A description of the lifecycle policy.",
  "ExecutionRoleArn": "The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle policy.",
  "PolicyDetails": "The configuration of the lifecycle policy. You cannot update the policy type or the resource type.",
  "State": "The desired activation state of the lifecycle policy after creation."
}
"""
UpdateLifecyclePolicy(PolicyId) = dlm("PATCH", "/policies/$(policyId)")
UpdateLifecyclePolicy(PolicyId, args) = dlm("PATCH", "/policies/$(policyId)", args)
UpdateLifecyclePolicy(a...; b...) = UpdateLifecyclePolicy(a..., b)
