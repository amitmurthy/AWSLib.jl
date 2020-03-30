include("../AWSServices.jl")
using .AWSServices: route53resolver

"""
    ListTagsForResource()

Lists the tags that you associated with the specified resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) for the resource that you want to list tags for."
}

Optional Parameters
{
  "MaxResults": "The maximum number of tags that you want to return in the response to a ListTagsForResource request. If you don't specify a value for MaxResults, Resolver returns up to 100 tags.",
  "NextToken": "For the first ListTagsForResource request, omit this value. If you have more than MaxResults tags, you can submit another ListTagsForResource request to get the next group of tags for the resource. In the next request, specify the value of NextToken from the previous response. "
}
"""
ListTagsForResource(args) = route53resolver("ListTagsForResource", args)

"""
    DisassociateResolverRule()

Removes the association between a specified resolver rule and a specified VPC.  If you disassociate a resolver rule from a VPC, Resolver stops forwarding DNS queries for the domain name that you specified in the resolver rule.  

Required Parameters
{
  "ResolverRuleId": "The ID of the resolver rule that you want to disassociate from the specified VPC.",
  "VPCId": "The ID of the VPC that you want to disassociate the resolver rule from."
}
"""
DisassociateResolverRule(args) = route53resolver("DisassociateResolverRule", args)

"""
    CreateResolverRule()

For DNS queries that originate in your VPCs, specifies which resolver endpoint the queries pass through, one domain name that you want to forward to your network, and the IP addresses of the DNS resolvers in your network.

Required Parameters
{
  "DomainName": "DNS queries for this domain name are forwarded to the IP addresses that you specify in TargetIps. If a query matches multiple resolver rules (example.com and www.example.com), outbound DNS queries are routed using the resolver rule that contains the most specific domain name (www.example.com).",
  "RuleType": "Specify FORWARD. Other resolver rule types aren't supported.",
  "CreatorRequestId": "A unique string that identifies the request and that allows failed requests to be retried without the risk of executing the operation twice. CreatorRequestId can be any unique string, for example, a date/time stamp. "
}

Optional Parameters
{
  "TargetIps": "The IPs that you want Resolver to forward DNS queries to. You can specify only IPv4 addresses. Separate IP addresses with a comma.",
  "Tags": "A list of the tag keys and values that you want to associate with the endpoint.",
  "ResolverEndpointId": "The ID of the outbound resolver endpoint that you want to use to route DNS queries to the IP addresses that you specify in TargetIps.",
  "Name": "A friendly name that lets you easily find a rule in the Resolver dashboard in the Route 53 console."
}
"""
CreateResolverRule(args) = route53resolver("CreateResolverRule", args)

"""
    UpdateResolverRule()

Updates settings for a specified resolver rule. ResolverRuleId is required, and all other parameters are optional. If you don't specify a parameter, it retains its current value.

Required Parameters
{
  "ResolverRuleId": "The ID of the resolver rule that you want to update.",
  "Config": "The new settings for the resolver rule."
}
"""
UpdateResolverRule(args) = route53resolver("UpdateResolverRule", args)

"""
    GetResolverRule()

Gets information about a specified resolver rule, such as the domain name that the rule forwards DNS queries for and the ID of the outbound resolver endpoint that the rule is associated with.

Required Parameters
{
  "ResolverRuleId": "The ID of the resolver rule that you want to get information about."
}
"""
GetResolverRule(args) = route53resolver("GetResolverRule", args)

"""
    ListResolverEndpoints()

Lists all the resolver endpoints that were created using the current AWS account.

Optional Parameters
{
  "MaxResults": "The maximum number of resolver endpoints that you want to return in the response to a ListResolverEndpoints request. If you don't specify a value for MaxResults, Resolver returns up to 100 resolver endpoints. ",
  "NextToken": "For the first ListResolverEndpoints request, omit this value. If you have more than MaxResults resolver endpoints, you can submit another ListResolverEndpoints request to get the next group of resolver endpoints. In the next request, specify the value of NextToken from the previous response. ",
  "Filters": "An optional specification to return a subset of resolver endpoints, such as all inbound resolver endpoints.  If you submit a second or subsequent ListResolverEndpoints request and specify the NextToken parameter, you must use the same values for Filters, if any, as in the previous request. "
}
"""
ListResolverEndpoints() = route53resolver("ListResolverEndpoints")
ListResolverEndpoints(args) = route53resolver("ListResolverEndpoints", args)

"""
    DisassociateResolverEndpointIpAddress()

Removes IP addresses from an inbound or an outbound resolver endpoint. If you want to remove more than one IP address, submit one DisassociateResolverEndpointIpAddress request for each IP address. To add an IP address to an endpoint, see AssociateResolverEndpointIpAddress.

Required Parameters
{
  "IpAddress": "The IPv4 address that you want to remove from a resolver endpoint.",
  "ResolverEndpointId": "The ID of the resolver endpoint that you want to disassociate an IP address from."
}
"""
DisassociateResolverEndpointIpAddress(args) = route53resolver("DisassociateResolverEndpointIpAddress", args)

