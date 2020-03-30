include("../AWSServices.jl")
using .AWSServices: transfer

"""
    ListTagsForResource()

Lists all of the tags associated with the Amazon Resource Number (ARN) you specify. The resource can be a user, server, or role.

Required Parameters
{
  "Arn": "Requests the tags associated with a particular Amazon Resource Name (ARN). An ARN is an identifier for a specific AWS resource, such as a server, user, or role."
}

Optional Parameters
{
  "MaxResults": "Specifies the number of tags to return as a response to the ListTagsForResource request.",
  "NextToken": "When you request additional results from the ListTagsForResource operation, a NextToken parameter is returned in the input. You can then pass in a subsequent command to the NextToken parameter to continue listing additional tags."
}
"""
ListTagsForResource(args) = transfer("ListTagsForResource", args)

"""
    CreateServer()

Instantiates an autoscaling virtual server based on Secure File Transfer Protocol (SFTP) in AWS. When you make updates to your server or when you work with users, use the service-generated ServerId property that is assigned to the newly created server.

Optional Parameters
{
  "HostKey": "The RSA private key as generated by the ssh-keygen -N \"\" -f my-new-server-key command.  If you aren't planning to migrate existing users from an existing SFTP server to a new AWS SFTP server, don't update the host key. Accidentally changing a server's host key can be disruptive.   For more information, see \"https://alpha-docs-aws.amazon.com/transfer/latest/userguide/configuring-servers.html#change-host-key\" in the AWS SFTP User Guide. ",
  "IdentityProviderType": "Specifies the mode of authentication for the SFTP server. The default value is SERVICE_MANAGED, which allows you to store and access SFTP user credentials within the AWS Transfer for SFTP service. Use the API_GATEWAY value to integrate with an identity provider of your choosing. The API_GATEWAY setting requires you to provide an API Gateway endpoint URL to call for authentication using the IdentityProviderDetails parameter.",
  "LoggingRole": "A value that allows the service to write your SFTP users' activity to your Amazon CloudWatch logs for monitoring and auditing purposes.",
  "Tags": "Key-value pairs that can be used to group and search for servers.",
  "IdentityProviderDetails": "This parameter is required when the IdentityProviderType is set to API_GATEWAY. Accepts an array containing all of the information required to call a customer-supplied authentication API, including the API Gateway URL. This property is not required when the IdentityProviderType is set to SERVICE_MANAGED.",
  "EndpointType": "The type of VPC endpoint that you want your SFTP server to connect to. You can choose to connect to the public internet or a virtual private cloud (VPC) endpoint. With a VPC endpoint, you can restrict access to your SFTP server and resources only within your VPC.",
  "EndpointDetails": "The virtual private cloud (VPC) endpoint settings that are configured for your SFTP server. With a VPC endpoint, you can restrict access to your SFTP server to resources only within your VPC. To control incoming internet traffic, you will need to invoke the UpdateServer API and attach an Elastic IP to your server's endpoint. "
}
"""
CreateServer() = transfer("CreateServer")
CreateServer(args) = transfer("CreateServer", args)

