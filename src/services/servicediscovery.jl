include("../AWSServices.jl")
using .AWSServices: servicediscovery

"""
    UpdateService()

Submits a request to perform the following operations:   Add or delete DnsRecords configurations   Update the TTL setting for existing DnsRecords configurations   Add, update, or delete HealthCheckConfig for a specified service   For public and private DNS namespaces, you must specify all DnsRecords configurations (and, optionally, HealthCheckConfig) that you want to appear in the updated service. Any current configurations that don't appear in an UpdateService request are deleted. When you update the TTL setting for a service, AWS Cloud Map also updates the corresponding settings in all the records and health checks that were created by using the specified service.

Required Parameters
{
  "Id": "The ID of the service that you want to update.",
  "Service": "A complex type that contains the new settings for the service."
}
"""
UpdateService(args) = servicediscovery("UpdateService", args)

"""
    GetService()

Gets the settings for a specified service.

Required Parameters
{
  "Id": "The ID of the service that you want to get settings for."
}
"""
GetService(args) = servicediscovery("GetService", args)

"""
    DeleteService()

Deletes a specified service. If the service still contains one or more registered instances, the request fails.

Required Parameters
{
  "Id": "The ID of the service that you want to delete."
}
"""
DeleteService(args) = servicediscovery("DeleteService", args)

"""
    CreatePublicDnsNamespace()

Creates a public namespace based on DNS, which will be visible on the internet. The namespace defines your service naming scheme. For example, if you name your namespace example.com and name your service backend, the resulting DNS name for the service will be backend.example.com. For the current limit on the number of namespaces that you can create using the same AWS account, see AWS Cloud Map Limits in the AWS Cloud Map Developer Guide.

Required Parameters
{
  "Name": "The name that you want to assign to this namespace."
}

Optional Parameters
{
  "Description": "A description for the namespace.",
  "CreatorRequestId": "A unique string that identifies the request and that allows failed CreatePublicDnsNamespace requests to be retried without the risk of executing the operation twice. CreatorRequestId can be any unique string, for example, a date/time stamp."
}
"""
CreatePublicDnsNamespace(args) = servicediscovery("CreatePublicDnsNamespace", args)

"""
    CreatePrivateDnsNamespace()

Creates a private namespace based on DNS, which will be visible only inside a specified Amazon VPC. The namespace defines your service naming scheme. For example, if you name your namespace example.com and name your service backend, the resulting DNS name for the service will be backend.example.com. For the current limit on the number of namespaces that you can create using the same AWS account, see AWS Cloud Map Limits in the AWS Cloud Map Developer Guide.

Required Parameters
{
  "Vpc": "The ID of the Amazon VPC that you want to associate the namespace with.",
  "Name": "The name that you want to assign to this namespace. When you create a private DNS namespace, AWS Cloud Map automatically creates an Amazon Route 53 private hosted zone that has the same name as the namespace."
}

Optional Parameters
{
  "Description": "A description for the namespace.",
  "CreatorRequestId": "A unique string that identifies the request and that allows failed CreatePrivateDnsNamespace requests to be retried without the risk of executing the operation twice. CreatorRequestId can be any unique string, for example, a date/time stamp."
}
"""
CreatePrivateDnsNamespace(args) = servicediscovery("CreatePrivateDnsNamespace", args)

"""
    ListNamespaces()

Lists summary information about the namespaces that were created by the current AWS account.

Optional Parameters
{
  "MaxResults": "The maximum number of namespaces that you want AWS Cloud Map to return in the response to a ListNamespaces request. If you don't specify a value for MaxResults, AWS Cloud Map returns up to 100 namespaces.",
  "NextToken": "For the first ListNamespaces request, omit this value. If the response contains NextToken, submit another ListNamespaces request to get the next group of results. Specify the value of NextToken from the previous response in the next request.  AWS Cloud Map gets MaxResults namespaces and then filters them based on the specified criteria. It's possible that no namespaces in the first MaxResults namespaces matched the specified criteria but that subsequent groups of MaxResults namespaces do contain namespaces that match the criteria. ",
  "Filters": "A complex type that contains specifications for the namespaces that you want to list. If you specify more than one filter, a namespace must match all filters to be returned by ListNamespaces."
}
"""
ListNamespaces() = servicediscovery("ListNamespaces")
ListNamespaces(args) = servicediscovery("ListNamespaces", args)