"""
    TagResource()

Adds one or more tags to a specified resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) for the resource that you want to add tags to. To get the ARN for a resource, use the applicable Get or List command:     GetResolverEndpoint     GetResolverRule     GetResolverRuleAssociation     ListResolverEndpoints     ListResolverRuleAssociations     ListResolverRules   ",
  "Tags": "The tags that you want to add to the specified resource."
}
"""
TagResource(args) = route53resolver("TagResource", args)

"""
    UntagResource()

Removes one or more tags from a specified resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) for the resource that you want to remove tags from. To get the ARN for a resource, use the applicable Get or List command:     GetResolverEndpoint     GetResolverRule     GetResolverRuleAssociation     ListResolverEndpoints     ListResolverRuleAssociations     ListResolverRules   ",
  "TagKeys": "The tags that you want to remove to the specified resource."
}
"""
UntagResource(args) = route53resolver("UntagResource", args)

"""
    GetResolverEndpoint()

Gets information about a specified resolver endpoint, such as whether it's an inbound or an outbound resolver endpoint, and the current status of the endpoint.

Required Parameters
{
  "ResolverEndpointId": "The ID of the resolver endpoint that you want to get information about."
}
"""
GetResolverEndpoint(args) = route53resolver("GetResolverEndpoint", args)

"""
    AssociateResolverEndpointIpAddress()

Adds IP addresses to an inbound or an outbound resolver endpoint. If you want to adding more than one IP address, submit one AssociateResolverEndpointIpAddress request for each IP address. To remove an IP address from an endpoint, see DisassociateResolverEndpointIpAddress.

Required Parameters
{
  "IpAddress": "Either the IPv4 address that you want to add to a resolver endpoint or a subnet ID. If you specify a subnet ID, Resolver chooses an IP address for you from the available IPs in the specified subnet.",
  "ResolverEndpointId": "The ID of the resolver endpoint that you want to associate IP addresses with."
}
"""
AssociateResolverEndpointIpAddress(args) = route53resolver("AssociateResolverEndpointIpAddress", args)

"""
    UpdateResolverEndpoint()

Updates the name of an inbound or an outbound resolver endpoint. 

Required Parameters
{
  "ResolverEndpointId": "The ID of the resolver endpoint that you want to update."
}

Optional Parameters
{
  "Name": "The name of the resolver endpoint that you want to update."
}
"""
UpdateResolverEndpoint(args) = route53resolver("UpdateResolverEndpoint", args)

"""
    CreateResolverEndpoint()

Creates a resolver endpoint. There are two types of resolver endpoints, inbound and outbound:   An inbound resolver endpoint forwards DNS queries to the DNS service for a VPC from your network or another VPC.   An outbound resolver endpoint forwards DNS queries from the DNS service for a VPC to your network or another VPC.  

Required Parameters
{
  "SecurityGroupIds": "The ID of one or more security groups that you want to use to control access to this VPC. The security group that you specify must include one or more inbound rules (for inbound resolver endpoints) or outbound rules (for outbound resolver endpoints).",
  "IpAddresses": "The subnets and IP addresses in your VPC that you want DNS queries to pass through on the way from your VPCs to your network (for outbound endpoints) or on the way from your network to your VPCs (for inbound resolver endpoints). ",
  "Direction": "Specify the applicable value:    INBOUND: Resolver forwards DNS queries to the DNS service for a VPC from your network or another VPC    OUTBOUND: Resolver forwards DNS queries from the DNS service for a VPC to your network or another VPC  ",
  "CreatorRequestId": "A unique string that identifies the request and that allows failed requests to be retried without the risk of executing the operation twice. CreatorRequestId can be any unique string, for example, a date/time stamp. "
}

Optional Parameters
{
  "Tags": "A list of the tag keys and values that you want to associate with the endpoint.",
  "Name": "A friendly name that lets you easily find a configuration in the Resolver dashboard in the Route 53 console."
}
"""
CreateResolverEndpoint(args) = route53resolver("CreateResolverEndpoint", args)

"""
    ListResolverRuleAssociations()

Lists the associations that were created between resolver rules and VPCs using the current AWS account.

Optional Parameters
{
  "MaxResults": "The maximum number of rule associations that you want to return in the response to a ListResolverRuleAssociations request. If you don't specify a value for MaxResults, Resolver returns up to 100 rule associations. ",
  "NextToken": "For the first ListResolverRuleAssociation request, omit this value. If you have more than MaxResults rule associations, you can submit another ListResolverRuleAssociation request to get the next group of rule associations. In the next request, specify the value of NextToken from the previous response. ",
  "Filters": "An optional specification to return a subset of resolver rules, such as resolver rules that are associated with the same VPC ID.  If you submit a second or subsequent ListResolverRuleAssociations request and specify the NextToken parameter, you must use the same values for Filters, if any, as in the previous request. "
}
"""
ListResolverRuleAssociations() = route53resolver("ListResolverRuleAssociations")
ListResolverRuleAssociations(args) = route53resolver("ListResolverRuleAssociations", args)

