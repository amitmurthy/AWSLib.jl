include("../AWSServices.jl")
using .AWSServices: kafka

"""
    CreateCluster()


            Creates a new MSK cluster.
         

Required Parameters
{
  "ClusterName": "\n            The name of the cluster.\n         ",
  "KafkaVersion": "\n            The version of Apache Kafka.\n         ",
  "BrokerNodeGroupInfo": "\n            Information about the broker nodes in the cluster.\n         ",
  "NumberOfBrokerNodes": "\n            The number of broker nodes in the cluster.\n         "
}

Optional Parameters
{
  "EnhancedMonitoring": "\n            Specifies the level of monitoring for the MSK cluster. The possible values are DEFAULT, PER_BROKER, and PER_TOPIC_PER_BROKER.\n         ",
  "ClientAuthentication": "\n            Includes all client authentication related information.\n         ",
  "Tags": "\n            Create tags when creating the cluster.\n         ",
  "LoggingInfo": "",
  "ConfigurationInfo": "\n            Represents the configuration that you want MSK to use for the brokers in a cluster.\n         ",
  "OpenMonitoring": "\n            The settings for open monitoring.\n         ",
  "EncryptionInfo": "\n            Includes all encryption-related information.\n         "
}
"""
CreateCluster(args) = kafka("POST", "/v1/clusters", args)

"""
    ListKafkaVersions()


            Returns a list of Kafka versions.
         

Optional Parameters
{
  "MaxResults": "\n            The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.",
  "NextToken": "\n            The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response. To get the next batch, provide this token in your next request."
}
"""
ListKafkaVersions() = kafka("GET", "/v1/kafka-versions")
ListKafkaVersions(args) = kafka("GET", "/v1/kafka-versions", args)

"""
    ListTagsForResource()


            Returns a list of the tags associated with the specified resource.
         

Required Parameters
{
  "ResourceArn": "\n            The Amazon Resource Name (ARN) that uniquely identifies the resource that's associated with the tags.\n         "
}
"""
ListTagsForResource(args) = kafka("GET", "/v1/tags/{resourceArn}", args)

"""
    UpdateBrokerStorage()


            Updates the EBS storage associated with MSK brokers.
         

Required Parameters
{
  "TargetBrokerEBSVolumeInfo": "\n            Describes the target volume size and the ID of the broker to apply the update to.\n         ",
  "ClusterArn": "\n            The Amazon Resource Name (ARN) that uniquely identifies the cluster.\n         ",
  "CurrentVersion": "\n            The version of cluster to update from. A successful operation will then generate a new version.\n         "
}
"""
UpdateBrokerStorage(args) = kafka("PUT", "/v1/clusters/{clusterArn}/nodes/storage", args)

"""
    DescribeConfigurationRevision()


            Returns a description of this revision of the configuration.
         

Required Parameters
{
  "Arn": "\n            The Amazon Resource Name (ARN) that uniquely identifies an MSK configuration and all of its revisions.\n         ",
  "Revision": "\n            A string that uniquely identifies a revision of an MSK configuration.\n         "
}
"""
DescribeConfigurationRevision(args) = kafka("GET", "/v1/configurations/{arn}/revisions/{revision}", args)

"""
    ListNodes()


            Returns a list of the broker nodes in the cluster.
         

Required Parameters
{
  "ClusterArn": "\n            The Amazon Resource Name (ARN) that uniquely identifies the cluster.\n         "
}

Optional Parameters
{
  "MaxResults": "\n            The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.\n         ",
  "NextToken": "\n            The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response. \n            To get the next batch, provide this token in your next request.\n         "
}
"""
ListNodes(args) = kafka("GET", "/v1/clusters/{clusterArn}/nodes", args)

"""
    UpdateClusterConfiguration()


            Updates the cluster with the configuration that is specified in the request body.
         

Required Parameters
{
  "ConfigurationInfo": "\n            Represents the configuration that you want MSK to use for the brokers in a cluster.\n         ",
  "ClusterArn": "\n            The Amazon Resource Name (ARN) that uniquely identifies the cluster.\n         ",
  "CurrentVersion": "\n            The version of the cluster that needs to be updated.\n         "
}
"""
UpdateClusterConfiguration(args) = kafka("PUT", "/v1/clusters/{clusterArn}/configuration", args)