"""
    ListServices()

Lists summary information for all the services that are associated with one or more specified namespaces.

Optional Parameters
{
  "MaxResults": "The maximum number of services that you want AWS Cloud Map to return in the response to a ListServices request. If you don't specify a value for MaxResults, AWS Cloud Map returns up to 100 services.",
  "NextToken": "For the first ListServices request, omit this value. If the response contains NextToken, submit another ListServices request to get the next group of results. Specify the value of NextToken from the previous response in the next request.  AWS Cloud Map gets MaxResults services and then filters them based on the specified criteria. It's possible that no services in the first MaxResults services matched the specified criteria but that subsequent groups of MaxResults services do contain services that match the criteria. ",
  "Filters": "A complex type that contains specifications for the namespaces that you want to list services for.  If you specify more than one filter, an operation must match all filters to be returned by ListServices."
}
"""
ListServices() = servicediscovery("ListServices")
ListServices(args) = servicediscovery("ListServices", args)

"""
    RegisterInstance()

Creates or updates one or more records and, optionally, creates a health check based on the settings in a specified service. When you submit a RegisterInstance request, the following occurs:   For each DNS record that you define in the service that is specified by ServiceId, a record is created or updated in the hosted zone that is associated with the corresponding namespace.   If the service includes HealthCheckConfig, a health check is created based on the settings in the health check configuration.   The health check, if any, is associated with each of the new or updated records.    One RegisterInstance request must complete before you can submit another request and specify the same service ID and instance ID.  For more information, see CreateService. When AWS Cloud Map receives a DNS query for the specified DNS name, it returns the applicable value:    If the health check is healthy: returns all the records    If the health check is unhealthy: returns the applicable value for the last healthy instance    If you didn't specify a health check configuration: returns all the records   For the current limit on the number of instances that you can register using the same namespace and using the same service, see AWS Cloud Map Limits in the AWS Cloud Map Developer Guide.

Required Parameters
{
  "InstanceId": "An identifier that you want to associate with the instance. Note the following:   If the service that is specified by ServiceId includes settings for an SRV record, the value of InstanceId is automatically included as part of the value for the SRV record. For more information, see DnsRecord Type.   You can use this value to update an existing instance.   To register a new instance, you must specify a value that is unique among instances that you register by using the same service.    If you specify an existing InstanceId and ServiceId, AWS Cloud Map updates the existing DNS records, if any. If there's also an existing health check, AWS Cloud Map deletes the old health check and creates a new one.   The health check isn't deleted immediately, so it will still appear for a while if you submit a ListHealthChecks request, for example.   ",
  "ServiceId": "The ID of the service that you want to use for settings for the instance.",
  "Attributes": "A string map that contains the following information for the service that you specify in ServiceId:   The attributes that apply to the records that are defined in the service.    For each attribute, the applicable value.   Supported attribute keys include the following:  AWS_ALIAS_DNS_NAME     If you want AWS Cloud Map to create an Amazon Route 53 alias record that routes traffic to an Elastic Load Balancing load balancer, specify the DNS name that is associated with the load balancer. For information about how to get the DNS name, see \"DNSName\" in the topic AliasTarget in the Route 53 API Reference. Note the following:   The configuration for the service that is specified by ServiceId must include settings for an A record, an AAAA record, or both.   In the service that is specified by ServiceId, the value of RoutingPolicy must be WEIGHTED.   If the service that is specified by ServiceId includes HealthCheckConfig settings, AWS Cloud Map will create the Route 53 health check, but it won't associate the health check with the alias record.   Auto naming currently doesn't support creating alias records that route traffic to AWS resources other than ELB load balancers.   If you specify a value for AWS_ALIAS_DNS_NAME, don't specify values for any of the AWS_INSTANCE attributes.    AWS_INIT_HEALTH_STATUS  If the service configuration includes HealthCheckCustomConfig, you can optionally use AWS_INIT_HEALTH_STATUS to specify the initial status of the custom health check, HEALTHY or UNHEALTHY. If you don't specify a value for AWS_INIT_HEALTH_STATUS, the initial status is HEALTHY.  AWS_INSTANCE_CNAME  If the service configuration includes a CNAME record, the domain name that you want Route 53 to return in response to DNS queries, for example, example.com. This value is required if the service specified by ServiceId includes settings for an CNAME record.  AWS_INSTANCE_IPV4  If the service configuration includes an A record, the IPv4 address that you want Route 53 to return in response to DNS queries, for example, 192.0.2.44. This value is required if the service specified by ServiceId includes settings for an A record. If the service includes settings for an SRV record, you must specify a value for AWS_INSTANCE_IPV4, AWS_INSTANCE_IPV6, or both.  AWS_INSTANCE_IPV6  If the service configuration includes an AAAA record, the IPv6 address that you want Route 53 to return in response to DNS queries, for example, 2001:0db8:85a3:0000:0000:abcd:0001:2345. This value is required if the service specified by ServiceId includes settings for an AAAA record. If the service includes settings for an SRV record, you must specify a value for AWS_INSTANCE_IPV4, AWS_INSTANCE_IPV6, or both.  AWS_INSTANCE_PORT  If the service includes an SRV record, the value that you want Route 53 to return for the port. If the service includes HealthCheckConfig, the port on the endpoint that you want Route 53 to send requests to.  This value is required if you specified settings for an SRV record when you created the service.  Custom attributes  You can add up to 30 custom attributes. For each key-value pair, the maximum length of the attribute name is 255 characters, and the maximum length of the attribute value is 1,024 characters. "
}

Optional Parameters
{
  "CreatorRequestId": "A unique string that identifies the request and that allows failed RegisterInstance requests to be retried without the risk of executing the operation twice. You must use a unique CreatorRequestId string every time you submit a RegisterInstance request if you're registering additional instances for the same namespace and service. CreatorRequestId can be any unique string, for example, a date/time stamp."
}
"""
RegisterInstance(args) = servicediscovery("RegisterInstance", args)