"""
    CreateUser()

Creates a user and associates them with an existing Secure File Transfer Protocol (SFTP) server. You can only create and associate users with SFTP servers that have the IdentityProviderType set to SERVICE_MANAGED. Using parameters for CreateUser, you can specify the user name, set the home directory, store the user's public key, and assign the user's AWS Identity and Access Management (IAM) role. You can also optionally add a scope-down policy, and assign metadata with tags that can be used to group and search for users.

Required Parameters
{
  "UserName": "A unique string that identifies a user and is associated with a server as specified by the ServerId. This user name must be a minimum of 3 and a maximum of 32 characters long. The following are valid characters: a-z, A-Z, 0-9, underscore, and hyphen. The user name can't start with a hyphen.",
  "ServerId": "A system-assigned unique identifier for an SFTP server instance. This is the specific SFTP server that you added your user to.",
  "Role": "The IAM role that controls your user's access to your Amazon S3 bucket. The policies attached to this role will determine the level of access you want to provide your users when transferring files into and out of your Amazon S3 bucket or buckets. The IAM role should also contain a trust relationship that allows the SFTP server to access your resources when servicing your SFTP user's transfer requests."
}

Optional Parameters
{
  "Tags": "Key-value pairs that can be used to group and search for users. Tags are metadata attached to users for any purpose.",
  "HomeDirectoryMappings": "Logical directory mappings that specify what S3 paths and keys should be visible to your user and how you want to make them visible. You will need to specify the \"Entry\" and \"Target\" pair, where Entry shows how the path is made visible and Target is the actual S3 path. If you only specify a target, it will be displayed as is. You will need to also make sure that your AWS IAM Role provides access to paths in Target. The following is an example.  '[ \"/bucket2/documentation\", { \"Entry\": \"your-personal-report.pdf\", \"Target\": \"/bucket3/customized-reports/ {transfer:UserName}.pdf\" } ]'  In most cases, you can use this value instead of the scope down policy to lock your user down to the designated home directory (\"chroot\"). To do this, you can set Entry to '/' and set Target to the HomeDirectory parameter value.   If the target of a logical directory entry does not exist in S3, the entry will be ignored. As a workaround, you can use the S3 api to create 0 byte objects as place holders for your directory. If using the CLI, use the s3api call instead of s3 so you can use the put-object operation. For example, you use the following: aws s3api put-object --bucket bucketname --key path/to/folder/. Make sure that the end of the key name ends in a / for it to be considered a folder.  ",
  "HomeDirectoryType": "The type of landing directory (folder) you want your users' home directory to be when they log into the SFTP server. If you set it to PATH, the user will see the absolute Amazon S3 bucket paths as is in their SFTP clients. If you set it LOGICAL, you will need to provide mappings in the HomeDirectoryMappings for how you want to make S3 paths visible to your user.",
  "Policy": "A scope-down policy for your user so you can use the same IAM role across multiple users. This policy scopes down user access to portions of their Amazon S3 bucket. Variables that you can use inside this policy include  {Transfer:UserName},  {Transfer:HomeDirectory}, and  {Transfer:HomeBucket}.  For scope-down policies, AWS Transfer for SFTP stores the policy as a JSON blob, instead of the Amazon Resource Name (ARN) of the policy. You save the policy as a JSON blob and pass it in the Policy argument. For an example of a scope-down policy, see \"https://docs.aws.amazon.com/transfer/latest/userguide/users.html#users-policies-scope-down\"&gt;Creating a Scope-Down Policy. For more information, see \"https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html\" in the AWS Security Token Service API Reference. ",
  "HomeDirectory": "The landing directory (folder) for a user when they log in to the server using their SFTP client.  An example is &lt;your-Amazon-S3-bucket-name&gt;/home/username.",
  "SshPublicKeyBody": "The public portion of the Secure Shell (SSH) key used to authenticate the user to the SFTP server."
}
"""
CreateUser(args) = transfer("CreateUser", args)

"""
    DeleteSshPublicKey()

Deletes a user's Secure Shell (SSH) public key. No response is returned from this operation.

Required Parameters
{
  "UserName": "A unique string that identifies a user whose public key is being deleted.",
  "SshPublicKeyId": "A unique identifier used to reference your user's specific SSH key.",
  "ServerId": "A system-assigned unique identifier for a Secure File Transfer Protocol (SFTP) server instance that has the user assigned to it."
}
"""
DeleteSshPublicKey(args) = transfer("DeleteSshPublicKey", args)

"""
    UpdateServer()

Updates the server properties after that server has been created. The UpdateServer call returns the ServerId of the Secure File Transfer Protocol (SFTP) server you updated.

Required Parameters
{
  "ServerId": "A system-assigned unique identifier for an SFTP server instance that the user account is assigned to."
}

Optional Parameters
{
  "HostKey": "The RSA private key as generated by ssh-keygen -N \"\" -f my-new-server-key.  If you aren't planning to migrate existing users from an existing SFTP server to a new AWS SFTP server, don't update the host key. Accidentally changing a server's host key can be disruptive.   For more information, see \"https://docs.aws.amazon.com/transfer/latest/userguide/configuring-servers.html#change-host-key\" in the AWS SFTP User Guide. ",
  "LoggingRole": "A value that changes the AWS Identity and Access Management (IAM) role that allows Amazon S3 events to be logged in Amazon CloudWatch, turning logging on or off.",
  "IdentityProviderDetails": "This response parameter is an array containing all of the information required to call a customer's authentication API method.",
  "EndpointType": "The type of endpoint that you want your SFTP server to connect to. You can choose to connect to the public internet or a virtual private cloud (VPC) endpoint. With a VPC endpoint, your SFTP server isn't accessible over the public internet. ",
  "EndpointDetails": "The virtual private cloud (VPC) endpoint settings that are configured for your SFTP server. With a VPC endpoint, you can restrict access to your SFTP server to resources only within your VPC. To control incoming internet traffic, you will need to associate one or more Elastic IP addresses with your server's endpoint. "
}
"""
UpdateServer(args) = transfer("UpdateServer", args)

