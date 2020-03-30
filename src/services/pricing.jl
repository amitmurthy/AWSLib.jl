include("../AWSServices.jl")
using .AWSServices: pricing

"""
    GetProducts()

Returns a list of all products that match the filter criteria.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return in the response.",
  "NextToken": "The pagination token that indicates the next set of results that you want to retrieve.",
  "Filters": "The list of filters that limit the returned products. only products that match all filters are returned.",
  "FormatVersion": "The format version that you want the response to be in. Valid values are: aws_v1 ",
  "ServiceCode": "The code for the service whose products you want to retrieve. "
}
"""
GetProducts() = pricing("GetProducts")
GetProducts(args) = pricing("GetProducts", args)

"""
    GetAttributeValues()

Returns a list of attribute values. Attibutes are similar to the details in a Price List API offer file. For a list of available attributes, see Offer File Definitions in the AWS Billing and Cost Management User Guide.

Required Parameters
{
  "AttributeName": "The name of the attribute that you want to retrieve the values for, such as volumeType.",
  "ServiceCode": "The service code for the service whose attributes you want to retrieve. For example, if you want the retrieve an EC2 attribute, use AmazonEC2."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to return in response.",
  "NextToken": "The pagination token that indicates the next set of results that you want to retrieve."
}
"""
GetAttributeValues(args) = pricing("GetAttributeValues", args)

"""
    DescribeServices()

Returns the metadata for one service or a list of the metadata for all services. Use this without a service code to get the service codes for all services. Use it with a service code, such as AmazonEC2, to get information specific to that service, such as the attribute names available for that service. For example, some of the attribute names available for EC2 are volumeType, maxIopsVolume, operation, locationType, and instanceCapacity10xlarge.

Optional Parameters
{
  "MaxResults": "The maximum number of results that you want returned in the response.",
  "NextToken": "The pagination token that indicates the next set of results that you want to retrieve.",
  "FormatVersion": "The format version that you want the response to be in. Valid values are: aws_v1 ",
  "ServiceCode": "The code for the service whose information you want to retrieve, such as AmazonEC2. You can use the ServiceCode to filter the results in a GetProducts call. To retrieve a list of all services, leave this blank."
}
"""
DescribeServices() = pricing("DescribeServices")
DescribeServices(args) = pricing("DescribeServices", args)