"""
    GetInstancesHealthStatus()

Gets the current health status (Healthy, Unhealthy, or Unknown) of one or more instances that are associated with a specified service.  There is a brief delay between when you register an instance and when the health status for the instance is available.  

Required Parameters
{
  "ServiceId": "The ID of the service that the instance is associated with."
}

Optional Parameters
{
  "MaxResults": "The maximum number of instances that you want AWS Cloud Map to return in the response to a GetInstancesHealthStatus request. If you don't specify a value for MaxResults, AWS Cloud Map returns up to 100 instances.",
  "Instances": "An array that contains the IDs of all the instances that you want to get the health status for. If you omit Instances, AWS Cloud Map returns the health status for all the instances that are associated with the specified service.  To get the IDs for the instances that you've registered by using a specified service, submit a ListInstances request. ",
  "NextToken": "For the first GetInstancesHealthStatus request, omit this value. If more than MaxResults instances match the specified criteria, you can submit another GetInstancesHealthStatus request to get the next group of results. Specify the value of NextToken from the previous response in the next request."
}
"""
GetInstancesHealthStatus(args) = servicediscovery("GetInstancesHealthStatus", args)

"""
    CreateService()

Creates a service, which defines the configuration for the following entities:   For public and private DNS namespaces, one of the following combinations of DNS records in Amazon Route 53:   A   AAAA   A and AAAA   SRV   CNAME     Optionally, a health check   After you create the service, you can submit a RegisterInstance request, and AWS Cloud Map uses the values in the configuration to create the specified entities. For the current limit on the number of instances that you can register using the same namespace and using the same service, see AWS Cloud Map Limits in the AWS Cloud Map Developer Guide.

Required Parameters
{
  "Name": "The name that you want to assign to the service."
}

Optional Parameters
{
  "CreatorRequestId": "A unique string that identifies the request and that allows failed CreateService requests to be retried without the risk of executing the operation twice. CreatorRequestId can be any unique string, for example, a date/time stamp.",
  "Description": "A description for the service.",
  "DnsConfig": "A complex type that contains information about the Amazon Route 53 records that you want AWS Cloud Map to create when you register an instance. ",
  "HealthCheckCustomConfig": "A complex type that contains information about an optional custom health check.  If you specify a health check configuration, you can specify either HealthCheckCustomConfig or HealthCheckConfig but not both. ",
  "NamespaceId": "The ID of the namespace that you want to use to create the service.",
  "HealthCheckConfig": " Public DNS namespaces only. A complex type that contains settings for an optional Route 53 health check. If you specify settings for a health check, AWS Cloud Map associates the health check with all the Route 53 DNS records that you specify in DnsConfig.  If you specify a health check configuration, you can specify either HealthCheckCustomConfig or HealthCheckConfig but not both.  For information about the charges for health checks, see AWS Cloud Map Pricing."
}
"""
CreateService(args) = servicediscovery("CreateService", args)

"""
    ListInstances()

Lists summary information about the instances that you registered by using a specified service.

Required Parameters
{
  "ServiceId": "The ID of the service that you want to list instances for."
}

Optional Parameters
{
  "MaxResults": "The maximum number of instances that you want AWS Cloud Map to return in the response to a ListInstances request. If you don't specify a value for MaxResults, AWS Cloud Map returns up to 100 instances.",
  "NextToken": "For the first ListInstances request, omit this value. If more than MaxResults instances match the specified criteria, you can submit another ListInstances request to get the next group of results. Specify the value of NextToken from the previous response in the next request."
}
"""
ListInstances(args) = servicediscovery("ListInstances", args)

"""
    GetInstance()

Gets information about a specified instance.

Required Parameters
{
  "InstanceId": "The ID of the instance that you want to get information about.",
  "ServiceId": "The ID of the service that the instance is associated with."
}
"""
GetInstance(args) = servicediscovery("GetInstance", args)