"""
    UpdateUser()

Assigns new properties to a user. Parameters you pass modify any or all of the following: the home directory, role, and policy for the UserName and ServerId you specify. The response returns the ServerId and the UserName for the updated user.

Required Parameters
{
  "UserName": "A unique string that identifies a user and is associated with a server as specified by the ServerId. This is the string that will be used by your user when they log in to your SFTP server. This user name is a minimum of 3 and a maximum of 32 characters long. The following are valid characters: a-z, A-Z, 0-9, underscore, and hyphen. The user name can't start with a hyphen.",
  "ServerId": "A system-assigned unique identifier for an SFTP server instance that the user account is assigned to."
}

Optional Parameters
{
  "HomeDirectoryMappings": "Logical directory mappings that specify what S3 paths and keys should be visible to your user and how you want to make them visible. You will need to specify the \"Entry\" and \"Target\" pair, where Entry shows how the path is made visible and Target is the actual S3 path. If you only specify a target, it will be displayed as is. You will need to also make sure that your AWS IAM Role provides access to paths in Target. The following is an example.  '[ \"/bucket2/documentation\", { \"Entry\": \"your-personal-report.pdf\", \"Target\": \"/bucket3/customized-reports/ {transfer:UserName}.pdf\" } ]'  In most cases, you can use this value instead of the scope down policy to lock your user down to the designated home directory (\"chroot\"). To do this, you can set Entry to '/' and set Target to the HomeDirectory parameter value.   If the target of a logical directory entry does not exist in S3, the entry will be ignored. As a workaround, you can use the S3 api to create 0 byte objects as place holders for your directory. If using the CLI, use the s3api call instead of s3 so you can use the put-object operation. For example, you use the following: aws s3api put-object --bucket bucketname --key path/to/folder/. Make sure that the end of the key name ends in a / for it to be considered a folder.  ",
  "HomeDirectoryType": "The type of landing directory (folder) you want your users' home directory to be when they log into the SFTP serve. If you set it to PATH, the user will see the absolute Amazon S3 bucket paths as is in their SFTP clients. If you set it LOGICAL, you will need to provide mappings in the HomeDirectoryMappings for how you want to make S3 paths visible to your user.",
  "Policy": "Allows you to supply a scope-down policy for your user so you can use the same AWS Identity and Access Management (IAM) role across multiple users. The policy scopes down user access to portions of your Amazon S3 bucket. Variables you can use inside this policy include  {Transfer:UserName},  {Transfer:HomeDirectory}, and  {Transfer:HomeBucket}.  For scope-down policies, AWS Transfer for SFTP stores the policy as a JSON blob, instead of the Amazon Resource Name (ARN) of the policy. You save the policy as a JSON blob and pass it in the Policy argument. For an example of a scope-down policy, see \"https://docs.aws.amazon.com/transfer/latest/userguide/users.html#users-policies-scope-down\"&gt;Creating a Scope-Down Policy. For more information, see \"https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html\" in the AWS Security Token Service API Reference. ",
  "HomeDirectory": "A parameter that specifies the landing directory (folder) for a user when they log in to the server using their client.  An example is &lt;your-Amazon-S3-bucket-name&gt;/home/username.",
  "Role": "The IAM role that controls your user's access to your Amazon S3 bucket. The policies attached to this role will determine the level of access you want to provide your users when transferring files into and out of your Amazon S3 bucket or buckets. The IAM role should also contain a trust relationship that allows the Secure File Transfer Protocol (SFTP) server to access your resources when servicing your SFTP user's transfer requests."
}
"""
UpdateUser(args) = transfer("UpdateUser", args)

"""
    TestIdentityProvider()

If the IdentityProviderType of the server is API_Gateway, tests whether your API Gateway is set up successfully. We highly recommend that you call this operation to test your authentication method as soon as you create your server. By doing so, you can troubleshoot issues with the API Gateway integration to ensure that your users can successfully use the service.

Required Parameters
{
  "UserName": "This request parameter is the name of the user account to be tested.",
  "ServerId": "A system-assigned identifier for a specific server. That server's user authentication method is tested with a user name and password."
}

Optional Parameters
{
  "UserPassword": "The password of the user account to be tested."
}
"""
TestIdentityProvider(args) = transfer("TestIdentityProvider", args)

"""
    DeleteUser()

Deletes the user belonging to the server you specify. No response returns from this operation.  When you delete a user from a server, the user's information is lost. 

Required Parameters
{
  "UserName": "A unique string that identifies a user that is being deleted from the server.",
  "ServerId": "A system-assigned unique identifier for an SFTP server instance that has the user assigned to it."
}
"""
DeleteUser(args) = transfer("DeleteUser", args)

"""
    TagResource()

Attaches a key-value pair to a resource, as identified by its Amazon Resource Name (ARN). Resources are users, servers, roles, and other entities. There is no response returned from this call.

Required Parameters
{
  "Arn": "An Amazon Resource Name (ARN) for a specific AWS resource, such as a server, user, or role.",
  "Tags": "Key-value pairs assigned to ARNs that you can use to group and search for resources by type. You can attach this metadata to user accounts for any purpose."
}
"""
TagResource(args) = transfer("TagResource", args)