"""
    GetResolverRuleAssociation()

Gets information about an association between a specified resolver rule and a VPC. You associate a resolver rule and a VPC using AssociateResolverRule. 

Required Parameters
{
  "ResolverRuleAssociationId": "The ID of the resolver rule association that you want to get information about."
}
"""
GetResolverRuleAssociation(args) = route53resolver("GetResolverRuleAssociation", args)

"""
    DeleteResolverRule()

Deletes a resolver rule. Before you can delete a resolver rule, you must disassociate it from all the VPCs that you associated the resolver rule with. For more infomation, see DisassociateResolverRule.

Required Parameters
{
  "ResolverRuleId": "The ID of the resolver rule that you want to delete."
}
"""
DeleteResolverRule(args) = route53resolver("DeleteResolverRule", args)

"""
    ListResolverEndpointIpAddresses()

Gets the IP addresses for a specified resolver endpoint.

Required Parameters
{
  "ResolverEndpointId": "The ID of the resolver endpoint that you want to get IP addresses for."
}

Optional Parameters
{
  "MaxResults": "The maximum number of IP addresses that you want to return in the response to a ListResolverEndpointIpAddresses request. If you don't specify a value for MaxResults, Resolver returns up to 100 IP addresses. ",
  "NextToken": "For the first ListResolverEndpointIpAddresses request, omit this value. If the specified resolver endpoint has more than MaxResults IP addresses, you can submit another ListResolverEndpointIpAddresses request to get the next group of IP addresses. In the next request, specify the value of NextToken from the previous response. "
}
"""
ListResolverEndpointIpAddresses(args) = route53resolver("ListResolverEndpointIpAddresses", args)

"""
    ListResolverRules()

Lists the resolver rules that were created using the current AWS account.

Optional Parameters
{
  "MaxResults": "The maximum number of resolver rules that you want to return in the response to a ListResolverRules request. If you don't specify a value for MaxResults, Resolver returns up to 100 resolver rules.",
  "NextToken": "For the first ListResolverRules request, omit this value. If you have more than MaxResults resolver rules, you can submit another ListResolverRules request to get the next group of resolver rules. In the next request, specify the value of NextToken from the previous response. ",
  "Filters": "An optional specification to return a subset of resolver rules, such as all resolver rules that are associated with the same resolver endpoint.  If you submit a second or subsequent ListResolverRules request and specify the NextToken parameter, you must use the same values for Filters, if any, as in the previous request. "
}
"""
ListResolverRules() = route53resolver("ListResolverRules")
ListResolverRules(args) = route53resolver("ListResolverRules", args)

"""
    AssociateResolverRule()

Associates a resolver rule with a VPC. When you associate a rule with a VPC, Resolver forwards all DNS queries for the domain name that is specified in the rule and that originate in the VPC. The queries are forwarded to the IP addresses for the DNS resolvers that are specified in the rule. For more information about rules, see CreateResolverRule. 

Required Parameters
{
  "ResolverRuleId": "The ID of the resolver rule that you want to associate with the VPC. To list the existing resolver rules, use ListResolverRules.",
  "VPCId": "The ID of the VPC that you want to associate the resolver rule with."
}

Optional Parameters
{
  "Name": "A name for the association that you're creating between a resolver rule and a VPC."
}
"""
AssociateResolverRule(args) = route53resolver("AssociateResolverRule", args)

"""
    GetResolverRulePolicy()

Gets information about a resolver rule policy. A resolver rule policy specifies the Resolver operations and resources that you want to allow another AWS account to be able to use. 

Required Parameters
{
  "Arn": "The ID of the resolver rule policy that you want to get information about."
}
"""
GetResolverRulePolicy(args) = route53resolver("GetResolverRulePolicy", args)

"""
    PutResolverRulePolicy()

Specifies the Resolver operations and resources that you want to allow another AWS account to be able to use.

Required Parameters
{
  "Arn": "The Amazon Resource Name (ARN) of the account that you want to grant permissions to.",
  "ResolverRulePolicy": "An AWS Identity and Access Management policy statement that lists the permissions that you want to grant to another AWS account."
}
"""
PutResolverRulePolicy(args) = route53resolver("PutResolverRulePolicy", args)

"""
    DeleteResolverEndpoint()

Deletes a resolver endpoint. The effect of deleting a resolver endpoint depends on whether it's an inbound or an outbound resolver endpoint:    Inbound: DNS queries from your network or another VPC are no longer routed to the DNS service for the specified VPC.    Outbound: DNS queries from a VPC are no longer routed to your network or to another VPC.  

Required Parameters
{
  "ResolverEndpointId": "The ID of the resolver endpoint that you want to delete."
}
"""
DeleteResolverEndpoint(args) = route53resolver("DeleteResolverEndpoint", args)