"""
    DeregisterInstance()

Deletes the Amazon Route 53 DNS records and health check, if any, that AWS Cloud Map created for the specified instance.

Required Parameters
{
  "InstanceId": "The value that you specified for Id in the RegisterInstance request.",
  "ServiceId": "The ID of the service that the instance is associated with."
}
"""
DeregisterInstance(args) = servicediscovery("DeregisterInstance", args)

"""
    DiscoverInstances()

Discovers registered instances for a specified namespace and service.

Required Parameters
{
  "NamespaceName": "The name of the namespace that you specified when you registered the instance.",
  "ServiceName": "The name of the service that you specified when you registered the instance."
}

Optional Parameters
{
  "MaxResults": "The maximum number of instances that you want Cloud Map to return in the response to a DiscoverInstances request. If you don't specify a value for MaxResults, Cloud Map returns up to 100 instances.",
  "HealthStatus": "The health status of the instances that you want to discover.",
  "QueryParameters": "A string map that contains attributes with values that you can use to filter instances by any custom attribute that you specified when you registered the instance. Only instances that match all the specified key/value pairs will be returned."
}
"""
DiscoverInstances(args) = servicediscovery("DiscoverInstances", args)

"""
    UpdateInstanceCustomHealthStatus()

Submits a request to change the health status of a custom health check to healthy or unhealthy. You can use UpdateInstanceCustomHealthStatus to change the status only for custom health checks, which you define using HealthCheckCustomConfig when you create a service. You can't use it to change the status for Route 53 health checks, which you define using HealthCheckConfig. For more information, see HealthCheckCustomConfig.

Required Parameters
{
  "InstanceId": "The ID of the instance that you want to change the health status for.",
  "ServiceId": "The ID of the service that includes the configuration for the custom health check that you want to change the status for.",
  "Status": "The new status of the instance, HEALTHY or UNHEALTHY."
}
"""
UpdateInstanceCustomHealthStatus(args) = servicediscovery("UpdateInstanceCustomHealthStatus", args)

"""
    DeleteNamespace()

Deletes a namespace from the current account. If the namespace still contains one or more services, the request fails.

Required Parameters
{
  "Id": "The ID of the namespace that you want to delete."
}
"""
DeleteNamespace(args) = servicediscovery("DeleteNamespace", args)

"""
    GetNamespace()

Gets information about a namespace.

Required Parameters
{
  "Id": "The ID of the namespace that you want to get information about."
}
"""
GetNamespace(args) = servicediscovery("GetNamespace", args)

"""
    CreateHttpNamespace()

Creates an HTTP namespace. Service instances that you register using an HTTP namespace can be discovered using a DiscoverInstances request but can't be discovered using DNS.  For the current limit on the number of namespaces that you can create using the same AWS account, see AWS Cloud Map Limits in the AWS Cloud Map Developer Guide.

Required Parameters
{
  "Name": "The name that you want to assign to this namespace."
}

Optional Parameters
{
  "Description": "A description for the namespace.",
  "CreatorRequestId": "A unique string that identifies the request and that allows failed CreateHttpNamespace requests to be retried without the risk of executing the operation twice. CreatorRequestId can be any unique string, for example, a date/time stamp."
}
"""
CreateHttpNamespace(args) = servicediscovery("CreateHttpNamespace", args)

"""
    GetOperation()

Gets information about any operation that returns an operation ID in the response, such as a CreateService request.  To get a list of operations that match specified criteria, see ListOperations. 

Required Parameters
{
  "OperationId": "The ID of the operation that you want to get more information about."
}
"""
GetOperation(args) = servicediscovery("GetOperation", args)

"""
    ListOperations()

Lists operations that match the criteria that you specify.

Optional Parameters
{
  "MaxResults": "The maximum number of items that you want AWS Cloud Map to return in the response to a ListOperations request. If you don't specify a value for MaxResults, AWS Cloud Map returns up to 100 operations.",
  "NextToken": "For the first ListOperations request, omit this value. If the response contains NextToken, submit another ListOperations request to get the next group of results. Specify the value of NextToken from the previous response in the next request.  AWS Cloud Map gets MaxResults operations and then filters them based on the specified criteria. It's possible that no operations in the first MaxResults operations matched the specified criteria but that subsequent groups of MaxResults operations do contain operations that match the criteria. ",
  "Filters": "A complex type that contains specifications for the operations that you want to list, for example, operations that you started between a specified start date and end date. If you specify more than one filter, an operation must match all filters to be returned by ListOperations."
}
"""
ListOperations() = servicediscovery("ListOperations")
ListOperations(args) = servicediscovery("ListOperations", args)