"""
    ListConfigurations()


            Returns a list of all the MSK configurations in this Region.
         

Optional Parameters
{
  "MaxResults": "\n            The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.\n         ",
  "NextToken": "\n            The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response. \n            To get the next batch, provide this token in your next request.\n         "
}
"""
ListConfigurations() = kafka("GET", "/v1/configurations")
ListConfigurations(args) = kafka("GET", "/v1/configurations", args)

"""
    CreateConfiguration()


            Creates a new MSK configuration.
         

Required Parameters
{
  "ServerProperties": "\n            Contents of the server.properties file. When using the API, you must ensure that the contents of the file are base64 encoded. \n               When using the AWS Management Console, the SDK, or the AWS CLI, the contents of server.properties can be in plaintext.\n         ",
  "KafkaVersions": "\n            The versions of Apache Kafka with which you can use this MSK configuration.\n         ",
  "Name": "\n            The name of the configuration.\n         "
}

Optional Parameters
{
  "Description": "\n            The description of the configuration.\n         "
}
"""
CreateConfiguration(args) = kafka("POST", "/v1/configurations", args)

"""
    ListClusterOperations()


            Returns a list of all the operations that have been performed on the specified MSK cluster.
         

Required Parameters
{
  "ClusterArn": "\n            The Amazon Resource Name (ARN) that uniquely identifies the cluster.\n         "
}

Optional Parameters
{
  "MaxResults": "\n            The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.\n         ",
  "NextToken": "\n            The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response. \n            To get the next batch, provide this token in your next request.\n         "
}
"""
ListClusterOperations(args) = kafka("GET", "/v1/clusters/{clusterArn}/operations", args)

"""
    TagResource()


            Adds tags to the specified MSK resource.
         

Required Parameters
{
  "ResourceArn": "\n            The Amazon Resource Name (ARN) that uniquely identifies the resource that's associated with the tags.\n         ",
  "Tags": "\n            The key-value pair for the resource tag.\n         "
}
"""
TagResource(args) = kafka("POST", "/v1/tags/{resourceArn}", args)

"""
    UntagResource()


            Removes the tags associated with the keys that are provided in the query.
         

Required Parameters
{
  "ResourceArn": "\n            The Amazon Resource Name (ARN) that uniquely identifies the resource that's associated with the tags.\n         ",
  "TagKeys": "\n            Tag keys must be unique for a given cluster. In addition, the following restrictions apply:\n            \n               \n                  Each tag key must be unique. If you add a tag with a key that's already in\n                  use, your new tag overwrites the existing key-value pair. \n               \n               \n                  You can't start a tag key with aws: because this prefix is reserved for use\n                  by  AWS.  AWS creates tags that begin with this prefix on your behalf, but\n                  you can't edit or delete them.\n               \n               \n                  Tag keys must be between 1 and 128 Unicode characters in length.\n               \n               \n                  Tag keys must consist of the following characters: Unicode letters, digits,\n                  white space, and the following special characters: _ . / = + -\n                     @.\n               \n            \n         "
}
"""
UntagResource(args) = kafka("DELETE", "/v1/tags/{resourceArn}", args)

"""
    UpdateMonitoring()


            Updates the monitoring settings for the cluster. You can use this operation to specify which Apache Kafka metrics you want Amazon MSK to send to Amazon CloudWatch. You can also specify settings for open monitoring with Prometheus.
         

Required Parameters
{
  "ClusterArn": "\n            The Amazon Resource Name (ARN) that uniquely identifies the cluster.\n         ",
  "CurrentVersion": "\n            The version of the MSK cluster to update. Cluster versions aren't simple numbers. You can describe an MSK cluster to find its version. When this update operation is successful, it generates a new cluster version.\n         "
}

Optional Parameters
{
  "EnhancedMonitoring": "\n            Specifies which Apache Kafka metrics Amazon MSK gathers and sends to Amazon CloudWatch for this cluster.\n         ",
  "LoggingInfo": "",
  "OpenMonitoring": "\n            The settings for open monitoring.\n         "
}
"""
UpdateMonitoring(args) = kafka("PUT", "/v1/clusters/{clusterArn}/monitoring", args)