"""
    ImportSshPublicKey()

Adds a Secure Shell (SSH) public key to a user account identified by a UserName value assigned to a specific server, identified by ServerId. The response returns the UserName value, the ServerId value, and the name of the SshPublicKeyId.

Required Parameters
{
  "UserName": "The name of the user account that is assigned to one or more servers.",
  "ServerId": "A system-assigned unique identifier for an SFTP server.",
  "SshPublicKeyBody": "The public key portion of an SSH key pair."
}
"""
ImportSshPublicKey(args) = transfer("ImportSshPublicKey", args)

"""
    UntagResource()

Detaches a key-value pair from a resource, as identified by its Amazon Resource Name (ARN). Resources are users, servers, roles, and other entities. No response is returned from this call.

Required Parameters
{
  "Arn": "This is the value of the resource that will have the tag removed. An Amazon Resource Name (ARN) is an identifier for a specific AWS resource, such as a server, user, or role.",
  "TagKeys": "TagKeys are key-value pairs assigned to ARNs that can be used to group and search for resources by type. This metadata can be attached to resources for any purpose."
}
"""
UntagResource(args) = transfer("UntagResource", args)

"""
    DescribeServer()

Describes the server that you specify by passing the ServerId parameter. The response contains a description of the server's properties. When you set EndpointType to VPC, the response will contain the EndpointDetails.

Required Parameters
{
  "ServerId": "A system-assigned unique identifier for an SFTP server."
}
"""
DescribeServer(args) = transfer("DescribeServer", args)

"""
    ListServers()

Lists the Secure File Transfer Protocol (SFTP) servers that are associated with your AWS account.

Optional Parameters
{
  "MaxResults": "Specifies the number of servers to return as a response to the ListServers query.",
  "NextToken": "When additional results are obtained from the ListServers command, a NextToken parameter is returned in the output. You can then pass the NextToken parameter in a subsequent command to continue listing additional servers."
}
"""
ListServers() = transfer("ListServers")
ListServers(args) = transfer("ListServers", args)

"""
    ListUsers()

Lists the users for the server that you specify by passing the ServerId parameter.

Required Parameters
{
  "ServerId": "A system-assigned unique identifier for a Secure File Transfer Protocol (SFTP) server that has users assigned to it."
}

Optional Parameters
{
  "MaxResults": "Specifies the number of users to return as a response to the ListUsers request.",
  "NextToken": "When you can get additional results from the ListUsers call, a NextToken parameter is returned in the output. You can then pass in a subsequent command to the NextToken parameter to continue listing additional users."
}
"""
ListUsers(args) = transfer("ListUsers", args)

"""
    DeleteServer()

Deletes the Secure File Transfer Protocol (SFTP) server that you specify. No response returns from this operation.

Required Parameters
{
  "ServerId": "A unique system-assigned identifier for an SFTP server instance."
}
"""
DeleteServer(args) = transfer("DeleteServer", args)

"""
    StartServer()

Changes the state of a Secure File Transfer Protocol (SFTP) server from OFFLINE to ONLINE. It has no impact on an SFTP server that is already ONLINE. An ONLINE server can accept and process file transfer jobs. The state of STARTING indicates that the server is in an intermediate state, either not fully able to respond, or not fully online. The values of START_FAILED can indicate an error condition.  No response is returned from this call.

Required Parameters
{
  "ServerId": "A system-assigned unique identifier for an SFTP server that you start."
}
"""
StartServer(args) = transfer("StartServer", args)

"""
    StopServer()

Changes the state of an SFTP server from ONLINE to OFFLINE. An OFFLINE server cannot accept and process file transfer jobs. Information tied to your server such as server and user properties are not affected by stopping your server. Stopping a server will not reduce or impact your Secure File Transfer Protocol (SFTP) endpoint billing. The state of STOPPING indicates that the server is in an intermediate state, either not fully able to respond, or not fully offline. The values of STOP_FAILED can indicate an error condition. No response is returned from this call.

Required Parameters
{
  "ServerId": "A system-assigned unique identifier for an SFTP server that you stopped."
}
"""
StopServer(args) = transfer("StopServer", args)

"""
    DescribeUser()

Describes the user assigned to a specific server, as identified by its ServerId property. The response from this call returns the properties of the user associated with the ServerId value that was specified.

Required Parameters
{
  "UserName": "The name of the user assigned to one or more servers. User names are part of the sign-in credentials to use the AWS Transfer for SFTP service and perform file transfer tasks.",
  "ServerId": "A system-assigned unique identifier for an SFTP server that has this user assigned."
}
"""
DescribeUser(args) = transfer("DescribeUser", args)