"""
    UpdateBrokerCount()


            Updates the number of broker nodes in the cluster.
         

Required Parameters
{
  "TargetNumberOfBrokerNodes": "\n            The number of broker nodes that you want the cluster to have after this operation completes successfully.\n         ",
  "ClusterArn": "\n            The Amazon Resource Name (ARN) that uniquely identifies the cluster.\n         ",
  "CurrentVersion": "\n            The version of cluster to update from. A successful operation will then generate a new version.\n         "
}
"""
UpdateBrokerCount(args) = kafka("PUT", "/v1/clusters/{clusterArn}/nodes/count", args)

"""
    DescribeClusterOperation()


            Returns a description of the cluster operation specified by the ARN.
         

Required Parameters
{
  "ClusterOperationArn": "\n            The Amazon Resource Name (ARN) that uniquely identifies the MSK cluster operation.\n         "
}
"""
DescribeClusterOperation(args) = kafka("GET", "/v1/operations/{clusterOperationArn}", args)

"""
    DeleteCluster()


            Deletes the MSK cluster specified by the Amazon Resource Name (ARN) in the request.
         

Required Parameters
{
  "ClusterArn": "\n            The Amazon Resource Name (ARN) that uniquely identifies the cluster.\n         "
}

Optional Parameters
{
  "CurrentVersion": "\n            The current version of the MSK cluster.\n         "
}
"""
DeleteCluster(args) = kafka("DELETE", "/v1/clusters/{clusterArn}", args)

"""
    DescribeCluster()


            Returns a description of the MSK cluster whose Amazon Resource Name (ARN) is specified in the request.
         

Required Parameters
{
  "ClusterArn": "\n            The Amazon Resource Name (ARN) that uniquely identifies the cluster.\n         "
}
"""
DescribeCluster(args) = kafka("GET", "/v1/clusters/{clusterArn}", args)

"""
    GetBootstrapBrokers()


            A list of brokers that a client application can use to bootstrap.
         

Required Parameters
{
  "ClusterArn": "\n            The Amazon Resource Name (ARN) that uniquely identifies the cluster.\n         "
}
"""
GetBootstrapBrokers(args) = kafka("GET", "/v1/clusters/{clusterArn}/bootstrap-brokers", args)

"""
    DescribeConfiguration()


            Returns a description of this MSK configuration.
         

Required Parameters
{
  "Arn": "\n            The Amazon Resource Name (ARN) that uniquely identifies an MSK configuration and all of its revisions.\n         "
}
"""
DescribeConfiguration(args) = kafka("GET", "/v1/configurations/{arn}", args)

"""
    ListConfigurationRevisions()


            Returns a list of all the MSK configurations in this Region.
         

Required Parameters
{
  "Arn": "\n            The Amazon Resource Name (ARN) that uniquely identifies an MSK configuration and all of its revisions.\n         "
}

Optional Parameters
{
  "MaxResults": "\n            The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.\n         ",
  "NextToken": "\n            The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response. \n            To get the next batch, provide this token in your next request.\n         "
}
"""
ListConfigurationRevisions(args) = kafka("GET", "/v1/configurations/{arn}/revisions", args)

"""
    ListClusters()


            Returns a list of all the MSK clusters in the current Region.
         

Optional Parameters
{
  "MaxResults": "\n            The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.\n         ",
  "NextToken": "\n            The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response. \n            To get the next batch, provide this token in your next request.\n         ",
  "ClusterNameFilter": "\n            Specify a prefix of the name of the clusters that you want to list. The service lists all the clusters whose names start with this prefix.\n         "
}
"""
ListClusters() = kafka("GET", "/v1/clusters")
ListClusters(args) = kafka("GET", "/v1/clusters", args)
