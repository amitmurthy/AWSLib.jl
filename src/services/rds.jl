include("../AWSServices.jl")
using .AWSServices: rds

"""
    RestoreDBInstanceFromS3()

Amazon Relational Database Service (Amazon RDS) supports importing MySQL databases by using backup files. You can create a backup of your on-premises database, store it on Amazon Simple Storage Service (Amazon S3), and then restore the backup file onto a new Amazon RDS DB instance running MySQL. For more information, see Importing Data into an Amazon RDS MySQL DB Instance in the Amazon RDS User Guide. 

Required Parameters
{
  "DBInstanceIdentifier": "The DB instance identifier. This parameter is stored as a lowercase string.  Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   First character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.   Example: mydbinstance ",
  "SourceEngine": "The name of the engine of your source database.  Valid Values: mysql ",
  "S3BucketName": "The name of your Amazon S3 bucket that contains your database backup file. ",
  "Engine": "The name of the database engine to be used for this instance.  Valid Values: mysql ",
  "SourceEngineVersion": "The engine version of your source database.  Valid Values: 5.6 ",
  "S3IngestionRoleArn": "An AWS Identity and Access Management (IAM) role to allow Amazon RDS to access your Amazon S3 bucket. ",
  "DBInstanceClass": "The compute and memory capacity of the DB instance, for example, db.m4.large. Not all DB instance classes are available in all AWS Regions, or for all database engines. For the full list of DB instance classes, and availability for your engine, see DB Instance Class in the Amazon RDS User Guide.  Importing from Amazon S3 isn't supported on the db.t2.micro DB instance class. "
}

Optional Parameters
{
  "PubliclyAccessible": "A value that indicates whether the DB instance is publicly accessible. When the DB instance is publicly accessible, it is an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address. When the DB instance isn't publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address. For more information, see CreateDBInstance.",
  "PerformanceInsightsKMSKeyId": "The AWS KMS key identifier for encryption of Performance Insights data. The KMS key ID is the Amazon Resource Name (ARN), the KMS key identifier, or the KMS key alias for the KMS encryption key.  If you do not specify a value for PerformanceInsightsKMSKeyId, then Amazon RDS uses your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.",
  "UseDefaultProcessorFeatures": "A value that indicates whether the DB instance class of the DB instance uses its default processor features.",
  "OptionGroupName": "The name of the option group to associate with this DB instance. If this argument is omitted, the default option group for the specified engine is used. ",
  "PreferredMaintenanceWindow": "The time range each week during which system maintenance can occur, in Universal Coordinated Time (UTC). For more information, see Amazon RDS Maintenance Window in the Amazon RDS User Guide.  Constraints:   Must be in the format ddd:hh24:mi-ddd:hh24:mi.   Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.   Must be in Universal Coordinated Time (UTC).   Must not conflict with the preferred backup window.   Must be at least 30 minutes.  ",
  "AutoMinorVersionUpgrade": "A value that indicates whether minor engine upgrades are applied automatically to the DB instance during the maintenance window. By default, minor engine upgrades are not applied automatically. ",
  "BackupRetentionPeriod": "The number of days for which automated backups are retained. Setting this parameter to a positive number enables backups. For more information, see CreateDBInstance. ",
  "MonitoringInterval": "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0.  If MonitoringRoleArn is specified, then you must also set MonitoringInterval to a value other than 0.  Valid Values: 0, 1, 5, 10, 15, 30, 60  Default: 0 ",
  "AllocatedStorage": "The amount of storage (in gigabytes) to allocate initially for the DB instance. Follow the allocation rules specified in CreateDBInstance.   Be sure to allocate enough memory for your new DB instance so that the restore operation can succeed. You can also allocate additional memory for future growth.  ",
  "DBSubnetGroupName": "A DB subnet group to associate with this DB instance.",
  "StorageEncrypted": "A value that indicates whether the new DB instance is encrypted or not. ",
  "DBSecurityGroups": "A list of DB security groups to associate with this DB instance. Default: The default DB security group for the database engine.",
  "Tags": "A list of tags to associate with this DB instance. For more information, see Tagging Amazon RDS Resources in the Amazon RDS User Guide. ",
  "CopyTagsToSnapshot": "A value that indicates whether to copy all tags from the DB instance to snapshots of the DB instance. By default, tags are not copied. ",
  "EnableIAMDatabaseAuthentication": "A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For information about the supported DB engines, see CreateDBInstance. For more information about IAM database authentication, see  IAM Database Authentication for MySQL and PostgreSQL in the Amazon RDS User Guide. ",
  "DBParameterGroupName": "The name of the DB parameter group to associate with this DB instance. If you do not specify a value for DBParameterGroupName, then the default DBParameterGroup for the specified DB engine is used.",
  "MasterUsername": "The name for the master user.  Constraints:    Must be 1 to 16 letters or numbers.   First character must be a letter.   Can't be a reserved word for the chosen database engine.  ",
  "PreferredBackupWindow": "The time range each day during which automated backups are created if automated backups are enabled. For more information, see The Backup Window in the Amazon RDS User Guide.  Constraints:   Must be in the format hh24:mi-hh24:mi.   Must be in Universal Coordinated Time (UTC).   Must not conflict with the preferred maintenance window.   Must be at least 30 minutes.  ",
  "PerformanceInsightsRetentionPeriod": "The amount of time, in days, to retain Performance Insights data. Valid values are 7 or 731 (2 years). ",
  "EngineVersion": "The version number of the database engine to use. Choose the latest minor version of your database engine. For information about engine versions, see CreateDBInstance, or call DescribeDBEngineVersions. ",
  "ProcessorFeatures": "The number of CPU cores and the number of threads per core for the DB instance class of the DB instance.",
  "LicenseModel": "The license model for this DB instance. Use general-public-license. ",
  "Iops": "The amount of Provisioned IOPS (input/output operations per second) to allocate initially for the DB instance. For information about valid Iops values, see Amazon RDS Provisioned IOPS Storage to Improve Performance in the Amazon RDS User Guide. ",
  "S3Prefix": "The prefix of your Amazon S3 bucket. ",
  "MasterUserPassword": "The password for the master user. The password can include any printable ASCII character except \"/\", \"\"\", or \"@\".  Constraints: Must contain from 8 to 41 characters.",
  "Port": "The port number on which the database accepts connections.  Type: Integer  Valid Values: 1150-65535  Default: 3306 ",
  "MonitoringRoleArn": "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to Amazon CloudWatch Logs. For example, arn:aws:iam:123456789012:role/emaccess. For information on creating a monitoring role, see Setting Up and Enabling Enhanced Monitoring in the Amazon RDS User Guide.  If MonitoringInterval is set to a value other than 0, then you must supply a MonitoringRoleArn value. ",
  "EnableCloudwatchLogsExports": "The list of logs that the restored DB instance is to export to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see Publishing Database Logs to Amazon CloudWatch Logs in the Amazon RDS User Guide.",
  "AvailabilityZone": "The Availability Zone that the DB instance is created in. For information about AWS Regions and Availability Zones, see Regions and Availability Zones in the Amazon RDS User Guide.  Default: A random, system-chosen Availability Zone in the endpoint's AWS Region.   Example: us-east-1d  Constraint: The AvailabilityZone parameter can't be specified if the DB instance is a Multi-AZ deployment. The specified Availability Zone must be in the same AWS Region as the current endpoint. ",
  "DeletionProtection": "A value that indicates whether the DB instance has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. For more information, see  Deleting a DB Instance. ",
  "VpcSecurityGroupIds": "A list of VPC security groups to associate with this DB instance. ",
  "StorageType": "Specifies the storage type to be associated with the DB instance.  Valid values: standard | gp2 | io1  If you specify io1, you must also include a value for the Iops parameter.  Default: io1 if the Iops parameter is specified; otherwise gp2 ",
  "EnablePerformanceInsights": "A value that indicates whether to enable Performance Insights for the DB instance.  For more information, see Using Amazon Performance Insights in the Amazon Relational Database Service User Guide. ",
  "KmsKeyId": "The AWS KMS key identifier for an encrypted DB instance.  The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are creating a DB instance with the same AWS account that owns the KMS encryption key used to encrypt the new DB instance, then you can use the KMS key alias instead of the ARN for the KM encryption key.  If the StorageEncrypted parameter is enabled, and you do not specify a value for the KmsKeyId parameter, then Amazon RDS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region. ",
  "DBName": "The name of the database to create when the DB instance is created. Follow the naming rules specified in CreateDBInstance. ",
  "MultiAZ": "A value that indicates whether the DB instance is a Multi-AZ deployment. If the DB instance is a Multi-AZ deployment, you can't set the AvailabilityZone parameter. "
}
"""
RestoreDBInstanceFromS3(args) = rds("RestoreDBInstanceFromS3", args)

"""
    ModifyDBClusterEndpoint()

Modifies the properties of an endpoint in an Amazon Aurora DB cluster.  This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterEndpointIdentifier": "The identifier of the endpoint to modify. This parameter is stored as a lowercase string."
}

Optional Parameters
{
  "StaticMembers": "List of DB instance identifiers that are part of the custom endpoint group.",
  "EndpointType": "The type of the endpoint. One of: READER, WRITER, ANY.",
  "ExcludedMembers": "List of DB instance identifiers that aren't part of the custom endpoint group. All other eligible instances are reachable through the custom endpoint. Only relevant if the list of static members is empty."
}
"""
ModifyDBClusterEndpoint(args) = rds("ModifyDBClusterEndpoint", args)

"""
    DescribeOptionGroupOptions()

Describes all available options.

Required Parameters
{
  "EngineName": "A required parameter. Options available for the given engine name are described."
}

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": "An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "MajorEngineVersion": "If specified, filters the results to include only options for the specified major engine version.",
  "Filters": "This parameter isn't currently supported."
}
"""
DescribeOptionGroupOptions(args) = rds("DescribeOptionGroupOptions", args)

"""
    DescribeDBEngineVersions()

Returns a list of the available DB engines.

Optional Parameters
{
  "DBParameterGroupFamily": "The name of a specific DB parameter group family to return details for. Constraints:   If supplied, must match an existing DBParameterGroupFamily.  ",
  "MaxRecords": " The maximum number of records to include in the response. If more than the MaxRecords value is available, a pagination token called a marker is included in the response so you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "ListSupportedTimezones": "A value that indicates whether to list the supported time zones for each engine version. If this parameter is enabled and the requested engine supports the TimeZone parameter for CreateDBInstance, the response includes a list of supported time zones for each engine version. ",
  "EngineVersion": "The database engine version to return. Example: 5.1.49 ",
  "Engine": "The database engine to return.",
  "Filters": "This parameter isn't currently supported.",
  "IncludeAll": "A value that indicates whether to include engine versions that aren't available in the list. The default is to list only available engine versions.",
  "ListSupportedCharacterSets": "A value that indicates whether to list the supported character sets for each engine version. If this parameter is enabled and the requested engine supports the CharacterSetName parameter for CreateDBInstance, the response includes a list of supported character sets for each engine version. ",
  "DefaultOnly": "A value that indicates whether only the default version of the specified engine or engine and major version combination is returned."
}
"""
DescribeDBEngineVersions() = rds("DescribeDBEngineVersions")
DescribeDBEngineVersions(args) = rds("DescribeDBEngineVersions", args)

"""
    CreateCustomAvailabilityZone()

Creates a custom Availability Zone (AZ). A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster. For more information about RDS on VMware, see the  RDS on VMware User Guide.  

Required Parameters
{
  "CustomAvailabilityZoneName": "The name of the custom Availability Zone (AZ)."
}

Optional Parameters
{
  "ExistingVpnId": "The ID of an existing virtual private network (VPN) between the Amazon RDS website and the VMware vSphere cluster.",
  "VpnTunnelOriginatorIP": "The IP address of network traffic from your on-premises data center. A custom AZ receives the network traffic. Specify this parameter only if ExistingVpnId isn't specified.",
  "NewVpnTunnelName": "The name of a new VPN tunnel between the Amazon RDS website and the VMware vSphere cluster. Specify this parameter only if ExistingVpnId isn't specified."
}
"""
CreateCustomAvailabilityZone(args) = rds("CreateCustomAvailabilityZone", args)

"""
    DescribeDBInstances()

Returns information about provisioned RDS instances. This API supports pagination.  This operation can also return information for Amazon Neptune DB instances and Amazon DocumentDB instances. 

Optional Parameters
{
  "DBInstanceIdentifier": "The user-supplied instance identifier. If this parameter is specified, information from only the specific DB instance is returned. This parameter isn't case-sensitive. Constraints:   If supplied, must match the identifier of an existing DBInstance.  ",
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeDBInstances request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "Filters": "A filter that specifies one or more DB instances to describe. Supported filters:    db-cluster-id - Accepts DB cluster identifiers and DB cluster Amazon Resource Names (ARNs). The results list will only include information about the DB instances associated with the DB clusters identified by these ARNs.    db-instance-id - Accepts DB instance identifiers and DB instance Amazon Resource Names (ARNs). The results list will only include information about the DB instances identified by these ARNs.    dbi-resource-id - Accepts DB instance resource identifiers. The results list will only include information about the DB instances identified by these DB instance resource identifiers.    domain - Accepts Active Directory directory IDs. The results list will only include information about the DB instances associated with these domains.    engine - Accepts engine names. The results list will only include information about the DB instances for these engines.  "
}
"""
DescribeDBInstances() = rds("DescribeDBInstances")
DescribeDBInstances(args) = rds("DescribeDBInstances", args)

"""
    DescribeDBProxies()

 This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.  Returns information about DB proxies.

Optional Parameters
{
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "DBProxyName": "The name of the DB proxy.",
  "Filters": "This parameter is not currently supported."
}
"""
DescribeDBProxies() = rds("DescribeDBProxies")
DescribeDBProxies(args) = rds("DescribeDBProxies", args)

"""
    DescribeValidDBInstanceModifications()

You can call DescribeValidDBInstanceModifications to learn what modifications you can make to your DB instance. You can use this information when you call ModifyDBInstance. 

Required Parameters
{
  "DBInstanceIdentifier": "The customer identifier or the ARN of your DB instance. "
}
"""
DescribeValidDBInstanceModifications(args) = rds("DescribeValidDBInstanceModifications", args)

"""
    DeleteGlobalCluster()

 Deletes a global database cluster. The primary and secondary clusters must already be detached or destroyed first.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "GlobalClusterIdentifier": " The cluster identifier of the global database cluster being deleted. "
}
"""
DeleteGlobalCluster(args) = rds("DeleteGlobalCluster", args)

"""
    FailoverDBCluster()

Forces a failover for a DB cluster. A failover for a DB cluster promotes one of the Aurora Replicas (read-only instances) in the DB cluster to be the primary instance (the cluster writer). Amazon Aurora will automatically fail over to an Aurora Replica, if one exists, when the primary instance fails. You can force a failover when you want to simulate a failure of a primary instance for testing. Because each instance in a DB cluster has its own endpoint address, you will need to clean up and re-establish any existing connections that use those endpoint addresses when the failover is complete. For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterIdentifier": "A DB cluster identifier to force a failover for. This parameter isn't case-sensitive. Constraints:   Must match the identifier of an existing DBCluster.  "
}

Optional Parameters
{
  "TargetDBInstanceIdentifier": "The name of the instance to promote to the primary instance. You must specify the instance identifier for an Aurora Replica in the DB cluster. For example, mydbcluster-replica1."
}
"""
FailoverDBCluster(args) = rds("FailoverDBCluster", args)

"""
    StopDBCluster()

 Stops an Amazon Aurora DB cluster. When you stop a DB cluster, Aurora retains the DB cluster's metadata, including its endpoints and DB parameter groups. Aurora also retains the transaction logs so you can do a point-in-time restore if necessary.  For more information, see  Stopping and Starting an Aurora Cluster in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterIdentifier": "The DB cluster identifier of the Amazon Aurora DB cluster to be stopped. This parameter is stored as a lowercase string."
}
"""
StopDBCluster(args) = rds("StopDBCluster", args)

"""
    CreateDBSnapshot()

Creates a DBSnapshot. The source DBInstance must be in "available" state.

Required Parameters
{
  "DBInstanceIdentifier": "The identifier of the DB instance that you want to create the snapshot of. Constraints:   Must match the identifier of an existing DBInstance.  ",
  "DBSnapshotIdentifier": "The identifier for the DB snapshot. Constraints:   Can't be null, empty, or blank   Must contain from 1 to 255 letters, numbers, or hyphens   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens   Example: my-snapshot-id "
}

Optional Parameters
{
  "Tags": ""
}
"""
CreateDBSnapshot(args) = rds("CreateDBSnapshot", args)

"""
    CreateOptionGroup()

Creates a new option group. You can create up to 20 option groups.

Required Parameters
{
  "EngineName": "Specifies the name of the engine that this option group should be associated with.",
  "OptionGroupName": "Specifies the name of the option group to be created. Constraints:   Must be 1 to 255 letters, numbers, or hyphens   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens   Example: myoptiongroup ",
  "MajorEngineVersion": "Specifies the major version of the engine that this option group should be associated with.",
  "OptionGroupDescription": "The description of the option group."
}

Optional Parameters
{
  "Tags": "Tags to assign to the option group."
}
"""
CreateOptionGroup(args) = rds("CreateOptionGroup", args)

"""
    AddRoleToDBCluster()

Associates an Identity and Access Management (IAM) role from an Amazon Aurora DB cluster. For more information, see Authorizing Amazon Aurora MySQL to Access Other AWS Services on Your Behalf in the Amazon Aurora User Guide.  This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterIdentifier": "The name of the DB cluster to associate the IAM role with.",
  "RoleArn": "The Amazon Resource Name (ARN) of the IAM role to associate with the Aurora DB cluster, for example arn:aws:iam::123456789012:role/AuroraAccessRole."
}

Optional Parameters
{
  "FeatureName": "The name of the feature for the DB cluster that the IAM role is to be associated with. For the list of supported feature names, see DBEngineVersion."
}
"""
AddRoleToDBCluster(args) = rds("AddRoleToDBCluster", args)

"""
    ModifyDBSnapshotAttribute()

Adds an attribute and values to, or removes an attribute and values from, a manual DB snapshot. To share a manual DB snapshot with other AWS accounts, specify restore as the AttributeName and use the ValuesToAdd parameter to add a list of IDs of the AWS accounts that are authorized to restore the manual DB snapshot. Uses the value all to make the manual DB snapshot public, which means it can be copied or restored by all AWS accounts. Do not add the all value for any manual DB snapshots that contain private information that you don't want available to all AWS accounts. If the manual DB snapshot is encrypted, it can be shared, but only by specifying a list of authorized AWS account IDs for the ValuesToAdd parameter. You can't use all as a value for that parameter in this case. To view which AWS accounts have access to copy or restore a manual DB snapshot, or whether a manual DB snapshot public or private, use the DescribeDBSnapshotAttributes API action.

Required Parameters
{
  "AttributeName": "The name of the DB snapshot attribute to modify. To manage authorization for other AWS accounts to copy or restore a manual DB snapshot, set this value to restore.",
  "DBSnapshotIdentifier": "The identifier for the DB snapshot to modify the attributes for."
}

Optional Parameters
{
  "ValuesToAdd": "A list of DB snapshot attributes to add to the attribute specified by AttributeName. To authorize other AWS accounts to copy or restore a manual snapshot, set this list to include one or more AWS account IDs, or all to make the manual DB snapshot restorable by any AWS account. Do not add the all value for any manual DB snapshots that contain private information that you don't want available to all AWS accounts.",
  "ValuesToRemove": "A list of DB snapshot attributes to remove from the attribute specified by AttributeName. To remove authorization for other AWS accounts to copy or restore a manual snapshot, set this list to include one or more AWS account identifiers, or all to remove authorization for any AWS account to copy or restore the DB snapshot. If you specify all, an AWS account whose account ID is explicitly added to the restore attribute can still copy or restore the manual DB snapshot."
}
"""
ModifyDBSnapshotAttribute(args) = rds("ModifyDBSnapshotAttribute", args)

"""
    RestoreDBInstanceToPointInTime()

Restores a DB instance to an arbitrary point in time. You can restore to any point in time before the time identified by the LatestRestorableTime property. You can restore to a point up to the number of days specified by the BackupRetentionPeriod property. The target database is created with most of the original configuration, but in a system-selected Availability Zone, with the default security group, the default subnet group, and the default DB parameter group. By default, the new DB instance is created as a single-AZ deployment except when the instance is a SQL Server instance that has an option group that is associated with mirroring; in this case, the instance becomes a mirrored deployment and not a single-AZ deployment.  This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use RestoreDBClusterToPointInTime. 

Required Parameters
{
  "TargetDBInstanceIdentifier": "The name of the new DB instance to be created. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens  "
}

Optional Parameters
{
  "UseLatestRestorableTime": " A value that indicates whether the DB instance is restored from the latest backup time. By default, the DB instance isn't restored from the latest backup time.  Constraints: Can't be specified if the RestoreTime parameter is provided.",
  "PubliclyAccessible": "A value that indicates whether the DB instance is publicly accessible. When the DB instance is publicly accessible, it is an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address. When the DB instance isn't publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address. For more information, see CreateDBInstance.",
  "UseDefaultProcessorFeatures": "A value that indicates whether the DB instance class of the DB instance uses its default processor features.",
  "OptionGroupName": "The name of the option group to be used for the restored DB instance. Permanent options, such as the TDE option for Oracle Advanced Security TDE, can't be removed from an option group, and that option group can't be removed from a DB instance once it is associated with a DB instance",
  "AutoMinorVersionUpgrade": "A value that indicates whether minor version upgrades are applied automatically to the DB instance during the maintenance window.",
  "SourceDBInstanceIdentifier": "The identifier of the source DB instance from which to restore. Constraints:   Must match the identifier of an existing DB instance.  ",
  "DBSubnetGroupName": "The DB subnet group name to use for the new instance. Constraints: If supplied, must match the name of an existing DBSubnetGroup. Example: mySubnetgroup ",
  "Tags": "",
  "TdeCredentialArn": "The ARN from the key store with which to associate the instance for TDE encryption.",
  "CopyTagsToSnapshot": "A value that indicates whether to copy all tags from the restored DB instance to snapshots of the DB instance. By default, tags are not copied.",
  "EnableIAMDatabaseAuthentication": "A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For information about the supported DB engines, see CreateDBInstance. For more information about IAM database authentication, see  IAM Database Authentication for MySQL and PostgreSQL in the Amazon RDS User Guide. ",
  "Engine": "The database engine to use for the new instance. Default: The same as source Constraint: Must be compatible with the engine of the source Valid Values:    mariadb     mysql     oracle-ee     oracle-se2     oracle-se1     oracle-se     postgres     sqlserver-ee     sqlserver-se     sqlserver-ex     sqlserver-web   ",
  "Domain": "Specify the Active Directory directory ID to restore the DB instance in. The domain must be created prior to this operation. Currently, only Microsoft SQL Server and Oracle DB instances can be created in an Active Directory Domain.  For Microsoft SQL Server DB instances, Amazon RDS can use Windows Authentication to authenticate users that connect to the DB instance. For more information, see  Using Windows Authentication with an Amazon RDS DB Instance Running Microsoft SQL Server in the Amazon RDS User Guide. For Oracle DB instances, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB instance. For more information, see  Using Kerberos Authentication with Amazon RDS for Oracle in the Amazon RDS User Guide.",
  "DBParameterGroupName": "The name of the DB parameter group to associate with this DB instance. If you do not specify a value for DBParameterGroupName, then the default DBParameterGroup for the specified DB engine is used. Constraints:   If supplied, must match the name of an existing DBParameterGroup.   Must be 1 to 255 letters, numbers, or hyphens.   First character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.  ",
  "SourceDbiResourceId": "The resource ID of the source DB instance from which to restore.",
  "DomainIAMRoleName": "Specify the name of the IAM role to be used when making API calls to the Directory Service.",
  "TdeCredentialPassword": "The password for the given ARN from the key store in order to access the device.",
  "ProcessorFeatures": "The number of CPU cores and the number of threads per core for the DB instance class of the DB instance.",
  "LicenseModel": "License model information for the restored DB instance. Default: Same as source.  Valid values: license-included | bring-your-own-license | general-public-license ",
  "RestoreTime": "The date and time to restore from. Valid Values: Value must be a time in Universal Coordinated Time (UTC) format Constraints:   Must be before the latest restorable time for the DB instance   Can't be specified if the UseLatestRestorableTime parameter is enabled   Example: 2009-09-07T23:45:00Z ",
  "DBInstanceClass": "The compute and memory capacity of the Amazon RDS DB instance, for example, db.m4.large. Not all DB instance classes are available in all AWS Regions, or for all database engines. For the full list of DB instance classes, and availability for your engine, see DB Instance Class in the Amazon RDS User Guide.  Default: The same DBInstanceClass as the original DB instance.",
  "Port": "The port number on which the database accepts connections. Constraints: Value must be 1150-65535  Default: The same port as the original DB instance.",
  "Iops": "The amount of Provisioned IOPS (input/output operations per second) to be initially allocated for the DB instance. Constraints: Must be an integer greater than 1000.  SQL Server  Setting the IOPS value for the SQL Server database engine isn't supported.",
  "EnableCloudwatchLogsExports": "The list of logs that the restored DB instance is to export to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see Publishing Database Logs to Amazon CloudWatch Logs in the Amazon RDS User Guide.",
  "AvailabilityZone": "The Availability Zone (AZ) where the DB instance will be created. Default: A random, system-chosen Availability Zone. Constraint: You can't specify the AvailabilityZone parameter if the DB instance is a Multi-AZ deployment. Example: us-east-1a ",
  "DeletionProtection": "A value that indicates whether the DB instance has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. For more information, see  Deleting a DB Instance. ",
  "DBName": "The database name for the restored DB instance.  This parameter isn't used for the MySQL or MariaDB engines. ",
  "StorageType": "Specifies the storage type to be associated with the DB instance.  Valid values: standard | gp2 | io1   If you specify io1, you must also include a value for the Iops parameter.   Default: io1 if the Iops parameter is specified, otherwise gp2 ",
  "VpcSecurityGroupIds": " A list of EC2 VPC security groups to associate with this DB instance.   Default: The default EC2 VPC security group for the DB subnet group's VPC. ",
  "MultiAZ": "A value that indicates whether the DB instance is a Multi-AZ deployment. Constraint: You can't specify the AvailabilityZone parameter if the DB instance is a Multi-AZ deployment."
}
"""
RestoreDBInstanceToPointInTime(args) = rds("RestoreDBInstanceToPointInTime", args)

"""
    StopActivityStream()

Stops a database activity stream that was started using the AWS console, the start-activity-stream AWS CLI command, or the StartActivityStream action. For more information, see Database Activity Streams in the Amazon Aurora User Guide.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the DB cluster for the database activity stream. For example, arn:aws:rds:us-east-1:12345667890:cluster:das-cluster. "
}

Optional Parameters
{
  "ApplyImmediately": "Specifies whether or not the database activity stream is to stop as soon as possible, regardless of the maintenance window for the database."
}
"""
StopActivityStream(args) = rds("StopActivityStream", args)

"""
    DescribeInstallationMedia()

Describes the available installation media for a DB engine that requires an on-premises customer provided license, such as Microsoft SQL Server.

Optional Parameters
{
  "MaxRecords": "An optional pagination token provided by a previous DescribeInstallationMedia request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "Marker": "An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "InstallationMediaId": "The installation medium ID.",
  "Filters": "A filter that specifies one or more installation media to describe. Supported filters include the following:    custom-availability-zone-id - Accepts custom Availability Zone (AZ) identifiers. The results list includes information about only the custom AZs identified by these identifiers.    engine - Accepts database engines. The results list includes information about only the database engines identified by these identifiers. For more information about the valid engines for installation media, see ImportInstallationMedia.  "
}
"""
DescribeInstallationMedia() = rds("DescribeInstallationMedia")
DescribeInstallationMedia(args) = rds("DescribeInstallationMedia", args)

"""
    RemoveRoleFromDBCluster()

Disassociates an AWS Identity and Access Management (IAM) role from an Amazon Aurora DB cluster. For more information, see Authorizing Amazon Aurora MySQL to Access Other AWS Services on Your Behalf  in the Amazon Aurora User Guide.  This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterIdentifier": "The name of the DB cluster to disassociate the IAM role from.",
  "RoleArn": "The Amazon Resource Name (ARN) of the IAM role to disassociate from the Aurora DB cluster, for example arn:aws:iam::123456789012:role/AuroraAccessRole."
}

Optional Parameters
{
  "FeatureName": "The name of the feature for the DB cluster that the IAM role is to be disassociated from. For the list of supported feature names, see DBEngineVersion."
}
"""
RemoveRoleFromDBCluster(args) = rds("RemoveRoleFromDBCluster", args)

"""
    BacktrackDBCluster()

Backtracks a DB cluster to a specific time, without creating a new DB cluster. For more information on backtracking, see  Backtracking an Aurora DB Cluster in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterIdentifier": "The DB cluster identifier of the DB cluster to be backtracked. This parameter is stored as a lowercase string. Constraints:   Must contain from 1 to 63 alphanumeric characters or hyphens.   First character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.   Example: my-cluster1 ",
  "BacktrackTo": "The timestamp of the time to backtrack the DB cluster to, specified in ISO 8601 format. For more information about ISO 8601, see the ISO8601 Wikipedia page.   If the specified time isn't a consistent time for the DB cluster, Aurora automatically chooses the nearest possible consistent time for the DB cluster.  Constraints:   Must contain a valid ISO 8601 timestamp.   Can't contain a timestamp set in the future.   Example: 2017-07-08T18:00Z "
}

Optional Parameters
{
  "Force": "A value that indicates whether to force the DB cluster to backtrack when binary logging is enabled. Otherwise, an error occurs when binary logging is enabled.",
  "UseEarliestTimeOnPointInTimeUnavailable": "A value that indicates whether to backtrack the DB cluster to the earliest possible backtrack time when BacktrackTo is set to a timestamp earlier than the earliest backtrack time. When this parameter is disabled and BacktrackTo is set to a timestamp earlier than the earliest backtrack time, an error occurs."
}
"""
BacktrackDBCluster(args) = rds("BacktrackDBCluster", args)

"""
    PromoteReadReplica()

Promotes a Read Replica DB instance to a standalone DB instance.    Backup duration is a function of the amount of changes to the database since the previous backup. If you plan to promote a Read Replica to a standalone instance, we recommend that you enable backups and complete at least one backup prior to promotion. In addition, a Read Replica cannot be promoted to a standalone instance when it is in the backing-up status. If you have enabled backups on your Read Replica, configure the automated backup window so that daily backups do not interfere with Read Replica promotion.   This command doesn't apply to Aurora MySQL and Aurora PostgreSQL.   

Required Parameters
{
  "DBInstanceIdentifier": "The DB instance identifier. This value is stored as a lowercase string. Constraints:   Must match the identifier of an existing Read Replica DB instance.   Example: mydbinstance "
}

Optional Parameters
{
  "PreferredBackupWindow": " The daily time range during which automated backups are created if automated backups are enabled, using the BackupRetentionPeriod parameter.   The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region. To see the time blocks available, see  Adjusting the Preferred Maintenance Window in the Amazon RDS User Guide.  Constraints:   Must be in the format hh24:mi-hh24:mi.   Must be in Universal Coordinated Time (UTC).   Must not conflict with the preferred maintenance window.   Must be at least 30 minutes.  ",
  "BackupRetentionPeriod": "The number of days for which automated backups are retained. Setting this parameter to a positive number enables backups. Setting this parameter to 0 disables automated backups. Default: 1 Constraints:   Must be a value from 0 to 35.   Can't be set to 0 if the DB instance is a source to Read Replicas.  "
}
"""
PromoteReadReplica(args) = rds("PromoteReadReplica", args)

"""
    DescribeEventCategories()

Displays a list of categories for all event source types, or, if specified, for a specified source type. You can see a list of the event categories and source types in the  Events topic in the Amazon RDS User Guide. 

Optional Parameters
{
  "SourceType": "The type of source that is generating the events. Valid values: db-instance | db-parameter-group | db-security-group | db-snapshot",
  "Filters": "This parameter isn't currently supported."
}
"""
DescribeEventCategories() = rds("DescribeEventCategories")
DescribeEventCategories(args) = rds("DescribeEventCategories", args)

"""
    ModifyDBSnapshot()

Updates a manual DB snapshot, which can be encrypted or not encrypted, with a new engine version.  Amazon RDS supports upgrading DB snapshots for MySQL, Oracle, and PostgreSQL. 

Required Parameters
{
  "DBSnapshotIdentifier": "The identifier of the DB snapshot to modify."
}

Optional Parameters
{
  "EngineVersion": "The engine version to upgrade the DB snapshot to.  The following are the database engines and engine versions that are available when you upgrade a DB snapshot.   MySQL     5.5.46 (supported for 5.1 DB snapshots)    Oracle     12.1.0.2.v8 (supported for 12.1.0.1 DB snapshots)    11.2.0.4.v12 (supported for 11.2.0.2 DB snapshots)    11.2.0.4.v11 (supported for 11.2.0.3 DB snapshots)    PostgreSQL  For the list of engine versions that are available for upgrading a DB snapshot, see  Upgrading the PostgreSQL DB Engine for Amazon RDS. ",
  "OptionGroupName": "The option group to identify with the upgraded DB snapshot.  You can specify this parameter when you upgrade an Oracle DB snapshot. The same option group considerations apply when upgrading a DB snapshot as when upgrading a DB instance. For more information, see Option Group Considerations in the Amazon RDS User Guide. "
}
"""
ModifyDBSnapshot(args) = rds("ModifyDBSnapshot", args)

"""
    DeleteDBClusterEndpoint()

Deletes a custom endpoint and removes it from an Amazon Aurora DB cluster.  This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterEndpointIdentifier": "The identifier associated with the custom endpoint. This parameter is stored as a lowercase string."
}
"""
DeleteDBClusterEndpoint(args) = rds("DeleteDBClusterEndpoint", args)

"""
    CreateDBClusterEndpoint()

Creates a new custom endpoint and associates it with an Amazon Aurora DB cluster.  This action only applies to Aurora DB clusters. 

Required Parameters
{
  "EndpointType": "The type of the endpoint. One of: READER, WRITER, ANY.",
  "DBClusterIdentifier": "The DB cluster identifier of the DB cluster associated with the endpoint. This parameter is stored as a lowercase string.",
  "DBClusterEndpointIdentifier": "The identifier to use for the new endpoint. This parameter is stored as a lowercase string."
}

Optional Parameters
{
  "StaticMembers": "List of DB instance identifiers that are part of the custom endpoint group.",
  "Tags": "The tags to be assigned to the Amazon RDS resource.",
  "ExcludedMembers": "List of DB instance identifiers that aren't part of the custom endpoint group. All other eligible instances are reachable through the custom endpoint. Only relevant if the list of static members is empty."
}
"""
CreateDBClusterEndpoint(args) = rds("CreateDBClusterEndpoint", args)

"""
    DeleteDBClusterSnapshot()

Deletes a DB cluster snapshot. If the snapshot is being copied, the copy operation is terminated.  The DB cluster snapshot must be in the available state to be deleted.  For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterSnapshotIdentifier": "The identifier of the DB cluster snapshot to delete. Constraints: Must be the name of an existing DB cluster snapshot in the available state."
}
"""
DeleteDBClusterSnapshot(args) = rds("DeleteDBClusterSnapshot", args)

"""
    DeleteOptionGroup()

Deletes an existing option group.

Required Parameters
{
  "OptionGroupName": "The name of the option group to be deleted.  You can't delete default option groups. "
}
"""
DeleteOptionGroup(args) = rds("DeleteOptionGroup", args)

"""
    RestoreDBClusterFromSnapshot()

Creates a new DB cluster from a DB snapshot or DB cluster snapshot. If a DB snapshot is specified, the target DB cluster is created from the source DB snapshot with a default configuration and default security group. If a DB cluster snapshot is specified, the target DB cluster is created from the source DB cluster restore point with the same configuration as the original source DB cluster. If you don't specify a security group, the new DB cluster is associated with the default security group. For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterIdentifier": "The name of the DB cluster to create from the DB snapshot or DB cluster snapshot. This parameter isn't case-sensitive. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens   Example: my-snapshot-id ",
  "Engine": "The database engine to use for the new DB cluster. Default: The same as source Constraint: Must be compatible with the engine of the source",
  "SnapshotIdentifier": "The identifier for the DB snapshot or DB cluster snapshot to restore from. You can use either the name or the Amazon Resource Name (ARN) to specify a DB cluster snapshot. However, you can use only the ARN to specify a DB snapshot. Constraints:   Must match the identifier of an existing Snapshot.  "
}

Optional Parameters
{
  "DatabaseName": "The database name for the restored DB cluster.",
  "OptionGroupName": "The name of the option group to use for the restored DB cluster.",
  "AvailabilityZones": "Provides the list of Availability Zones (AZs) where instances in the restored DB cluster can be created.",
  "DBSubnetGroupName": "The name of the DB subnet group to use for the new DB cluster. Constraints: If supplied, must match the name of an existing DB subnet group. Example: mySubnetgroup ",
  "Tags": "The tags to be assigned to the restored DB cluster.",
  "BacktrackWindow": "The target backtrack window, in seconds. To disable backtracking, set this value to 0. Default: 0 Constraints:   If specified, this value must be set to a number from 0 to 259,200 (72 hours).  ",
  "EnableIAMDatabaseAuthentication": "A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For more information, see  IAM Database Authentication in the Amazon Aurora User Guide. ",
  "CopyTagsToSnapshot": "A value that indicates whether to copy all tags from the restored DB cluster to snapshots of the restored DB cluster. The default is not to copy them.",
  "Domain": "Specify the Active Directory directory ID to restore the DB cluster in. The domain must be created prior to this operation. ",
  "DomainIAMRoleName": "Specify the name of the IAM role to be used when making API calls to the Directory Service.",
  "EngineVersion": "The version of the database engine to use for the new DB cluster. To list all of the available engine versions for aurora (for MySQL 5.6-compatible Aurora), use the following command:  aws rds describe-db-engine-versions --engine aurora --query \"DBEngineVersions[].EngineVersion\"  To list all of the available engine versions for aurora-mysql (for MySQL 5.7-compatible Aurora), use the following command:  aws rds describe-db-engine-versions --engine aurora-mysql --query \"DBEngineVersions[].EngineVersion\"  To list all of the available engine versions for aurora-postgresql, use the following command:  aws rds describe-db-engine-versions --engine aurora-postgresql --query \"DBEngineVersions[].EngineVersion\"   If you aren't using the default engine version, then you must specify the engine version.   Aurora MySQL  Example: 5.6.10a, 5.6.mysql_aurora.1.19.2, 5.7.12, 5.7.mysql_aurora.2.04.5   Aurora PostgreSQL  Example: 9.6.3, 10.7 ",
  "ScalingConfiguration": "For DB clusters in serverless DB engine mode, the scaling properties of the DB cluster.",
  "EngineMode": "The DB engine mode of the DB cluster, either provisioned, serverless, parallelquery, global, or multimaster.",
  "DBClusterParameterGroupName": "The name of the DB cluster parameter group to associate with this DB cluster. If this argument is omitted, the default DB cluster parameter group for the specified engine is used. Constraints:   If supplied, must match the name of an existing default DB cluster parameter group.   Must be 1 to 255 letters, numbers, or hyphens.   First character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.  ",
  "Port": "The port number on which the new DB cluster accepts connections. Constraints: This value must be 1150-65535  Default: The same port as the original DB cluster.",
  "EnableCloudwatchLogsExports": "The list of logs that the restored DB cluster is to export to Amazon CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see Publishing Database Logs to Amazon CloudWatch Logs  in the Amazon Aurora User Guide.",
  "DeletionProtection": "A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. ",
  "VpcSecurityGroupIds": "A list of VPC security groups that the new DB cluster will belong to.",
  "KmsKeyId": "The AWS KMS key identifier to use when restoring an encrypted DB cluster from a DB snapshot or DB cluster snapshot. The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are restoring a DB cluster with the same AWS account that owns the KMS encryption key used to encrypt the new DB cluster, then you can use the KMS key alias instead of the ARN for the KMS encryption key. If you don't specify a value for the KmsKeyId parameter, then the following occurs:   If the DB snapshot or DB cluster snapshot in SnapshotIdentifier is encrypted, then the restored DB cluster is encrypted using the KMS key that was used to encrypt the DB snapshot or DB cluster snapshot.   If the DB snapshot or DB cluster snapshot in SnapshotIdentifier isn't encrypted, then the restored DB cluster isn't encrypted.  "
}
"""
RestoreDBClusterFromSnapshot(args) = rds("RestoreDBClusterFromSnapshot", args)

"""
    DeleteDBCluster()

The DeleteDBCluster action deletes a previously provisioned DB cluster. When you delete a DB cluster, all automated backups for that DB cluster are deleted and can't be recovered. Manual DB cluster snapshots of the specified DB cluster are not deleted.  For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterIdentifier": "The DB cluster identifier for the DB cluster to be deleted. This parameter isn't case-sensitive. Constraints:   Must match an existing DBClusterIdentifier.  "
}

Optional Parameters
{
  "SkipFinalSnapshot": "A value that indicates whether to skip the creation of a final DB cluster snapshot before the DB cluster is deleted. If skip is specified, no DB cluster snapshot is created. If skip isn't specified, a DB cluster snapshot is created before the DB cluster is deleted. By default, skip isn't specified, and the DB cluster snapshot is created. By default, this parameter is disabled.  You must specify a FinalDBSnapshotIdentifier parameter if SkipFinalSnapshot is disabled. ",
  "FinalDBSnapshotIdentifier": " The DB cluster snapshot identifier of the new DB cluster snapshot created when SkipFinalSnapshot is disabled.    Specifying this parameter and also skipping the creation of a final DB cluster snapshot with the SkipFinalShapshot parameter results in an error.  Constraints:   Must be 1 to 255 letters, numbers, or hyphens.   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens  "
}
"""
DeleteDBCluster(args) = rds("DeleteDBCluster", args)

"""
    RestoreDBInstanceFromDBSnapshot()

Creates a new DB instance from a DB snapshot. The target database is created from the source database restore point with the most of original configuration with the default security group and the default DB parameter group. By default, the new DB instance is created as a single-AZ deployment except when the instance is a SQL Server instance that has an option group that is associated with mirroring; in this case, the instance becomes a mirrored AZ deployment and not a single-AZ deployment. If your intent is to replace your original DB instance with the new, restored DB instance, then rename your original DB instance before you call the RestoreDBInstanceFromDBSnapshot action. RDS doesn't allow two DB instances with the same name. Once you have renamed your original DB instance with a different identifier, then you can pass the original name of the DB instance as the DBInstanceIdentifier in the call to the RestoreDBInstanceFromDBSnapshot action. The result is that you will replace the original DB instance with the DB instance created from the snapshot. If you are restoring from a shared manual DB snapshot, the DBSnapshotIdentifier must be the ARN of the shared DB snapshot.  This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use RestoreDBClusterFromSnapshot. 

Required Parameters
{
  "DBInstanceIdentifier": "Name of the DB instance to create from the DB snapshot. This parameter isn't case-sensitive. Constraints:   Must contain from 1 to 63 numbers, letters, or hyphens   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens   Example: my-snapshot-id ",
  "DBSnapshotIdentifier": "The identifier for the DB snapshot to restore from. Constraints:   Must match the identifier of an existing DBSnapshot.   If you are restoring from a shared manual DB snapshot, the DBSnapshotIdentifier must be the ARN of the shared DB snapshot.  "
}

Optional Parameters
{
  "PubliclyAccessible": "A value that indicates whether the DB instance is publicly accessible. When the DB instance is publicly accessible, it is an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address. When the DB instance isn't publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address. For more information, see CreateDBInstance.",
  "UseDefaultProcessorFeatures": "A value that indicates whether the DB instance class of the DB instance uses its default processor features.",
  "OptionGroupName": "The name of the option group to be used for the restored DB instance. Permanent options, such as the TDE option for Oracle Advanced Security TDE, can't be removed from an option group, and that option group can't be removed from a DB instance once it is associated with a DB instance",
  "AutoMinorVersionUpgrade": "A value that indicates whether minor version upgrades are applied automatically to the DB instance during the maintenance window.",
  "DBSubnetGroupName": "The DB subnet group name to use for the new instance. Constraints: If supplied, must match the name of an existing DBSubnetGroup. Example: mySubnetgroup ",
  "Tags": "",
  "TdeCredentialArn": "The ARN from the key store with which to associate the instance for TDE encryption.",
  "CopyTagsToSnapshot": "A value that indicates whether to copy all tags from the restored DB instance to snapshots of the DB instance. By default, tags are not copied.",
  "EnableIAMDatabaseAuthentication": "A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For information about the supported DB engines, see CreateDBInstance. For more information about IAM database authentication, see  IAM Database Authentication for MySQL and PostgreSQL in the Amazon RDS User Guide. ",
  "Engine": "The database engine to use for the new instance. Default: The same as source Constraint: Must be compatible with the engine of the source. For example, you can restore a MariaDB 10.1 DB instance from a MySQL 5.6 snapshot. Valid Values:    mariadb     mysql     oracle-ee     oracle-se2     oracle-se1     oracle-se     postgres     sqlserver-ee     sqlserver-se     sqlserver-ex     sqlserver-web   ",
  "Domain": "Specify the Active Directory directory ID to restore the DB instance in. The domain must be created prior to this operation. Currently, only Microsoft SQL Server and Oracle DB instances can be created in an Active Directory Domain.  For Microsoft SQL Server DB instances, Amazon RDS can use Windows Authentication to authenticate users that connect to the DB instance. For more information, see  Using Windows Authentication with an Amazon RDS DB Instance Running Microsoft SQL Server in the Amazon RDS User Guide. For Oracle DB instances, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB instance. For more information, see  Using Kerberos Authentication with Amazon RDS for Oracle in the Amazon RDS User Guide.",
  "DBParameterGroupName": "The name of the DB parameter group to associate with this DB instance. If you do not specify a value for DBParameterGroupName, then the default DBParameterGroup for the specified DB engine is used. Constraints:   If supplied, must match the name of an existing DBParameterGroup.   Must be 1 to 255 letters, numbers, or hyphens.   First character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.  ",
  "DomainIAMRoleName": "Specify the name of the IAM role to be used when making API calls to the Directory Service.",
  "TdeCredentialPassword": "The password for the given ARN from the key store in order to access the device.",
  "ProcessorFeatures": "The number of CPU cores and the number of threads per core for the DB instance class of the DB instance.",
  "LicenseModel": "License model information for the restored DB instance. Default: Same as source.  Valid values: license-included | bring-your-own-license | general-public-license ",
  "Iops": "Specifies the amount of provisioned IOPS for the DB instance, expressed in I/O operations per second. If this parameter isn't specified, the IOPS value is taken from the backup. If this parameter is set to 0, the new instance is converted to a non-PIOPS instance. The conversion takes additional time, though your DB instance is available for connections before the conversion starts.  The provisioned IOPS value must follow the requirements for your database engine. For more information, see Amazon RDS Provisioned IOPS Storage to Improve Performance in the Amazon RDS User Guide.  Constraints: Must be an integer greater than 1000.",
  "DBInstanceClass": "The compute and memory capacity of the Amazon RDS DB instance, for example, db.m4.large. Not all DB instance classes are available in all AWS Regions, or for all database engines. For the full list of DB instance classes, and availability for your engine, see DB Instance Class in the Amazon RDS User Guide.  Default: The same DBInstanceClass as the original DB instance.",
  "Port": "The port number on which the database accepts connections. Default: The same port as the original DB instance Constraints: Value must be 1150-65535 ",
  "EnableCloudwatchLogsExports": "The list of logs that the restored DB instance is to export to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see Publishing Database Logs to Amazon CloudWatch Logs in the Amazon Aurora User Guide.",
  "AvailabilityZone": "The Availability Zone (AZ) where the DB instance will be created. Default: A random, system-chosen Availability Zone. Constraint: You can't specify the AvailabilityZone parameter if the DB instance is a Multi-AZ deployment. Example: us-east-1a ",
  "DeletionProtection": "A value that indicates whether the DB instance has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. For more information, see  Deleting a DB Instance. ",
  "DBName": "The database name for the restored DB instance.  This parameter doesn't apply to the MySQL, PostgreSQL, or MariaDB engines. ",
  "StorageType": "Specifies the storage type to be associated with the DB instance.  Valid values: standard | gp2 | io1   If you specify io1, you must also include a value for the Iops parameter.   Default: io1 if the Iops parameter is specified, otherwise gp2 ",
  "VpcSecurityGroupIds": " A list of EC2 VPC security groups to associate with this DB instance.   Default: The default EC2 VPC security group for the DB subnet group's VPC. ",
  "MultiAZ": "A value that indicates whether the DB instance is a Multi-AZ deployment. Constraint: You can't specify the AvailabilityZone parameter if the DB instance is a Multi-AZ deployment."
}
"""
RestoreDBInstanceFromDBSnapshot(args) = rds("RestoreDBInstanceFromDBSnapshot", args)

"""
    CopyDBClusterParameterGroup()

Copies the specified DB cluster parameter group.  This action only applies to Aurora DB clusters. 

Required Parameters
{
  "SourceDBClusterParameterGroupIdentifier": "The identifier or Amazon Resource Name (ARN) for the source DB cluster parameter group. For information about creating an ARN, see  Constructing an ARN for Amazon RDS in the Amazon Aurora User Guide.  Constraints:   Must specify a valid DB cluster parameter group.   If the source DB cluster parameter group is in the same AWS Region as the copy, specify a valid DB parameter group identifier, for example my-db-cluster-param-group, or a valid ARN.   If the source DB parameter group is in a different AWS Region than the copy, specify a valid DB cluster parameter group ARN, for example arn:aws:rds:us-east-1:123456789012:cluster-pg:custom-cluster-group1.  ",
  "TargetDBClusterParameterGroupDescription": "A description for the copied DB cluster parameter group.",
  "TargetDBClusterParameterGroupIdentifier": "The identifier for the copied DB cluster parameter group. Constraints:   Can't be null, empty, or blank   Must contain from 1 to 255 letters, numbers, or hyphens   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens   Example: my-cluster-param-group1 "
}

Optional Parameters
{
  "Tags": ""
}
"""
CopyDBClusterParameterGroup(args) = rds("CopyDBClusterParameterGroup", args)

"""
    DeleteEventSubscription()

Deletes an RDS event notification subscription.

Required Parameters
{
  "SubscriptionName": "The name of the RDS event notification subscription you want to delete."
}
"""
DeleteEventSubscription(args) = rds("DeleteEventSubscription", args)

"""
    CreateGlobalCluster()

   Creates an Aurora global database spread across multiple regions. The global database contains a single primary cluster with read-write capability, and a read-only secondary cluster that receives data from the primary cluster through high-speed replication performed by the Aurora storage subsystem.   You can create a global database that is initially empty, and then add a primary cluster and a secondary cluster to it. Or you can specify an existing Aurora cluster during the create operation, and this cluster becomes the primary cluster of the global database.   This action only applies to Aurora DB clusters. 

Optional Parameters
{
  "DatabaseName": " The name for your database of up to 64 alpha-numeric characters. If you do not provide a name, Amazon Aurora will not create a database in the global database cluster you are creating. ",
  "StorageEncrypted": " The storage encryption setting for the new global database cluster. ",
  "DeletionProtection": " The deletion protection setting for the new global database. The global database can't be deleted when deletion protection is enabled. ",
  "EngineVersion": "The engine version of the Aurora global database.",
  "Engine": "Provides the name of the database engine to be used for this DB cluster.",
  "SourceDBClusterIdentifier": " The Amazon Resource Name (ARN) to use as the primary cluster of the global database. This parameter is optional. ",
  "GlobalClusterIdentifier": "The cluster identifier of the new global database cluster."
}
"""
CreateGlobalCluster() = rds("CreateGlobalCluster")
CreateGlobalCluster(args) = rds("CreateGlobalCluster", args)

"""
    ResetDBParameterGroup()

Modifies the parameters of a DB parameter group to the engine/system default value. To reset specific parameters, provide a list of the following: ParameterName and ApplyMethod. To reset the entire DB parameter group, specify the DBParameterGroup name and ResetAllParameters parameters. When resetting the entire group, dynamic parameters are updated immediately and static parameters are set to pending-reboot to take effect on the next DB instance restart or RebootDBInstance request. 

Required Parameters
{
  "DBParameterGroupName": "The name of the DB parameter group. Constraints:   Must match the name of an existing DBParameterGroup.  "
}

Optional Parameters
{
  "Parameters": "To reset the entire DB parameter group, specify the DBParameterGroup name and ResetAllParameters parameters. To reset specific parameters, provide a list of the following: ParameterName and ApplyMethod. A maximum of 20 parameters can be modified in a single request.  MySQL  Valid Values (for Apply method): immediate | pending-reboot  You can use the immediate value with dynamic parameters only. You can use the pending-reboot value for both dynamic and static parameters, and changes are applied when DB instance reboots.  MariaDB  Valid Values (for Apply method): immediate | pending-reboot  You can use the immediate value with dynamic parameters only. You can use the pending-reboot value for both dynamic and static parameters, and changes are applied when DB instance reboots.  Oracle  Valid Values (for Apply method): pending-reboot ",
  "ResetAllParameters": " A value that indicates whether to reset all parameters in the DB parameter group to default values. By default, all parameters in the DB parameter group are reset to default values. "
}
"""
ResetDBParameterGroup(args) = rds("ResetDBParameterGroup", args)

"""
    RemoveRoleFromDBInstance()

Disassociates an AWS Identity and Access Management (IAM) role from a DB instance.

Required Parameters
{
  "DBInstanceIdentifier": "The name of the DB instance to disassociate the IAM role from.",
  "RoleArn": "The Amazon Resource Name (ARN) of the IAM role to disassociate from the DB instance, for example arn:aws:iam::123456789012:role/AccessRole.",
  "FeatureName": "The name of the feature for the DB instance that the IAM role is to be disassociated from. For the list of supported feature names, see DBEngineVersion. "
}
"""
RemoveRoleFromDBInstance(args) = rds("RemoveRoleFromDBInstance", args)

"""
    ModifyEventSubscription()

Modifies an existing RDS event notification subscription. You can't modify the source identifiers using this call. To change source identifiers for a subscription, use the AddSourceIdentifierToSubscription and RemoveSourceIdentifierFromSubscription calls. You can see a list of the event categories for a given SourceType in the Events topic in the Amazon RDS User Guide or by using the DescribeEventCategories action.

Required Parameters
{
  "SubscriptionName": "The name of the RDS event notification subscription."
}

Optional Parameters
{
  "SourceType": "The type of source that is generating the events. For example, if you want to be notified of events generated by a DB instance, you would set this parameter to db-instance. If this value isn't specified, all events are returned. Valid values: db-instance | db-parameter-group | db-security-group | db-snapshot",
  "SnsTopicArn": "The Amazon Resource Name (ARN) of the SNS topic created for event notification. The ARN is created by Amazon SNS when you create a topic and subscribe to it.",
  "EventCategories": " A list of event categories for a SourceType that you want to subscribe to. You can see a list of the categories for a given SourceType in the Events topic in the Amazon RDS User Guide or by using the DescribeEventCategories action. ",
  "Enabled": " A value that indicates whether to activate the subscription. "
}
"""
ModifyEventSubscription(args) = rds("ModifyEventSubscription", args)

"""
    DeleteDBClusterParameterGroup()

Deletes a specified DB cluster parameter group. The DB cluster parameter group to be deleted can't be associated with any DB clusters. For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterParameterGroupName": "The name of the DB cluster parameter group. Constraints:   Must be the name of an existing DB cluster parameter group.   You can't delete a default DB cluster parameter group.   Can't be associated with any DB clusters.  "
}
"""
DeleteDBClusterParameterGroup(args) = rds("DeleteDBClusterParameterGroup", args)

"""
    DescribeOrderableDBInstanceOptions()

Returns a list of orderable DB instance options for the specified engine.

Required Parameters
{
  "Engine": "The name of the engine to retrieve DB instance options for."
}

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeOrderableDBInstanceOptions request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords . ",
  "EngineVersion": "The engine version filter value. Specify this parameter to show only the available offerings matching the specified engine version.",
  "LicenseModel": "The license model filter value. Specify this parameter to show only the available offerings matching the specified license model.",
  "Vpc": "A value that indicates whether to show only VPC or non-VPC offerings.",
  "DBInstanceClass": "The DB instance class filter value. Specify this parameter to show only the available offerings matching the specified DB instance class.",
  "Filters": "This parameter isn't currently supported."
}
"""
DescribeOrderableDBInstanceOptions(args) = rds("DescribeOrderableDBInstanceOptions", args)

"""
    DescribeDBClusterParameters()

Returns the detailed parameter list for a particular DB cluster parameter group. For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterParameterGroupName": "The name of a specific DB cluster parameter group to return parameter details for. Constraints:   If supplied, must match the name of an existing DBClusterParameterGroup.  "
}

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeDBClusterParameters request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "Source": " A value that indicates to return only parameters for a specific source. Parameter sources can be engine, service, or customer. ",
  "Filters": "This parameter isn't currently supported."
}
"""
DescribeDBClusterParameters(args) = rds("DescribeDBClusterParameters", args)

"""
    DescribeDBParameterGroups()

 Returns a list of DBParameterGroup descriptions. If a DBParameterGroupName is specified, the list will contain only the description of the specified DB parameter group. 

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeDBParameterGroups request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "DBParameterGroupName": "The name of a specific DB parameter group to return details for. Constraints:   If supplied, must match the name of an existing DBClusterParameterGroup.  ",
  "Filters": "This parameter isn't currently supported."
}
"""
DescribeDBParameterGroups() = rds("DescribeDBParameterGroups")
DescribeDBParameterGroups(args) = rds("DescribeDBParameterGroups", args)

"""
    DeleteDBInstanceAutomatedBackup()

Deletes automated backups based on the source instance's DbiResourceId value or the restorable instance's resource ID.

Required Parameters
{
  "DbiResourceId": "The identifier for the source DB instance, which can't be changed and which is unique to an AWS Region."
}
"""
DeleteDBInstanceAutomatedBackup(args) = rds("DeleteDBInstanceAutomatedBackup", args)

"""
    ModifyDBParameterGroup()

 Modifies the parameters of a DB parameter group. To modify more than one parameter, submit a list of the following: ParameterName, ParameterValue, and ApplyMethod. A maximum of 20 parameters can be modified in a single request.   Changes to dynamic parameters are applied immediately. Changes to static parameters require a reboot without failover to the DB instance associated with the parameter group before the change can take effect.   After you modify a DB parameter group, you should wait at least 5 minutes before creating your first DB instance that uses that DB parameter group as the default parameter group. This allows Amazon RDS to fully complete the modify action before the parameter group is used as the default for a new DB instance. This is especially important for parameters that are critical when creating the default database for a DB instance, such as the character set for the default database defined by the character_set_database parameter. You can use the Parameter Groups option of the Amazon RDS console or the DescribeDBParameters command to verify that your DB parameter group has been created or modified. 

Required Parameters
{
  "Parameters": "An array of parameter names, values, and the apply method for the parameter update. At least one parameter name, value, and apply method must be supplied; later arguments are optional. A maximum of 20 parameters can be modified in a single request. Valid Values (for the application method): immediate | pending-reboot   You can use the immediate value with dynamic parameters only. You can use the pending-reboot value for both dynamic and static parameters, and changes are applied when you reboot the DB instance without failover. ",
  "DBParameterGroupName": "The name of the DB parameter group. Constraints:   If supplied, must match the name of an existing DBParameterGroup.  "
}
"""
ModifyDBParameterGroup(args) = rds("ModifyDBParameterGroup", args)

"""
    DescribeDBClusterBacktracks()

Returns information about backtracks for a DB cluster. For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterIdentifier": "The DB cluster identifier of the DB cluster to be described. This parameter is stored as a lowercase string. Constraints:   Must contain from 1 to 63 alphanumeric characters or hyphens.   First character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.   Example: my-cluster1 "
}

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeDBClusterBacktracks request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "BacktrackIdentifier": "If specified, this value is the backtrack identifier of the backtrack to be described. Constraints:   Must contain a valid universally unique identifier (UUID). For more information about UUIDs, see A Universally Unique Identifier (UUID) URN Namespace.   Example: 123e4567-e89b-12d3-a456-426655440000 ",
  "Filters": "A filter that specifies one or more DB clusters to describe. Supported filters include the following:    db-cluster-backtrack-id - Accepts backtrack identifiers. The results list includes information about only the backtracks identified by these identifiers.    db-cluster-backtrack-status - Accepts any of the following backtrack status values:    applying     completed     failed     pending    The results list includes information about only the backtracks identified by these values.  "
}
"""
DescribeDBClusterBacktracks(args) = rds("DescribeDBClusterBacktracks", args)

"""
    ModifyGlobalCluster()

 Modify a setting for an Amazon Aurora global cluster. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Optional Parameters
{
  "NewGlobalClusterIdentifier": " The new cluster identifier for the global database cluster when modifying a global database cluster. This value is stored as a lowercase string.  Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens   The first character must be a letter   Can't end with a hyphen or contain two consecutive hyphens   Example: my-cluster2 ",
  "DeletionProtection": " Indicates if the global database cluster has deletion protection enabled. The global database cluster can't be deleted when deletion protection is enabled. ",
  "GlobalClusterIdentifier": " The DB cluster identifier for the global cluster being modified. This parameter isn't case-sensitive.  Constraints:   Must match the identifier of an existing global database cluster.  "
}
"""
ModifyGlobalCluster() = rds("ModifyGlobalCluster")
ModifyGlobalCluster(args) = rds("ModifyGlobalCluster", args)

"""
    RegisterDBProxyTargets()

 This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.  Associate one or more DBProxyTarget data structures with a DBProxyTargetGroup.

Required Parameters
{
  "DBProxyName": "The identifier of the DBProxy that is associated with the DBProxyTargetGroup."
}

Optional Parameters
{
  "DBInstanceIdentifiers": "One or more DB instance identifiers.",
  "DBClusterIdentifiers": "One or more DB cluster identifiers.",
  "TargetGroupName": "The identifier of the DBProxyTargetGroup."
}
"""
RegisterDBProxyTargets(args) = rds("RegisterDBProxyTargets", args)

"""
    CreateEventSubscription()

Creates an RDS event notification subscription. This action requires a topic Amazon Resource Name (ARN) created by either the RDS console, the SNS console, or the SNS API. To obtain an ARN with SNS, you must create a topic in Amazon SNS and subscribe to the topic. The ARN is displayed in the SNS console. You can specify the type of source (SourceType) you want to be notified of, provide a list of RDS sources (SourceIds) that triggers the events, and provide a list of event categories (EventCategories) for events you want to be notified of. For example, you can specify SourceType = db-instance, SourceIds = mydbinstance1, mydbinstance2 and EventCategories = Availability, Backup. If you specify both the SourceType and SourceIds, such as SourceType = db-instance and SourceIdentifier = myDBInstance1, you are notified of all the db-instance events for the specified source. If you specify a SourceType but do not specify a SourceIdentifier, you receive notice of the events for that source type for all your RDS sources. If you don't specify either the SourceType or the SourceIdentifier, you are notified of events generated from all RDS sources belonging to your customer account.  RDS event notification is only available for unencrypted SNS topics. If you specify an encrypted SNS topic, event notifications aren't sent for the topic. 

Required Parameters
{
  "SubscriptionName": "The name of the subscription. Constraints: The name must be less than 255 characters.",
  "SnsTopicArn": "The Amazon Resource Name (ARN) of the SNS topic created for event notification. The ARN is created by Amazon SNS when you create a topic and subscribe to it."
}

Optional Parameters
{
  "SourceIds": "The list of identifiers of the event sources for which events are returned. If not specified, then all sources are included in the response. An identifier must begin with a letter and must contain only ASCII letters, digits, and hyphens. It can't end with a hyphen or contain two consecutive hyphens. Constraints:   If SourceIds are supplied, SourceType must also be provided.   If the source type is a DB instance, then a DBInstanceIdentifier must be supplied.   If the source type is a DB security group, a DBSecurityGroupName must be supplied.   If the source type is a DB parameter group, a DBParameterGroupName must be supplied.   If the source type is a DB snapshot, a DBSnapshotIdentifier must be supplied.  ",
  "Tags": "",
  "SourceType": "The type of source that is generating the events. For example, if you want to be notified of events generated by a DB instance, you would set this parameter to db-instance. if this value isn't specified, all events are returned. Valid values: db-instance | db-cluster | db-parameter-group | db-security-group | db-snapshot | db-cluster-snapshot ",
  "EventCategories": " A list of event categories for a SourceType that you want to subscribe to. You can see a list of the categories for a given SourceType in the Events topic in the Amazon RDS User Guide or by using the DescribeEventCategories action. ",
  "Enabled": " A value that indicates whether to activate the subscription. If the event notification subscription isn't activated, the subscription is created but not active. "
}
"""
CreateEventSubscription(args) = rds("CreateEventSubscription", args)

"""
    CreateDBCluster()

Creates a new Amazon Aurora DB cluster. You can use the ReplicationSourceIdentifier parameter to create the DB cluster as a Read Replica of another DB cluster or Amazon RDS MySQL DB instance. For cross-region replication where the DB cluster identified by ReplicationSourceIdentifier is encrypted, you must also specify the PreSignedUrl parameter. For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterIdentifier": "The DB cluster identifier. This parameter is stored as a lowercase string. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   First character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.   Example: my-cluster1 ",
  "Engine": "The name of the database engine to be used for this DB cluster. Valid Values: aurora (for MySQL 5.6-compatible Aurora), aurora-mysql (for MySQL 5.7-compatible Aurora), and aurora-postgresql "
}

Optional Parameters
{
  "DatabaseName": "The name for your database of up to 64 alphanumeric characters. If you do not provide a name, Amazon RDS doesn't create a database in the DB cluster you are creating.",
  "ReplicationSourceIdentifier": "The Amazon Resource Name (ARN) of the source DB instance or DB cluster if this DB cluster is created as a Read Replica.",
  "OptionGroupName": "A value that indicates that the DB cluster should be associated with the specified option group. Permanent options can't be removed from an option group. The option group can't be removed from a DB cluster once it is associated with a DB cluster.",
  "CharacterSetName": "A value that indicates that the DB cluster should be associated with the specified CharacterSet.",
  "PreferredMaintenanceWindow": "The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC). Format: ddd:hh24:mi-ddd:hh24:mi  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week. To see the time blocks available, see  Adjusting the Preferred DB Cluster Maintenance Window in the Amazon Aurora User Guide.  Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun. Constraints: Minimum 30-minute window.",
  "AvailabilityZones": "A list of Availability Zones (AZs) where instances in the DB cluster can be created. For information on AWS Regions and Availability Zones, see Choosing the Regions and Availability Zones in the Amazon Aurora User Guide. ",
  "BackupRetentionPeriod": "The number of days for which automated backups are retained. Default: 1 Constraints:   Must be a value from 1 to 35  ",
  "DBSubnetGroupName": "A DB subnet group to associate with this DB cluster. Constraints: Must match the name of an existing DBSubnetGroup. Must not be default. Example: mySubnetgroup ",
  "Tags": "Tags to assign to the DB cluster.",
  "StorageEncrypted": "A value that indicates whether the DB cluster is encrypted.",
  "SourceRegion": "The ID of the region that contains the source for the read replica.",
  "BacktrackWindow": "The target backtrack window, in seconds. To disable backtracking, set this value to 0.  Default: 0 Constraints:   If specified, this value must be set to a number from 0 to 259,200 (72 hours).  ",
  "EnableIAMDatabaseAuthentication": "A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For more information, see  IAM Database Authentication in the Amazon Aurora User Guide. ",
  "CopyTagsToSnapshot": "A value that indicates whether to copy all tags from the DB cluster to snapshots of the DB cluster. The default is not to copy them.",
  "Domain": "The Active Directory directory ID to create the DB cluster in.  For Amazon Aurora DB clusters, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB cluster. For more information, see Using Kerberos Authentication for Aurora MySQL in the Amazon Aurora User Guide. ",
  "DomainIAMRoleName": "Specify the name of the IAM role to be used when making API calls to the Directory Service.",
  "MasterUsername": "The name of the master user for the DB cluster. Constraints:   Must be 1 to 16 letters or numbers.   First character must be a letter.   Can't be a reserved word for the chosen database engine.  ",
  "PreferredBackupWindow": "The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter.  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region. To see the time blocks available, see  Adjusting the Preferred DB Cluster Maintenance Window in the Amazon Aurora User Guide.  Constraints:   Must be in the format hh24:mi-hh24:mi.   Must be in Universal Coordinated Time (UTC).   Must not conflict with the preferred maintenance window.   Must be at least 30 minutes.  ",
  "EnableHttpEndpoint": "A value that indicates whether to enable the HTTP endpoint for an Aurora Serverless DB cluster. By default, the HTTP endpoint is disabled. When enabled, the HTTP endpoint provides a connectionless web service API for running SQL queries on the Aurora Serverless DB cluster. You can also query your database from inside the RDS console with the query editor. For more information, see Using the Data API for Aurora Serverless in the Amazon Aurora User Guide.",
  "PreSignedUrl": "A URL that contains a Signature Version 4 signed request for the CreateDBCluster action to be called in the source AWS Region where the DB cluster is replicated from. You only need to specify PreSignedUrl when you are performing cross-region replication from an encrypted DB cluster. The pre-signed URL must be a valid request for the CreateDBCluster API action that can be executed in the source AWS Region that contains the encrypted DB cluster to be copied. The pre-signed URL request must contain the following parameter values:    KmsKeyId - The AWS KMS key identifier for the key to use to encrypt the copy of the DB cluster in the destination AWS Region. This should refer to the same KMS key for both the CreateDBCluster action that is called in the destination AWS Region, and the action contained in the pre-signed URL.    DestinationRegion - The name of the AWS Region that Aurora Read Replica will be created in.    ReplicationSourceIdentifier - The DB cluster identifier for the encrypted DB cluster to be copied. This identifier must be in the Amazon Resource Name (ARN) format for the source AWS Region. For example, if you are copying an encrypted DB cluster from the us-west-2 AWS Region, then your ReplicationSourceIdentifier would look like Example: arn:aws:rds:us-west-2:123456789012:cluster:aurora-cluster1.   To learn how to generate a Signature Version 4 signed request, see  Authenticating Requests: Using Query Parameters (AWS Signature Version 4) and  Signature Version 4 Signing Process.  If you are using an AWS SDK tool or the AWS CLI, you can specify SourceRegion (or --source-region for the AWS CLI) instead of specifying PreSignedUrl manually. Specifying SourceRegion autogenerates a pre-signed URL that is a valid request for the operation that can be executed in the source AWS Region. If you supply a value for this operation's SourceRegion parameter, a pre-signed URL will be calculated on your behalf.",
  "EngineVersion": "The version number of the database engine to use. To list all of the available engine versions for aurora (for MySQL 5.6-compatible Aurora), use the following command:  aws rds describe-db-engine-versions --engine aurora --query \"DBEngineVersions[].EngineVersion\"  To list all of the available engine versions for aurora-mysql (for MySQL 5.7-compatible Aurora), use the following command:  aws rds describe-db-engine-versions --engine aurora-mysql --query \"DBEngineVersions[].EngineVersion\"  To list all of the available engine versions for aurora-postgresql, use the following command:  aws rds describe-db-engine-versions --engine aurora-postgresql --query \"DBEngineVersions[].EngineVersion\"   Aurora MySQL  Example: 5.6.10a, 5.6.mysql_aurora.1.19.2, 5.7.12, 5.7.mysql_aurora.2.04.5   Aurora PostgreSQL  Example: 9.6.3, 10.7 ",
  "ScalingConfiguration": "For DB clusters in serverless DB engine mode, the scaling properties of the DB cluster.",
  "EngineMode": "The DB engine mode of the DB cluster, either provisioned, serverless, parallelquery, global, or multimaster. Limitations and requirements apply to some DB engine modes. For more information, see the following sections in the Amazon Aurora User Guide:     Limitations of Aurora Serverless      Limitations of Parallel Query      Requirements for Aurora Global Databases      Limitations of Multi-Master Clusters   ",
  "DBClusterParameterGroupName": " The name of the DB cluster parameter group to associate with this DB cluster. If you do not specify a value, then the default DB cluster parameter group for the specified DB engine and version is used.  Constraints:   If supplied, must match the name of an existing DB cluster parameter group.  ",
  "MasterUserPassword": "The password for the master database user. This password can contain any printable ASCII character except \"/\", \"\"\", or \"@\". Constraints: Must contain from 8 to 41 characters.",
  "Port": "The port number on which the instances in the DB cluster accept connections.  Default: 3306 if engine is set as aurora or 5432 if set to aurora-postgresql. ",
  "EnableCloudwatchLogsExports": "The list of log types that need to be enabled for exporting to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see Publishing Database Logs to Amazon CloudWatch Logs in the Amazon Aurora User Guide.",
  "DeletionProtection": "A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled.",
  "VpcSecurityGroupIds": "A list of EC2 VPC security groups to associate with this DB cluster.",
  "KmsKeyId": "The AWS KMS key identifier for an encrypted DB cluster. The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are creating a DB cluster with the same AWS account that owns the KMS encryption key used to encrypt the new DB cluster, then you can use the KMS key alias instead of the ARN for the KMS encryption key. If an encryption key isn't specified in KmsKeyId:   If ReplicationSourceIdentifier identifies an encrypted source, then Amazon RDS will use the encryption key used to encrypt the source. Otherwise, Amazon RDS will use your default encryption key.    If the StorageEncrypted parameter is enabled and ReplicationSourceIdentifier isn't specified, then Amazon RDS will use your default encryption key.   AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region. If you create a Read Replica of an encrypted DB cluster in another AWS Region, you must set KmsKeyId to a KMS key ID that is valid in the destination AWS Region. This key is used to encrypt the Read Replica in that AWS Region.",
  "GlobalClusterIdentifier": " The global cluster ID of an Aurora cluster that becomes the primary cluster in the new global database cluster. "
}
"""
CreateDBCluster(args) = rds("CreateDBCluster", args)

"""
    CreateDBSubnetGroup()

Creates a new DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs in the AWS Region.

Required Parameters
{
  "DBSubnetGroupName": "The name for the DB subnet group. This value is stored as a lowercase string. Constraints: Must contain no more than 255 letters, numbers, periods, underscores, spaces, or hyphens. Must not be default. Example: mySubnetgroup ",
  "SubnetIds": "The EC2 Subnet IDs for the DB subnet group.",
  "DBSubnetGroupDescription": "The description for the DB subnet group."
}

Optional Parameters
{
  "Tags": "Tags to assign to the DB subnet group."
}
"""
CreateDBSubnetGroup(args) = rds("CreateDBSubnetGroup", args)

"""
    RemoveSourceIdentifierFromSubscription()

Removes a source identifier from an existing RDS event notification subscription.

Required Parameters
{
  "SubscriptionName": "The name of the RDS event notification subscription you want to remove a source identifier from.",
  "SourceIdentifier": " The source identifier to be removed from the subscription, such as the DB instance identifier for a DB instance or the name of a security group. "
}
"""
RemoveSourceIdentifierFromSubscription(args) = rds("RemoveSourceIdentifierFromSubscription", args)

"""
    ImportInstallationMedia()

Imports the installation media for a DB engine that requires an on-premises customer provided license, such as SQL Server.

Required Parameters
{
  "CustomAvailabilityZoneId": "The identifier of the custom Availability Zone (AZ) to import the installation media to.",
  "OSInstallationMediaPath": "The path to the installation medium for the operating system associated with the specified DB engine. Example: WindowsISO/en_windows_server_2016_x64_dvd_9327751.iso ",
  "EngineVersion": "The version number of the database engine to use. For a list of valid engine versions, call DescribeDBEngineVersions. The following are the database engines and links to information about the major and minor versions. The list only includes DB engines that require an on-premises customer provided license.  Microsoft SQL Server  See Version and Feature Support on Amazon RDS in the Amazon RDS User Guide. ",
  "Engine": "The name of the database engine to be used for this instance.  The list only includes supported DB engines that require an on-premises customer provided license.  Valid Values:     sqlserver-ee     sqlserver-se     sqlserver-ex     sqlserver-web   ",
  "EngineInstallationMediaPath": "The path to the installation medium for the specified DB engine. Example: SQLServerISO/en_sql_server_2016_enterprise_x64_dvd_8701793.iso "
}
"""
ImportInstallationMedia(args) = rds("ImportInstallationMedia", args)

"""
    DescribeDBClusterEndpoints()

Returns information about endpoints for an Amazon Aurora DB cluster.  This action only applies to Aurora DB clusters. 

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeDBClusterEndpoints request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "DBClusterIdentifier": "The DB cluster identifier of the DB cluster associated with the endpoint. This parameter is stored as a lowercase string.",
  "DBClusterEndpointIdentifier": "The identifier of the endpoint to describe. This parameter is stored as a lowercase string.",
  "Filters": "A set of name-value pairs that define which endpoints to include in the output. The filters are specified as name-value pairs, in the format Name=endpoint_type,Values=endpoint_type1,endpoint_type2,.... Name can be one of: db-cluster-endpoint-type, db-cluster-endpoint-custom-type, db-cluster-endpoint-id, db-cluster-endpoint-status. Values for the  db-cluster-endpoint-type filter can be one or more of: reader, writer, custom. Values for the db-cluster-endpoint-custom-type filter can be one or more of: reader, any. Values for the db-cluster-endpoint-status filter can be one or more of: available, creating, deleting, modifying. "
}
"""
DescribeDBClusterEndpoints() = rds("DescribeDBClusterEndpoints")
DescribeDBClusterEndpoints(args) = rds("DescribeDBClusterEndpoints", args)

"""
    RevokeDBSecurityGroupIngress()

Revokes ingress from a DBSecurityGroup for previously authorized IP ranges or EC2 or VPC Security Groups. Required parameters for this API are one of CIDRIP, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId).

Required Parameters
{
  "DBSecurityGroupName": "The name of the DB security group to revoke ingress from."
}

Optional Parameters
{
  "CIDRIP": " The IP range to revoke access from. Must be a valid CIDR range. If CIDRIP is specified, EC2SecurityGroupName, EC2SecurityGroupId and EC2SecurityGroupOwnerId can't be provided. ",
  "EC2SecurityGroupOwnerId": " The AWS account number of the owner of the EC2 security group specified in the EC2SecurityGroupName parameter. The AWS access key ID isn't an acceptable value. For VPC DB security groups, EC2SecurityGroupId must be provided. Otherwise, EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId must be provided. ",
  "EC2SecurityGroupName": " The name of the EC2 security group to revoke access from. For VPC DB security groups, EC2SecurityGroupId must be provided. Otherwise, EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId must be provided. ",
  "EC2SecurityGroupId": " The id of the EC2 security group to revoke access from. For VPC DB security groups, EC2SecurityGroupId must be provided. Otherwise, EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId must be provided. "
}
"""
RevokeDBSecurityGroupIngress(args) = rds("RevokeDBSecurityGroupIngress", args)

"""
    CopyDBParameterGroup()

Copies the specified DB parameter group.

Required Parameters
{
  "TargetDBParameterGroupDescription": "A description for the copied DB parameter group.",
  "SourceDBParameterGroupIdentifier": " The identifier or ARN for the source DB parameter group. For information about creating an ARN, see  Constructing an ARN for Amazon RDS in the Amazon RDS User Guide.  Constraints:   Must specify a valid DB parameter group.   Must specify a valid DB parameter group identifier, for example my-db-param-group, or a valid ARN.  ",
  "TargetDBParameterGroupIdentifier": "The identifier for the copied DB parameter group. Constraints:   Can't be null, empty, or blank   Must contain from 1 to 255 letters, numbers, or hyphens   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens   Example: my-db-parameter-group "
}

Optional Parameters
{
  "Tags": ""
}
"""
CopyDBParameterGroup(args) = rds("CopyDBParameterGroup", args)

"""
    DeleteDBInstance()

The DeleteDBInstance action deletes a previously provisioned DB instance. When you delete a DB instance, all automated backups for that instance are deleted and can't be recovered. Manual DB snapshots of the DB instance to be deleted by DeleteDBInstance are not deleted.  If you request a final DB snapshot the status of the Amazon RDS DB instance is deleting until the DB snapshot is created. The API action DescribeDBInstance is used to monitor the status of this operation. The action can't be canceled or reverted once submitted.  When a DB instance is in a failure state and has a status of failed, incompatible-restore, or incompatible-network, you can only delete it when you skip creation of the final snapshot with the SkipFinalSnapshot parameter. If the specified DB instance is part of an Amazon Aurora DB cluster, you can't delete the DB instance if both of the following conditions are true:   The DB cluster is a Read Replica of another Amazon Aurora DB cluster.   The DB instance is the only instance in the DB cluster.   To delete a DB instance in this case, first call the PromoteReadReplicaDBCluster API action to promote the DB cluster so it's no longer a Read Replica. After the promotion completes, then call the DeleteDBInstance API action to delete the final instance in the DB cluster.

Required Parameters
{
  "DBInstanceIdentifier": "The DB instance identifier for the DB instance to be deleted. This parameter isn't case-sensitive. Constraints:   Must match the name of an existing DB instance.  "
}

Optional Parameters
{
  "SkipFinalSnapshot": "A value that indicates whether to skip the creation of a final DB snapshot before the DB instance is deleted. If skip is specified, no DB snapshot is created. If skip isn't specified, a DB snapshot is created before the DB instance is deleted. By default, skip isn't specified, and the DB snapshot is created. When a DB instance is in a failure state and has a status of 'failed', 'incompatible-restore', or 'incompatible-network', it can only be deleted when skip is specified. Specify skip when deleting a Read Replica.  The FinalDBSnapshotIdentifier parameter must be specified if skip isn't specified. ",
  "FinalDBSnapshotIdentifier": " The DBSnapshotIdentifier of the new DBSnapshot created when the SkipFinalSnapshot parameter is disabled.   Specifying this parameter and also specifying to skip final DB snapshot creation in SkipFinalShapshot results in an error.  Constraints:   Must be 1 to 255 letters or numbers.   First character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.   Can't be specified when deleting a Read Replica.  ",
  "DeleteAutomatedBackups": "A value that indicates whether to remove automated backups immediately after the DB instance is deleted. This parameter isn't case-sensitive. The default is to remove automated backups immediately after the DB instance is deleted."
}
"""
DeleteDBInstance(args) = rds("DeleteDBInstance", args)

"""
    DescribeExportTasks()

Returns information about a snapshot export to Amazon S3. This API operation supports pagination. 

Optional Parameters
{
  "SourceArn": "The Amazon Resource Name (ARN) of the snapshot exported to Amazon S3.",
  "Marker": " An optional pagination token provided by a previous DescribeExportTasks request. If you specify this parameter, the response includes only records beyond the marker, up to the value specified by the MaxRecords parameter. ",
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified value, a pagination token called a marker is included in the response. You can use the marker in a later DescribeExportTasks request to retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "ExportTaskIdentifier": "The identifier of the snapshot export task to be described.",
  "Filters": "Filters specify one or more snapshot exports to describe. The filters are specified as name-value pairs that define what to include in the output. Supported filters include the following:     export-task-identifier - An identifier for the snapshot export task.    s3-bucket - The Amazon S3 bucket the snapshot is exported to.    source-arn - The Amazon Resource Name (ARN) of the snapshot exported to Amazon S3    status - The status of the export task.  "
}
"""
DescribeExportTasks() = rds("DescribeExportTasks")
DescribeExportTasks(args) = rds("DescribeExportTasks", args)

"""
    ModifyDBCluster()

Modify a setting for an Amazon Aurora DB cluster. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterIdentifier": "The DB cluster identifier for the cluster being modified. This parameter isn't case-sensitive. Constraints: This identifier must match the identifier of an existing DB cluster."
}

Optional Parameters
{
  "AllowMajorVersionUpgrade": "A value that indicates whether major version upgrades are allowed. Constraints: You must allow major version upgrades when specifying a value for the EngineVersion parameter that is a different major version than the DB cluster's current version.",
  "DBInstanceParameterGroupName": "The name of the DB parameter group to apply to all instances of the DB cluster.   When you apply a parameter group using the DBInstanceParameterGroupName parameter, the DB cluster isn't rebooted automatically. Also, parameter changes aren't applied during the next maintenance window but instead are applied immediately.  Default: The existing name setting Constraints:   The DB parameter group must be in the same DB parameter group family as this DB cluster.   The DBInstanceParameterGroupName parameter is only valid in combination with the AllowMajorVersionUpgrade parameter.  ",
  "OptionGroupName": "A value that indicates that the DB cluster should be associated with the specified option group. Changing this parameter doesn't result in an outage except in the following case, and the change is applied during the next maintenance window unless the ApplyImmediately is enabled for this request. If the parameter change results in an option group that enables OEM, this change can cause a brief (sub-second) period during which new connections are rejected but existing connections are not interrupted.  Permanent options can't be removed from an option group. The option group can't be removed from a DB cluster once it is associated with a DB cluster.",
  "PreferredMaintenanceWindow": "The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC). Format: ddd:hh24:mi-ddd:hh24:mi  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week. To see the time blocks available, see  Adjusting the Preferred DB Cluster Maintenance Window in the Amazon Aurora User Guide.  Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun. Constraints: Minimum 30-minute window.",
  "BackupRetentionPeriod": "The number of days for which automated backups are retained. You must specify a minimum value of 1. Default: 1 Constraints:   Must be a value from 1 to 35  ",
  "BacktrackWindow": "The target backtrack window, in seconds. To disable backtracking, set this value to 0. Default: 0 Constraints:   If specified, this value must be set to a number from 0 to 259,200 (72 hours).  ",
  "EnableIAMDatabaseAuthentication": "A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For more information, see  IAM Database Authentication in the Amazon Aurora User Guide. ",
  "Domain": "The Active Directory directory ID to move the DB cluster to. Specify none to remove the cluster from its current domain. The domain must be created prior to this operation. ",
  "CopyTagsToSnapshot": "A value that indicates whether to copy all tags from the DB cluster to snapshots of the DB cluster. The default is not to copy them.",
  "DomainIAMRoleName": "Specify the name of the IAM role to be used when making API calls to the Directory Service.",
  "PreferredBackupWindow": "The daily time range during which automated backups are created if automated backups are enabled, using the BackupRetentionPeriod parameter.  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region. To see the time blocks available, see  Adjusting the Preferred DB Cluster Maintenance Window in the Amazon Aurora User Guide.  Constraints:   Must be in the format hh24:mi-hh24:mi.   Must be in Universal Coordinated Time (UTC).   Must not conflict with the preferred maintenance window.   Must be at least 30 minutes.  ",
  "EnableHttpEndpoint": "A value that indicates whether to enable the HTTP endpoint for an Aurora Serverless DB cluster. By default, the HTTP endpoint is disabled. When enabled, the HTTP endpoint provides a connectionless web service API for running SQL queries on the Aurora Serverless DB cluster. You can also query your database from inside the RDS console with the query editor. For more information, see Using the Data API for Aurora Serverless in the Amazon Aurora User Guide.",
  "EngineVersion": "The version number of the database engine to which you want to upgrade. Changing this parameter results in an outage. The change is applied during the next maintenance window unless ApplyImmediately is enabled. To list all of the available engine versions for aurora (for MySQL 5.6-compatible Aurora), use the following command:  aws rds describe-db-engine-versions --engine aurora --query \"DBEngineVersions[].EngineVersion\"  To list all of the available engine versions for aurora-mysql (for MySQL 5.7-compatible Aurora), use the following command:  aws rds describe-db-engine-versions --engine aurora-mysql --query \"DBEngineVersions[].EngineVersion\"  To list all of the available engine versions for aurora-postgresql, use the following command:  aws rds describe-db-engine-versions --engine aurora-postgresql --query \"DBEngineVersions[].EngineVersion\" ",
  "ScalingConfiguration": "The scaling properties of the DB cluster. You can only modify scaling properties for DB clusters in serverless DB engine mode.",
  "DBClusterParameterGroupName": "The name of the DB cluster parameter group to use for the DB cluster.",
  "MasterUserPassword": "The new password for the master database user. This password can contain any printable ASCII character except \"/\", \"\"\", or \"@\". Constraints: Must contain from 8 to 41 characters.",
  "Port": "The port number on which the DB cluster accepts connections. Constraints: Value must be 1150-65535  Default: The same port as the original DB cluster.",
  "NewDBClusterIdentifier": "The new DB cluster identifier for the DB cluster when renaming a DB cluster. This value is stored as a lowercase string. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens   The first character must be a letter   Can't end with a hyphen or contain two consecutive hyphens   Example: my-cluster2 ",
  "CloudwatchLogsExportConfiguration": "The configuration setting for the log types to be enabled for export to CloudWatch Logs for a specific DB cluster.",
  "ApplyImmediately": "A value that indicates whether the modifications in this request and any pending modifications are asynchronously applied as soon as possible, regardless of the PreferredMaintenanceWindow setting for the DB cluster. If this parameter is disabled, changes to the DB cluster are applied during the next maintenance window. The ApplyImmediately parameter only affects the EnableIAMDatabaseAuthentication, MasterUserPassword, and NewDBClusterIdentifier values. If the ApplyImmediately parameter is disabled, then changes to the EnableIAMDatabaseAuthentication, MasterUserPassword, and NewDBClusterIdentifier values are applied during the next maintenance window. All other changes are applied immediately, regardless of the value of the ApplyImmediately parameter. By default, this parameter is disabled.",
  "VpcSecurityGroupIds": "A list of VPC security groups that the DB cluster will belong to.",
  "DeletionProtection": "A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. "
}
"""
ModifyDBCluster(args) = rds("ModifyDBCluster", args)

"""
    AuthorizeDBSecurityGroupIngress()

Enables ingress to a DBSecurityGroup using one of two forms of authorization. First, EC2 or VPC security groups can be added to the DBSecurityGroup if the application using the database is running on EC2 or VPC instances. Second, IP ranges are available if the application accessing your database is running on the Internet. Required parameters for this API are one of CIDR range, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId for non-VPC).  You can't authorize ingress from an EC2 security group in one AWS Region to an Amazon RDS DB instance in another. You can't authorize ingress from a VPC security group in one VPC to an Amazon RDS DB instance in another.  For an overview of CIDR ranges, go to the Wikipedia Tutorial. 

Required Parameters
{
  "DBSecurityGroupName": "The name of the DB security group to add authorization to."
}

Optional Parameters
{
  "CIDRIP": "The IP range to authorize.",
  "EC2SecurityGroupOwnerId": " AWS account number of the owner of the EC2 security group specified in the EC2SecurityGroupName parameter. The AWS access key ID isn't an acceptable value. For VPC DB security groups, EC2SecurityGroupId must be provided. Otherwise, EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId must be provided. ",
  "EC2SecurityGroupName": " Name of the EC2 security group to authorize. For VPC DB security groups, EC2SecurityGroupId must be provided. Otherwise, EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId must be provided. ",
  "EC2SecurityGroupId": " Id of the EC2 security group to authorize. For VPC DB security groups, EC2SecurityGroupId must be provided. Otherwise, EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId must be provided. "
}
"""
AuthorizeDBSecurityGroupIngress(args) = rds("AuthorizeDBSecurityGroupIngress", args)

"""
    StopDBInstance()

 Stops an Amazon RDS DB instance. When you stop a DB instance, Amazon RDS retains the DB instance's metadata, including its endpoint, DB parameter group, and option group membership. Amazon RDS also retains the transaction logs so you can do a point-in-time restore if necessary.  For more information, see  Stopping an Amazon RDS DB Instance Temporarily in the Amazon RDS User Guide.    This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora clusters, use StopDBCluster instead.  

Required Parameters
{
  "DBInstanceIdentifier": " The user-supplied instance identifier. "
}

Optional Parameters
{
  "DBSnapshotIdentifier": " The user-supplied instance identifier of the DB Snapshot created immediately before the DB instance is stopped. "
}
"""
StopDBInstance(args) = rds("StopDBInstance", args)

"""
    StartExportTask()

Starts an export of a snapshot to Amazon S3. The provided IAM role must have access to the S3 bucket. 

Required Parameters
{
  "SourceArn": "The Amazon Resource Name (ARN) of the snapshot to export to Amazon S3.",
  "ExportTaskIdentifier": "A unique identifier for the snapshot export task. This ID isn't an identifier for the Amazon S3 bucket where the snapshot is to be exported to. ",
  "S3BucketName": "The name of the Amazon S3 bucket to export the snapshot to.",
  "IamRoleArn": "The name of the IAM role to use for writing to the Amazon S3 bucket when exporting a snapshot. ",
  "KmsKeyId": "The ID of the AWS KMS key to use to encrypt the snapshot exported to Amazon S3. The KMS key ID is the Amazon Resource Name (ARN), the KMS key identifier, or the KMS key alias for the KMS encryption key. The IAM role used for the snapshot export must have encryption and decryption permissions to use this KMS key. "
}

Optional Parameters
{
  "ExportOnly": "The data to be exported from the snapshot. If this parameter is not provided, all the snapshot data is exported. Valid values are the following:    database - Export all the data of the snapshot.    database.table [table-name] - Export a table of the snapshot.    database.schema [schema-name] - Export a database schema of the snapshot. This value isn't valid for RDS for MySQL, RDS for MariaDB, or Aurora MySQL.    database.schema.table [table-name] - Export a table of the database schema. This value isn't valid for RDS for MySQL, RDS for MariaDB, or Aurora MySQL.  ",
  "S3Prefix": "The Amazon S3 bucket prefix to use as the file name and path of the exported snapshot."
}
"""
StartExportTask(args) = rds("StartExportTask", args)

"""
    DeleteInstallationMedia()

Deletes the installation medium for a DB engine that requires an on-premises customer provided license, such as Microsoft SQL Server.

Required Parameters
{
  "InstallationMediaId": "The installation medium ID."
}
"""
DeleteInstallationMedia(args) = rds("DeleteInstallationMedia", args)

"""
    ModifyDBClusterParameterGroup()

 Modifies the parameters of a DB cluster parameter group. To modify more than one parameter, submit a list of the following: ParameterName, ParameterValue, and ApplyMethod. A maximum of 20 parameters can be modified in a single request.  For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   Changes to dynamic parameters are applied immediately. Changes to static parameters require a reboot without failover to the DB cluster associated with the parameter group before the change can take effect.   After you create a DB cluster parameter group, you should wait at least 5 minutes before creating your first DB cluster that uses that DB cluster parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the parameter group is used as the default for a new DB cluster. This is especially important for parameters that are critical when creating the default database for a DB cluster, such as the character set for the default database defined by the character_set_database parameter. You can use the Parameter Groups option of the Amazon RDS console or the DescribeDBClusterParameters action to verify that your DB cluster parameter group has been created or modified. If the modified DB cluster parameter group is used by an Aurora Serverless cluster, Aurora applies the update immediately. The cluster restart might interrupt your workload. In that case, your application must reopen any connections and retry any transactions that were active when the parameter changes took effect.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "Parameters": "A list of parameters in the DB cluster parameter group to modify.",
  "DBClusterParameterGroupName": "The name of the DB cluster parameter group to modify."
}
"""
ModifyDBClusterParameterGroup(args) = rds("ModifyDBClusterParameterGroup", args)

"""
    DescribeDBSnapshots()

Returns information about DB snapshots. This API action supports pagination.

Optional Parameters
{
  "DBInstanceIdentifier": "The ID of the DB instance to retrieve the list of DB snapshots for. This parameter can't be used in conjunction with DBSnapshotIdentifier. This parameter isn't case-sensitive.  Constraints:   If supplied, must match the identifier of an existing DBInstance.  ",
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeDBSnapshots request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "IncludeShared": "A value that indicates whether to include shared manual DB cluster snapshots from other AWS accounts that this AWS account has been given permission to copy or restore. By default, these snapshots are not included. You can give an AWS account permission to restore a manual DB snapshot from another AWS account by using the ModifyDBSnapshotAttribute API action.",
  "IncludePublic": "A value that indicates whether to include manual DB cluster snapshots that are public and can be copied or restored by any AWS account. By default, the public snapshots are not included. You can share a manual DB snapshot as public by using the ModifyDBSnapshotAttribute API.",
  "SnapshotType": "The type of snapshots to be returned. You can specify one of the following values:    automated - Return all DB snapshots that have been automatically taken by Amazon RDS for my AWS account.    manual - Return all DB snapshots that have been taken by my AWS account.    shared - Return all manual DB snapshots that have been shared to my AWS account.    public - Return all DB snapshots that have been marked as public.    awsbackup - Return the DB snapshots managed by the AWS Backup service. For information about AWS Backup, see the  AWS Backup Developer Guide.   The awsbackup type does not apply to Aurora.   If you don't specify a SnapshotType value, then both automated and manual snapshots are returned. Shared and public DB snapshots are not included in the returned results by default. You can include shared snapshots with these results by enabling the IncludeShared parameter. You can include public snapshots with these results by enabling the IncludePublic parameter. The IncludeShared and IncludePublic parameters don't apply for SnapshotType values of manual or automated. The IncludePublic parameter doesn't apply when SnapshotType is set to shared. The IncludeShared parameter doesn't apply when SnapshotType is set to public.",
  "Filters": "A filter that specifies one or more DB snapshots to describe. Supported filters:    db-instance-id - Accepts DB instance identifiers and DB instance Amazon Resource Names (ARNs).    db-snapshot-id - Accepts DB snapshot identifiers.    dbi-resource-id - Accepts identifiers of source DB instances.    snapshot-type - Accepts types of DB snapshots.    engine - Accepts names of database engines.  ",
  "DBSnapshotIdentifier": " A specific DB snapshot identifier to describe. This parameter can't be used in conjunction with DBInstanceIdentifier. This value is stored as a lowercase string.  Constraints:   If supplied, must match the identifier of an existing DBSnapshot.   If this identifier is for an automated snapshot, the SnapshotType parameter must also be specified.  ",
  "DbiResourceId": "A specific DB resource ID to describe."
}
"""
DescribeDBSnapshots() = rds("DescribeDBSnapshots")
DescribeDBSnapshots(args) = rds("DescribeDBSnapshots", args)

"""
    DeleteCustomAvailabilityZone()

Deletes a custom Availability Zone (AZ). A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster. For more information about RDS on VMware, see the  RDS on VMware User Guide.  

Required Parameters
{
  "CustomAvailabilityZoneId": "The custom AZ identifier."
}
"""
DeleteCustomAvailabilityZone(args) = rds("DeleteCustomAvailabilityZone", args)

"""
    RestoreDBClusterToPointInTime()

Restores a DB cluster to an arbitrary point in time. Users can restore to any point in time before LatestRestorableTime for up to BackupRetentionPeriod days. The target DB cluster is created from the source DB cluster with the same configuration as the original DB cluster, except that the new DB cluster is created with the default DB security group.   This action only restores the DB cluster, not the DB instances for that DB cluster. You must invoke the CreateDBInstance action to create DB instances for the restored DB cluster, specifying the identifier of the restored DB cluster in DBClusterIdentifier. You can create DB instances only after the RestoreDBClusterToPointInTime action has completed and the DB cluster is available.  For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterIdentifier": "The name of the new DB cluster to be created. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens  ",
  "SourceDBClusterIdentifier": "The identifier of the source DB cluster from which to restore. Constraints:   Must match the identifier of an existing DBCluster.  "
}

Optional Parameters
{
  "UseLatestRestorableTime": "A value that indicates whether to restore the DB cluster to the latest restorable backup time. By default, the DB cluster isn't restored to the latest restorable backup time.  Constraints: Can't be specified if RestoreToTime parameter is provided.",
  "OptionGroupName": "The name of the option group for the new DB cluster.",
  "DBSubnetGroupName": "The DB subnet group name to use for the new DB cluster. Constraints: If supplied, must match the name of an existing DBSubnetGroup. Example: mySubnetgroup ",
  "Tags": "",
  "BacktrackWindow": "The target backtrack window, in seconds. To disable backtracking, set this value to 0. Default: 0 Constraints:   If specified, this value must be set to a number from 0 to 259,200 (72 hours).  ",
  "EnableIAMDatabaseAuthentication": "A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For more information, see  IAM Database Authentication in the Amazon Aurora User Guide. ",
  "CopyTagsToSnapshot": "A value that indicates whether to copy all tags from the restored DB cluster to snapshots of the restored DB cluster. The default is not to copy them.",
  "Domain": "Specify the Active Directory directory ID to restore the DB cluster in. The domain must be created prior to this operation.   For Amazon Aurora DB clusters, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB cluster. For more information, see Using Kerberos Authentication for Aurora MySQL in the Amazon Aurora User Guide. ",
  "DomainIAMRoleName": "Specify the name of the IAM role to be used when making API calls to the Directory Service.",
  "DBClusterParameterGroupName": "The name of the DB cluster parameter group to associate with this DB cluster. If this argument is omitted, the default DB cluster parameter group for the specified engine is used. Constraints:   If supplied, must match the name of an existing DB cluster parameter group.   Must be 1 to 255 letters, numbers, or hyphens.   First character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.  ",
  "Port": "The port number on which the new DB cluster accepts connections. Constraints: A value from 1150-65535.  Default: The default port for the engine.",
  "EnableCloudwatchLogsExports": "The list of logs that the restored DB cluster is to export to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see Publishing Database Logs to Amazon CloudWatch Logs in the Amazon Aurora User Guide.",
  "DeletionProtection": "A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. ",
  "VpcSecurityGroupIds": "A list of VPC security groups that the new DB cluster belongs to.",
  "KmsKeyId": "The AWS KMS key identifier to use when restoring an encrypted DB cluster from an encrypted DB cluster. The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are restoring a DB cluster with the same AWS account that owns the KMS encryption key used to encrypt the new DB cluster, then you can use the KMS key alias instead of the ARN for the KMS encryption key. You can restore to a new DB cluster and encrypt the new DB cluster with a KMS key that is different than the KMS key used to encrypt the source DB cluster. The new DB cluster is encrypted with the KMS key identified by the KmsKeyId parameter. If you don't specify a value for the KmsKeyId parameter, then the following occurs:   If the DB cluster is encrypted, then the restored DB cluster is encrypted using the KMS key that was used to encrypt the source DB cluster.   If the DB cluster isn't encrypted, then the restored DB cluster isn't encrypted.   If DBClusterIdentifier refers to a DB cluster that isn't encrypted, then the restore request is rejected.",
  "RestoreType": "The type of restore to be performed. You can specify one of the following values:    full-copy - The new DB cluster is restored as a full copy of the source DB cluster.    copy-on-write - The new DB cluster is restored as a clone of the source DB cluster.   Constraints: You can't specify copy-on-write if the engine version of the source DB cluster is earlier than 1.11. If you don't specify a RestoreType value, then the new DB cluster is restored as a full copy of the source DB cluster.",
  "RestoreToTime": "The date and time to restore the DB cluster to. Valid Values: Value must be a time in Universal Coordinated Time (UTC) format Constraints:   Must be before the latest restorable time for the DB instance   Must be specified if UseLatestRestorableTime parameter isn't provided   Can't be specified if the UseLatestRestorableTime parameter is enabled   Can't be specified if the RestoreType parameter is copy-on-write    Example: 2015-03-07T23:45:00Z "
}
"""
RestoreDBClusterToPointInTime(args) = rds("RestoreDBClusterToPointInTime", args)

"""
    DescribeReservedDBInstances()

Returns information about reserved DB instances for this account, or about a specified reserved DB instance.

Optional Parameters
{
  "ProductDescription": "The product description filter value. Specify this parameter to show only those reservations matching the specified product description.",
  "ReservedDBInstancesOfferingId": "The offering identifier filter value. Specify this parameter to show only purchased reservations matching the specified offering identifier.",
  "MaxRecords": " The maximum number of records to include in the response. If more than the MaxRecords value is available, a pagination token called a marker is included in the response so you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Duration": "The duration filter value, specified in years or seconds. Specify this parameter to show only reservations for this duration. Valid Values: 1 | 3 | 31536000 | 94608000 ",
  "OfferingType": "The offering type filter value. Specify this parameter to show only the available offerings matching the specified offering type. Valid Values: \"Partial Upfront\" | \"All Upfront\" | \"No Upfront\"  ",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "DBInstanceClass": "The DB instance class filter value. Specify this parameter to show only those reservations matching the specified DB instances class.",
  "ReservedDBInstanceId": "The reserved DB instance identifier filter value. Specify this parameter to show only the reservation that matches the specified reservation ID.",
  "LeaseId": "The lease identifier filter value. Specify this parameter to show only the reservation that matches the specified lease ID.  AWS Support might request the lease ID for an issue related to a reserved DB instance. ",
  "Filters": "This parameter isn't currently supported.",
  "MultiAZ": "A value that indicates whether to show only those reservations that support Multi-AZ."
}
"""
DescribeReservedDBInstances() = rds("DescribeReservedDBInstances")
DescribeReservedDBInstances(args) = rds("DescribeReservedDBInstances", args)

"""
    CreateDBInstanceReadReplica()

Creates a new DB instance that acts as a Read Replica for an existing source DB instance. You can create a Read Replica for a DB instance running MySQL, MariaDB, Oracle, or PostgreSQL. For more information, see Working with Read Replicas in the Amazon RDS User Guide.  Amazon Aurora doesn't support this action. You must call the CreateDBInstance action to create a DB instance for an Aurora DB cluster.  All Read Replica DB instances are created with backups disabled. All other DB instance attributes (including DB security groups and DB parameter groups) are inherited from the source DB instance, except as specified following.   Your source DB instance must have backup retention enabled.  

Required Parameters
{
  "DBInstanceIdentifier": "The DB instance identifier of the Read Replica. This identifier is the unique key that identifies a DB instance. This parameter is stored as a lowercase string.",
  "SourceDBInstanceIdentifier": "The identifier of the DB instance that will act as the source for the Read Replica. Each DB instance can have up to five Read Replicas. Constraints:   Must be the identifier of an existing MySQL, MariaDB, Oracle, or PostgreSQL DB instance.   Can specify a DB instance that is a MySQL Read Replica only if the source is running MySQL 5.6 or later.   For the limitations of Oracle Read Replicas, see Read Replica Limitations with Oracle in the Amazon RDS User Guide.   Can specify a DB instance that is a PostgreSQL DB instance only if the source is running PostgreSQL 9.3.5 or later (9.4.7 and higher for cross-region replication).   The specified DB instance must have automatic backups enabled, its backup retention period must be greater than 0.   If the source DB instance is in the same AWS Region as the Read Replica, specify a valid DB instance identifier.   If the source DB instance is in a different AWS Region than the Read Replica, specify a valid DB instance ARN. For more information, go to  Constructing an ARN for Amazon RDS in the Amazon RDS User Guide.  "
}

Optional Parameters
{
  "PubliclyAccessible": "A value that indicates whether the DB instance is publicly accessible. When the DB instance is publicly accessible, it is an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address. When the DB instance isn't publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address. For more information, see CreateDBInstance.",
  "PerformanceInsightsKMSKeyId": "The AWS KMS key identifier for encryption of Performance Insights data. The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key. If you do not specify a value for PerformanceInsightsKMSKeyId, then Amazon RDS uses your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.",
  "UseDefaultProcessorFeatures": "A value that indicates whether the DB instance class of the DB instance uses its default processor features.",
  "OptionGroupName": "The option group the DB instance is associated with. If omitted, the option group associated with the source instance is used.",
  "AutoMinorVersionUpgrade": "A value that indicates whether minor engine upgrades are applied automatically to the Read Replica during the maintenance window. Default: Inherits from the source DB instance",
  "MonitoringInterval": "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the Read Replica. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. If MonitoringRoleArn is specified, then you must also set MonitoringInterval to a value other than 0. Valid Values: 0, 1, 5, 10, 15, 30, 60 ",
  "DBSubnetGroupName": "Specifies a DB subnet group for the DB instance. The new DB instance is created in the VPC associated with the DB subnet group. If no DB subnet group is specified, then the new DB instance isn't created in a VPC. Constraints:   Can only be specified if the source DB instance identifier specifies a DB instance in another AWS Region.   If supplied, must match the name of an existing DBSubnetGroup.   The specified DB subnet group must be in the same AWS Region in which the operation is running.   All Read Replicas in one AWS Region that are created from the same source DB instance must either:&gt;   Specify DB subnet groups from the same VPC. All these Read Replicas are created in the same VPC.   Not specify a DB subnet group. All these Read Replicas are created outside of any VPC.     Example: mySubnetgroup ",
  "Tags": "",
  "SourceRegion": "The ID of the region that contains the source for the read replica.",
  "CopyTagsToSnapshot": "A value that indicates whether to copy all tags from the Read Replica to snapshots of the Read Replica. By default, tags are not copied.",
  "EnableIAMDatabaseAuthentication": "A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For information about the supported DB engines, see CreateDBInstance. For more information about IAM database authentication, see  IAM Database Authentication for MySQL and PostgreSQL in the Amazon RDS User Guide. ",
  "Domain": "The Active Directory directory ID to create the DB instance in. For Oracle DB instances, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB instance. For more information, see  Using Kerberos Authentication with Amazon RDS for Oracle in the Amazon RDS User Guide.",
  "DBParameterGroupName": "The name of the DB parameter group to associate with this DB instance. If you do not specify a value for DBParameterGroupName, then Amazon RDS uses the DBParameterGroup of source DB instance for a same region Read Replica, or the default DBParameterGroup for the specified DB engine for a cross region Read Replica.  Currently, specifying a parameter group for this operation is only supported for Oracle DB instances.  Constraints:   Must be 1 to 255 letters, numbers, or hyphens.   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens  ",
  "DomainIAMRoleName": "Specify the name of the IAM role to be used when making API calls to the Directory Service.",
  "PerformanceInsightsRetentionPeriod": "The amount of time, in days, to retain Performance Insights data. Valid values are 7 or 731 (2 years). ",
  "PreSignedUrl": "The URL that contains a Signature Version 4 signed request for the CreateDBInstanceReadReplica API action in the source AWS Region that contains the source DB instance.  You must specify this parameter when you create an encrypted Read Replica from another AWS Region by using the Amazon RDS API. Don't specify PreSignedUrl when you are creating an encrypted Read Replica in the same AWS Region.  The presigned URL must be a valid request for the CreateDBInstanceReadReplica API action that can be executed in the source AWS Region that contains the encrypted source DB instance. The presigned URL request must contain the following parameter values:     DestinationRegion - The AWS Region that the encrypted Read Replica is created in. This AWS Region is the same one where the CreateDBInstanceReadReplica action is called that contains this presigned URL.  For example, if you create an encrypted DB instance in the us-west-1 AWS Region, from a source DB instance in the us-east-2 AWS Region, then you call the CreateDBInstanceReadReplica action in the us-east-1 AWS Region and provide a presigned URL that contains a call to the CreateDBInstanceReadReplica action in the us-west-2 AWS Region. For this example, the DestinationRegion in the presigned URL must be set to the us-east-1 AWS Region.     KmsKeyId - The AWS KMS key identifier for the key to use to encrypt the Read Replica in the destination AWS Region. This is the same identifier for both the CreateDBInstanceReadReplica action that is called in the destination AWS Region, and the action contained in the presigned URL.     SourceDBInstanceIdentifier - The DB instance identifier for the encrypted DB instance to be replicated. This identifier must be in the Amazon Resource Name (ARN) format for the source AWS Region. For example, if you are creating an encrypted Read Replica from a DB instance in the us-west-2 AWS Region, then your SourceDBInstanceIdentifier looks like the following example: arn:aws:rds:us-west-2:123456789012:instance:mysql-instance1-20161115.    To learn how to generate a Signature Version 4 signed request, see Authenticating Requests: Using Query Parameters (AWS Signature Version 4) and Signature Version 4 Signing Process.   If you are using an AWS SDK tool or the AWS CLI, you can specify SourceRegion (or --source-region for the AWS CLI) instead of specifying PreSignedUrl manually. Specifying SourceRegion autogenerates a pre-signed URL that is a valid request for the operation that can be executed in the source AWS Region. If you supply a value for this operation's SourceRegion parameter, a pre-signed URL will be calculated on your behalf.",
  "ProcessorFeatures": "The number of CPU cores and the number of threads per core for the DB instance class of the DB instance.",
  "Iops": "The amount of Provisioned IOPS (input/output operations per second) to be initially allocated for the DB instance.",
  "DBInstanceClass": "The compute and memory capacity of the Read Replica, for example, db.m4.large. Not all DB instance classes are available in all AWS Regions, or for all database engines. For the full list of DB instance classes, and availability for your engine, see DB Instance Class in the Amazon RDS User Guide.  Default: Inherits from the source DB instance.",
  "Port": "The port number that the DB instance uses for connections. Default: Inherits from the source DB instance Valid Values: 1150-65535 ",
  "MonitoringRoleArn": "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to Amazon CloudWatch Logs. For example, arn:aws:iam:123456789012:role/emaccess. For information on creating a monitoring role, go to To create an IAM role for Amazon RDS Enhanced Monitoring in the Amazon RDS User Guide. If MonitoringInterval is set to a value other than 0, then you must supply a MonitoringRoleArn value.",
  "EnableCloudwatchLogsExports": "The list of logs that the new DB instance is to export to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see Publishing Database Logs to Amazon CloudWatch Logs  in the Amazon RDS User Guide.",
  "AvailabilityZone": "The Availability Zone (AZ) where the Read Replica will be created. Default: A random, system-chosen Availability Zone in the endpoint's AWS Region.  Example: us-east-1d ",
  "DeletionProtection": "A value that indicates whether the DB instance has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. For more information, see  Deleting a DB Instance. ",
  "VpcSecurityGroupIds": " A list of EC2 VPC security groups to associate with the Read Replica.   Default: The default EC2 VPC security group for the DB subnet group's VPC. ",
  "StorageType": "Specifies the storage type to be associated with the Read Replica.  Valid values: standard | gp2 | io1   If you specify io1, you must also include a value for the Iops parameter.   Default: io1 if the Iops parameter is specified, otherwise gp2 ",
  "KmsKeyId": "The AWS KMS key ID for an encrypted Read Replica. The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key.  If you create an encrypted Read Replica in the same AWS Region as the source DB instance, then you do not have to specify a value for this parameter. The Read Replica is encrypted with the same KMS key as the source DB instance.  If you create an encrypted Read Replica in a different AWS Region, then you must specify a KMS key for the destination AWS Region. KMS encryption keys are specific to the AWS Region that they are created in, and you can't use encryption keys from one AWS Region in another AWS Region.  You can't create an encrypted Read Replica from an unencrypted DB instance. ",
  "EnablePerformanceInsights": "A value that indicates whether to enable Performance Insights for the Read Replica.  For more information, see Using Amazon Performance Insights in the Amazon RDS User Guide. ",
  "MultiAZ": "A value that indicates whether the Read Replica is in a Multi-AZ deployment.  You can create a Read Replica as a Multi-AZ DB instance. RDS creates a standby of your replica in another Availability Zone for failover support for the replica. Creating your Read Replica as a Multi-AZ DB instance is independent of whether the source database is a Multi-AZ DB instance. "
}
"""
CreateDBInstanceReadReplica(args) = rds("CreateDBInstanceReadReplica", args)

"""
    ListTagsForResource()

Lists all tags on an Amazon RDS resource. For an overview on tagging an Amazon RDS resource, see Tagging Amazon RDS Resources in the Amazon RDS User Guide.

Required Parameters
{
  "ResourceName": "The Amazon RDS resource with tags to be listed. This value is an Amazon Resource Name (ARN). For information about creating an ARN, see  Constructing an ARN for Amazon RDS in the Amazon RDS User Guide."
}

Optional Parameters
{
  "Filters": "This parameter isn't currently supported."
}
"""
ListTagsForResource(args) = rds("ListTagsForResource", args)

"""
    PromoteReadReplicaDBCluster()

Promotes a Read Replica DB cluster to a standalone DB cluster.  This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterIdentifier": "The identifier of the DB cluster Read Replica to promote. This parameter isn't case-sensitive.  Constraints:   Must match the identifier of an existing DBCluster Read Replica.   Example: my-cluster-replica1 "
}
"""
PromoteReadReplicaDBCluster(args) = rds("PromoteReadReplicaDBCluster", args)

"""
    DescribeReservedDBInstancesOfferings()

Lists available reserved DB instance offerings.

Optional Parameters
{
  "ReservedDBInstancesOfferingId": "The offering identifier filter value. Specify this parameter to show only the available offering that matches the specified reservation identifier. Example: 438012d3-4052-4cc7-b2e3-8d3372e0e706 ",
  "MaxRecords": " The maximum number of records to include in the response. If more than the MaxRecords value is available, a pagination token called a marker is included in the response so you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "ProductDescription": "Product description filter value. Specify this parameter to show only the available offerings that contain the specified product description.  The results show offerings that partially match the filter value. ",
  "Duration": "Duration filter value, specified in years or seconds. Specify this parameter to show only reservations for this duration. Valid Values: 1 | 3 | 31536000 | 94608000 ",
  "OfferingType": "The offering type filter value. Specify this parameter to show only the available offerings matching the specified offering type. Valid Values: \"Partial Upfront\" | \"All Upfront\" | \"No Upfront\"  ",
  "Filters": "This parameter isn't currently supported.",
  "DBInstanceClass": "The DB instance class filter value. Specify this parameter to show only the available offerings matching the specified DB instance class.",
  "MultiAZ": "A value that indicates whether to show only those reservations that support Multi-AZ."
}
"""
DescribeReservedDBInstancesOfferings() = rds("DescribeReservedDBInstancesOfferings")
DescribeReservedDBInstancesOfferings(args) = rds("DescribeReservedDBInstancesOfferings", args)

"""
    DescribeDBParameters()

Returns the detailed parameter list for a particular DB parameter group.

Required Parameters
{
  "DBParameterGroupName": "The name of a specific DB parameter group to return details for. Constraints:   If supplied, must match the name of an existing DBParameterGroup.  "
}

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeDBParameters request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "Source": "The parameter types to return. Default: All parameter types returned Valid Values: user | system | engine-default ",
  "Filters": "This parameter isn't currently supported."
}
"""
DescribeDBParameters(args) = rds("DescribeDBParameters", args)

"""
    DescribeDBClusterSnapshotAttributes()

Returns a list of DB cluster snapshot attribute names and values for a manual DB cluster snapshot. When sharing snapshots with other AWS accounts, DescribeDBClusterSnapshotAttributes returns the restore attribute and a list of IDs for the AWS accounts that are authorized to copy or restore the manual DB cluster snapshot. If all is included in the list of values for the restore attribute, then the manual DB cluster snapshot is public and can be copied or restored by all AWS accounts. To add or remove access for an AWS account to copy or restore a manual DB cluster snapshot, or to make the manual DB cluster snapshot public or private, use the ModifyDBClusterSnapshotAttribute API action.  This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterSnapshotIdentifier": "The identifier for the DB cluster snapshot to describe the attributes for."
}
"""
DescribeDBClusterSnapshotAttributes(args) = rds("DescribeDBClusterSnapshotAttributes", args)

"""
    StartActivityStream()

Starts a database activity stream to monitor activity on the database. For more information, see Database Activity Streams in the Amazon Aurora User Guide.

Required Parameters
{
  "Mode": "Specifies the mode of the database activity stream. Database events such as a change or access generate an activity stream event. The database session can handle these events either synchronously or asynchronously. ",
  "ResourceArn": "The Amazon Resource Name (ARN) of the DB cluster, for example arn:aws:rds:us-east-1:12345667890:cluster:das-cluster.",
  "KmsKeyId": "The AWS KMS key identifier for encrypting messages in the database activity stream. The key identifier can be either a key ID, a key ARN, or a key alias."
}

Optional Parameters
{
  "ApplyImmediately": "Specifies whether or not the database activity stream is to start as soon as possible, regardless of the maintenance window for the database."
}
"""
StartActivityStream(args) = rds("StartActivityStream", args)

"""
    CreateDBSecurityGroup()

Creates a new DB security group. DB security groups control access to a DB instance.  A DB security group controls access to EC2-Classic DB instances that are not in a VPC. 

Required Parameters
{
  "DBSecurityGroupDescription": "The description for the DB security group.",
  "DBSecurityGroupName": "The name for the DB security group. This value is stored as a lowercase string. Constraints:   Must be 1 to 255 letters, numbers, or hyphens.   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens   Must not be \"Default\"   Example: mysecuritygroup "
}

Optional Parameters
{
  "Tags": "Tags to assign to the DB security group."
}
"""
CreateDBSecurityGroup(args) = rds("CreateDBSecurityGroup", args)

"""
    DeregisterDBProxyTargets()

 This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.  Remove the association between one or more DBProxyTarget data structures and a DBProxyTargetGroup.

Required Parameters
{
  "DBProxyName": "The identifier of the DBProxy that is associated with the DBProxyTargetGroup."
}

Optional Parameters
{
  "DBInstanceIdentifiers": "One or more DB instance identifiers.",
  "DBClusterIdentifiers": "One or more DB cluster identifiers.",
  "TargetGroupName": "The identifier of the DBProxyTargetGroup."
}
"""
DeregisterDBProxyTargets(args) = rds("DeregisterDBProxyTargets", args)

"""
    DescribeDBLogFiles()

Returns a list of DB log files for the DB instance.

Required Parameters
{
  "DBInstanceIdentifier": "The customer-assigned name of the DB instance that contains the log files you want to list. Constraints:   Must match the identifier of an existing DBInstance.  "
}

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so you can retrieve the remaining results.",
  "Marker": "The pagination token provided in the previous request. If this parameter is specified the response includes only records beyond the marker, up to MaxRecords.",
  "FileSize": "Filters the available log files for files larger than the specified size.",
  "FileLastWritten": "Filters the available log files for files written since the specified date, in POSIX timestamp format with milliseconds.",
  "Filters": "This parameter isn't currently supported.",
  "FilenameContains": "Filters the available log files for log file names that contain the specified string."
}
"""
DescribeDBLogFiles(args) = rds("DescribeDBLogFiles", args)

"""
    DescribeDBProxyTargetGroups()

 This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.  Returns information about DB proxy target groups, represented by DBProxyTargetGroup data structures.

Required Parameters
{
  "DBProxyName": "The identifier of the DBProxy associated with the target group."
}

Optional Parameters
{
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Filters": "This parameter is not currently supported.",
  "TargetGroupName": "The identifier of the DBProxyTargetGroup to describe."
}
"""
DescribeDBProxyTargetGroups(args) = rds("DescribeDBProxyTargetGroups", args)

"""
    DescribeDBInstanceAutomatedBackups()

Displays backups for both current and deleted instances. For example, use this operation to find details about automated backups for previously deleted instances. Current instances with retention periods greater than zero (0) are returned for both the DescribeDBInstanceAutomatedBackups and DescribeDBInstances operations. All parameters are optional.

Optional Parameters
{
  "DBInstanceIdentifier": "(Optional) The user-supplied instance identifier. If this parameter is specified, it must match the identifier of an existing DB instance. It returns information from the specific DB instance' automated backup. This parameter isn't case-sensitive. ",
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.",
  "Marker": "The pagination token provided in the previous request. If this parameter is specified the response includes only records beyond the marker, up to MaxRecords.",
  "Filters": "A filter that specifies which resources to return based on status. Supported filters are the following:    status     active - automated backups for current instances    retained - automated backups for deleted instances    creating - automated backups that are waiting for the first automated snapshot to be available      db-instance-id - Accepts DB instance identifiers and Amazon Resource Names (ARNs) for DB instances. The results list includes only information about the DB instance automated backupss identified by these ARNs.    dbi-resource-id - Accepts DB instance resource identifiers and DB Amazon Resource Names (ARNs) for DB instances. The results list includes only information about the DB instance resources identified by these ARNs.   Returns all resources by default. The status for each resource is specified in the response.",
  "DbiResourceId": "The resource ID of the DB instance that is the source of the automated backup. This parameter isn't case-sensitive. "
}
"""
DescribeDBInstanceAutomatedBackups() = rds("DescribeDBInstanceAutomatedBackups")
DescribeDBInstanceAutomatedBackups(args) = rds("DescribeDBInstanceAutomatedBackups", args)

"""
    DescribeOptionGroups()

Describes the available option groups.

Optional Parameters
{
  "Marker": " An optional pagination token provided by a previous DescribeOptionGroups request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "EngineName": "Filters the list of option groups to only include groups associated with a specific database engine.",
  "OptionGroupName": "The name of the option group to describe. Can't be supplied together with EngineName or MajorEngineVersion.",
  "MajorEngineVersion": "Filters the list of option groups to only include groups associated with a specific database engine version. If specified, then EngineName must also be specified.",
  "Filters": "This parameter isn't currently supported."
}
"""
DescribeOptionGroups() = rds("DescribeOptionGroups")
DescribeOptionGroups(args) = rds("DescribeOptionGroups", args)

"""
    RemoveFromGlobalCluster()

 Detaches an Aurora secondary cluster from an Aurora global database cluster. The cluster becomes a standalone cluster with read-write capability instead of being read-only and receiving data from a primary cluster in a different region.   This action only applies to Aurora DB clusters. 

Optional Parameters
{
  "DbClusterIdentifier": " The Amazon Resource Name (ARN) identifying the cluster that was detached from the Aurora global database cluster. ",
  "GlobalClusterIdentifier": " The cluster identifier to detach from the Aurora global database cluster. "
}
"""
RemoveFromGlobalCluster() = rds("RemoveFromGlobalCluster")
RemoveFromGlobalCluster(args) = rds("RemoveFromGlobalCluster", args)

"""
    ModifyDBClusterSnapshotAttribute()

Adds an attribute and values to, or removes an attribute and values from, a manual DB cluster snapshot. To share a manual DB cluster snapshot with other AWS accounts, specify restore as the AttributeName and use the ValuesToAdd parameter to add a list of IDs of the AWS accounts that are authorized to restore the manual DB cluster snapshot. Use the value all to make the manual DB cluster snapshot public, which means that it can be copied or restored by all AWS accounts. Do not add the all value for any manual DB cluster snapshots that contain private information that you don't want available to all AWS accounts. If a manual DB cluster snapshot is encrypted, it can be shared, but only by specifying a list of authorized AWS account IDs for the ValuesToAdd parameter. You can't use all as a value for that parameter in this case. To view which AWS accounts have access to copy or restore a manual DB cluster snapshot, or whether a manual DB cluster snapshot public or private, use the DescribeDBClusterSnapshotAttributes API action.  This action only applies to Aurora DB clusters. 

Required Parameters
{
  "AttributeName": "The name of the DB cluster snapshot attribute to modify. To manage authorization for other AWS accounts to copy or restore a manual DB cluster snapshot, set this value to restore.",
  "DBClusterSnapshotIdentifier": "The identifier for the DB cluster snapshot to modify the attributes for."
}

Optional Parameters
{
  "ValuesToAdd": "A list of DB cluster snapshot attributes to add to the attribute specified by AttributeName. To authorize other AWS accounts to copy or restore a manual DB cluster snapshot, set this list to include one or more AWS account IDs, or all to make the manual DB cluster snapshot restorable by any AWS account. Do not add the all value for any manual DB cluster snapshots that contain private information that you don't want available to all AWS accounts.",
  "ValuesToRemove": "A list of DB cluster snapshot attributes to remove from the attribute specified by AttributeName. To remove authorization for other AWS accounts to copy or restore a manual DB cluster snapshot, set this list to include one or more AWS account identifiers, or all to remove authorization for any AWS account to copy or restore the DB cluster snapshot. If you specify all, an AWS account whose account ID is explicitly added to the restore attribute can still copy or restore a manual DB cluster snapshot."
}
"""
ModifyDBClusterSnapshotAttribute(args) = rds("ModifyDBClusterSnapshotAttribute", args)

"""
    DescribeGlobalClusters()

 Returns information about Aurora global database clusters. This API supports pagination.   For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeGlobalClusters request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "GlobalClusterIdentifier": " The user-supplied DB cluster identifier. If this parameter is specified, information from only the specific DB cluster is returned. This parameter isn't case-sensitive.  Constraints:   If supplied, must match an existing DBClusterIdentifier.  ",
  "Filters": "A filter that specifies one or more global DB clusters to describe. Supported filters:    db-cluster-id - Accepts DB cluster identifiers and DB cluster Amazon Resource Names (ARNs). The results list will only include information about the DB clusters identified by these ARNs.  "
}
"""
DescribeGlobalClusters() = rds("DescribeGlobalClusters")
DescribeGlobalClusters(args) = rds("DescribeGlobalClusters", args)

"""
    AddTagsToResource()

Adds metadata tags to an Amazon RDS resource. These tags can also be used with cost allocation reporting to track cost associated with Amazon RDS resources, or used in a Condition statement in an IAM policy for Amazon RDS. For an overview on tagging Amazon RDS resources, see Tagging Amazon RDS Resources.

Required Parameters
{
  "Tags": "The tags to be assigned to the Amazon RDS resource.",
  "ResourceName": "The Amazon RDS resource that the tags are added to. This value is an Amazon Resource Name (ARN). For information about creating an ARN, see  Constructing an RDS Amazon Resource Name (ARN)."
}
"""
AddTagsToResource(args) = rds("AddTagsToResource", args)

"""
    AddRoleToDBInstance()

Associates an AWS Identity and Access Management (IAM) role with a DB instance.  To add a role to a DB instance, the status of the DB instance must be available. 

Required Parameters
{
  "DBInstanceIdentifier": "The name of the DB instance to associate the IAM role with.",
  "RoleArn": "The Amazon Resource Name (ARN) of the IAM role to associate with the DB instance, for example arn:aws:iam::123456789012:role/AccessRole. ",
  "FeatureName": "The name of the feature for the DB instance that the IAM role is to be associated with. For the list of supported feature names, see DBEngineVersion. "
}
"""
AddRoleToDBInstance(args) = rds("AddRoleToDBInstance", args)

"""
    DeleteDBSecurityGroup()

Deletes a DB security group.  The specified DB security group must not be associated with any DB instances. 

Required Parameters
{
  "DBSecurityGroupName": "The name of the DB security group to delete.  You can't delete the default DB security group.  Constraints:   Must be 1 to 255 letters, numbers, or hyphens.   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens   Must not be \"Default\"  "
}
"""
DeleteDBSecurityGroup(args) = rds("DeleteDBSecurityGroup", args)

"""
    CreateDBClusterSnapshot()

Creates a snapshot of a DB cluster. For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterSnapshotIdentifier": "The identifier of the DB cluster snapshot. This parameter is stored as a lowercase string. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   First character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.   Example: my-cluster1-snapshot1 ",
  "DBClusterIdentifier": "The identifier of the DB cluster to create a snapshot for. This parameter isn't case-sensitive. Constraints:   Must match the identifier of an existing DBCluster.   Example: my-cluster1 "
}

Optional Parameters
{
  "Tags": "The tags to be assigned to the DB cluster snapshot."
}
"""
CreateDBClusterSnapshot(args) = rds("CreateDBClusterSnapshot", args)

"""
    RemoveTagsFromResource()

Removes metadata tags from an Amazon RDS resource. For an overview on tagging an Amazon RDS resource, see Tagging Amazon RDS Resources in the Amazon RDS User Guide. 

Required Parameters
{
  "ResourceName": "The Amazon RDS resource that the tags are removed from. This value is an Amazon Resource Name (ARN). For information about creating an ARN, see  Constructing an ARN for Amazon RDS in the Amazon RDS User Guide. ",
  "TagKeys": "The tag key (name) of the tag to be removed."
}
"""
RemoveTagsFromResource(args) = rds("RemoveTagsFromResource", args)

"""
    StartDBInstance()

 Starts an Amazon RDS DB instance that was stopped using the AWS console, the stop-db-instance AWS CLI command, or the StopDBInstance action.  For more information, see  Starting an Amazon RDS DB instance That Was Previously Stopped in the Amazon RDS User Guide.    This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora DB clusters, use StartDBCluster instead.  

Required Parameters
{
  "DBInstanceIdentifier": " The user-supplied instance identifier. "
}
"""
StartDBInstance(args) = rds("StartDBInstance", args)

"""
    DescribeDBProxyTargets()

 This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.  Returns information about DBProxyTarget objects. This API supports pagination.

Required Parameters
{
  "DBProxyName": "The identifier of the DBProxyTarget to describe."
}

Optional Parameters
{
  "Marker": " An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Filters": "This parameter is not currently supported.",
  "TargetGroupName": "The identifier of the DBProxyTargetGroup to describe."
}
"""
DescribeDBProxyTargets(args) = rds("DescribeDBProxyTargets", args)

"""
    RebootDBInstance()

You might need to reboot your DB instance, usually for maintenance reasons. For example, if you make certain modifications, or if you change the DB parameter group associated with the DB instance, you must reboot the instance for the changes to take effect.  Rebooting a DB instance restarts the database engine service. Rebooting a DB instance results in a momentary outage, during which the DB instance status is set to rebooting.  For more information about rebooting, see Rebooting a DB Instance in the Amazon RDS User Guide. 

Required Parameters
{
  "DBInstanceIdentifier": "The DB instance identifier. This parameter is stored as a lowercase string. Constraints:   Must match the identifier of an existing DBInstance.  "
}

Optional Parameters
{
  "ForceFailover": " A value that indicates whether the reboot is conducted through a Multi-AZ failover.  Constraint: You can't enable force failover if the instance isn't configured for Multi-AZ."
}
"""
RebootDBInstance(args) = rds("RebootDBInstance", args)

"""
    DescribeSourceRegions()

Returns a list of the source AWS Regions where the current AWS Region can create a Read Replica or copy a DB snapshot from. This API action supports pagination.

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": "An optional pagination token provided by a previous DescribeSourceRegions request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "RegionName": "The source AWS Region name. For example, us-east-1. Constraints:   Must specify a valid AWS Region name.  ",
  "Filters": "This parameter isn't currently supported."
}
"""
DescribeSourceRegions() = rds("DescribeSourceRegions")
DescribeSourceRegions(args) = rds("DescribeSourceRegions", args)

"""
    CopyDBClusterSnapshot()

Copies a snapshot of a DB cluster. To copy a DB cluster snapshot from a shared manual DB cluster snapshot, SourceDBClusterSnapshotIdentifier must be the Amazon Resource Name (ARN) of the shared DB cluster snapshot. You can copy an encrypted DB cluster snapshot from another AWS Region. In that case, the AWS Region where you call the CopyDBClusterSnapshot action is the destination AWS Region for the encrypted DB cluster snapshot to be copied to. To copy an encrypted DB cluster snapshot from another AWS Region, you must provide the following values:    KmsKeyId - The AWS Key Management System (AWS KMS) key identifier for the key to use to encrypt the copy of the DB cluster snapshot in the destination AWS Region.    PreSignedUrl - A URL that contains a Signature Version 4 signed request for the CopyDBClusterSnapshot action to be called in the source AWS Region where the DB cluster snapshot is copied from. The pre-signed URL must be a valid request for the CopyDBClusterSnapshot API action that can be executed in the source AWS Region that contains the encrypted DB cluster snapshot to be copied. The pre-signed URL request must contain the following parameter values:    KmsKeyId - The KMS key identifier for the key to use to encrypt the copy of the DB cluster snapshot in the destination AWS Region. This is the same identifier for both the CopyDBClusterSnapshot action that is called in the destination AWS Region, and the action contained in the pre-signed URL.    DestinationRegion - The name of the AWS Region that the DB cluster snapshot is to be created in.    SourceDBClusterSnapshotIdentifier - The DB cluster snapshot identifier for the encrypted DB cluster snapshot to be copied. This identifier must be in the Amazon Resource Name (ARN) format for the source AWS Region. For example, if you are copying an encrypted DB cluster snapshot from the us-west-2 AWS Region, then your SourceDBClusterSnapshotIdentifier looks like the following example: arn:aws:rds:us-west-2:123456789012:cluster-snapshot:aurora-cluster1-snapshot-20161115.   To learn how to generate a Signature Version 4 signed request, see  Authenticating Requests: Using Query Parameters (AWS Signature Version 4) and  Signature Version 4 Signing Process.  If you are using an AWS SDK tool or the AWS CLI, you can specify SourceRegion (or --source-region for the AWS CLI) instead of specifying PreSignedUrl manually. Specifying SourceRegion autogenerates a pre-signed URL that is a valid request for the operation that can be executed in the source AWS Region.     TargetDBClusterSnapshotIdentifier - The identifier for the new copy of the DB cluster snapshot in the destination AWS Region.    SourceDBClusterSnapshotIdentifier - The DB cluster snapshot identifier for the encrypted DB cluster snapshot to be copied. This identifier must be in the ARN format for the source AWS Region and is the same value as the SourceDBClusterSnapshotIdentifier in the pre-signed URL.    To cancel the copy operation once it is in progress, delete the target DB cluster snapshot identified by TargetDBClusterSnapshotIdentifier while that DB cluster snapshot is in "copying" status. For more information on copying encrypted DB cluster snapshots from one AWS Region to another, see  Copying a Snapshot in the Amazon Aurora User Guide.  For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "TargetDBClusterSnapshotIdentifier": "The identifier of the new DB cluster snapshot to create from the source DB cluster snapshot. This parameter isn't case-sensitive. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   First character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.   Example: my-cluster-snapshot2 ",
  "SourceDBClusterSnapshotIdentifier": "The identifier of the DB cluster snapshot to copy. This parameter isn't case-sensitive. You can't copy an encrypted, shared DB cluster snapshot from one AWS Region to another. Constraints:   Must specify a valid system snapshot in the \"available\" state.   If the source snapshot is in the same AWS Region as the copy, specify a valid DB snapshot identifier.   If the source snapshot is in a different AWS Region than the copy, specify a valid DB cluster snapshot ARN. For more information, go to  Copying Snapshots Across AWS Regions in the Amazon Aurora User Guide.    Example: my-cluster-snapshot1 "
}

Optional Parameters
{
  "Tags": "",
  "SourceRegion": "The ID of the region that contains the snapshot to be copied.",
  "PreSignedUrl": "The URL that contains a Signature Version 4 signed request for the CopyDBClusterSnapshot API action in the AWS Region that contains the source DB cluster snapshot to copy. The PreSignedUrl parameter must be used when copying an encrypted DB cluster snapshot from another AWS Region. Don't specify PreSignedUrl when you are copying an encrypted DB cluster snapshot in the same AWS Region. The pre-signed URL must be a valid request for the CopyDBSClusterSnapshot API action that can be executed in the source AWS Region that contains the encrypted DB cluster snapshot to be copied. The pre-signed URL request must contain the following parameter values:    KmsKeyId - The AWS KMS key identifier for the key to use to encrypt the copy of the DB cluster snapshot in the destination AWS Region. This is the same identifier for both the CopyDBClusterSnapshot action that is called in the destination AWS Region, and the action contained in the pre-signed URL.    DestinationRegion - The name of the AWS Region that the DB cluster snapshot is to be created in.    SourceDBClusterSnapshotIdentifier - The DB cluster snapshot identifier for the encrypted DB cluster snapshot to be copied. This identifier must be in the Amazon Resource Name (ARN) format for the source AWS Region. For example, if you are copying an encrypted DB cluster snapshot from the us-west-2 AWS Region, then your SourceDBClusterSnapshotIdentifier looks like the following example: arn:aws:rds:us-west-2:123456789012:cluster-snapshot:aurora-cluster1-snapshot-20161115.   To learn how to generate a Signature Version 4 signed request, see  Authenticating Requests: Using Query Parameters (AWS Signature Version 4) and  Signature Version 4 Signing Process.  If you are using an AWS SDK tool or the AWS CLI, you can specify SourceRegion (or --source-region for the AWS CLI) instead of specifying PreSignedUrl manually. Specifying SourceRegion autogenerates a pre-signed URL that is a valid request for the operation that can be executed in the source AWS Region. If you supply a value for this operation's SourceRegion parameter, a pre-signed URL will be calculated on your behalf.",
  "CopyTags": "A value that indicates whether to copy all tags from the source DB cluster snapshot to the target DB cluster snapshot. By default, tags are not copied.",
  "KmsKeyId": "The AWS KMS key ID for an encrypted DB cluster snapshot. The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key.  If you copy an encrypted DB cluster snapshot from your AWS account, you can specify a value for KmsKeyId to encrypt the copy with a new KMS encryption key. If you don't specify a value for KmsKeyId, then the copy of the DB cluster snapshot is encrypted with the same KMS key as the source DB cluster snapshot.  If you copy an encrypted DB cluster snapshot that is shared from another AWS account, then you must specify a value for KmsKeyId.  To copy an encrypted DB cluster snapshot to another AWS Region, you must set KmsKeyId to the KMS key ID you want to use to encrypt the copy of the DB cluster snapshot in the destination AWS Region. KMS encryption keys are specific to the AWS Region that they are created in, and you can't use encryption keys from one AWS Region in another AWS Region. If you copy an unencrypted DB cluster snapshot and specify a value for the KmsKeyId parameter, an error is returned."
}
"""
CopyDBClusterSnapshot(args) = rds("CopyDBClusterSnapshot", args)

"""
    DescribeDBSnapshotAttributes()

Returns a list of DB snapshot attribute names and values for a manual DB snapshot. When sharing snapshots with other AWS accounts, DescribeDBSnapshotAttributes returns the restore attribute and a list of IDs for the AWS accounts that are authorized to copy or restore the manual DB snapshot. If all is included in the list of values for the restore attribute, then the manual DB snapshot is public and can be copied or restored by all AWS accounts. To add or remove access for an AWS account to copy or restore a manual DB snapshot, or to make the manual DB snapshot public or private, use the ModifyDBSnapshotAttribute API action.

Required Parameters
{
  "DBSnapshotIdentifier": "The identifier for the DB snapshot to describe the attributes for."
}
"""
DescribeDBSnapshotAttributes(args) = rds("DescribeDBSnapshotAttributes", args)

"""
    DescribeDBSubnetGroups()

Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is specified, the list will contain only the descriptions of the specified DBSubnetGroup. For an overview of CIDR ranges, go to the Wikipedia Tutorial. 

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "DBSubnetGroupName": "The name of the DB subnet group to return details for.",
  "Marker": " An optional pagination token provided by a previous DescribeDBSubnetGroups request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "Filters": "This parameter isn't currently supported."
}
"""
DescribeDBSubnetGroups() = rds("DescribeDBSubnetGroups")
DescribeDBSubnetGroups(args) = rds("DescribeDBSubnetGroups", args)

"""
    ModifyOptionGroup()

Modifies an existing option group.

Required Parameters
{
  "OptionGroupName": "The name of the option group to be modified. Permanent options, such as the TDE option for Oracle Advanced Security TDE, can't be removed from an option group, and that option group can't be removed from a DB instance once it is associated with a DB instance"
}

Optional Parameters
{
  "ApplyImmediately": "A value that indicates whether to apply the change immediately or during the next maintenance window for each instance associated with the option group.",
  "OptionsToInclude": "Options in this list are added to the option group or, if already present, the specified configuration is used to update the existing configuration.",
  "OptionsToRemove": "Options in this list are removed from the option group."
}
"""
ModifyOptionGroup(args) = rds("ModifyOptionGroup", args)

"""
    CreateDBInstance()

Creates a new DB instance.

Required Parameters
{
  "DBInstanceIdentifier": "The DB instance identifier. This parameter is stored as a lowercase string. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   First character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.   Example: mydbinstance ",
  "Engine": "The name of the database engine to be used for this instance.  Not every database engine is available for every AWS Region.  Valid Values:     aurora (for MySQL 5.6-compatible Aurora)    aurora-mysql (for MySQL 5.7-compatible Aurora)    aurora-postgresql     mariadb     mysql     oracle-ee     oracle-se2     oracle-se1     oracle-se     postgres     sqlserver-ee     sqlserver-se     sqlserver-ex     sqlserver-web   ",
  "DBInstanceClass": "The compute and memory capacity of the DB instance, for example, db.m4.large. Not all DB instance classes are available in all AWS Regions, or for all database engines. For the full list of DB instance classes, and availability for your engine, see DB Instance Class in the Amazon RDS User Guide. "
}

Optional Parameters
{
  "PreferredMaintenanceWindow": "The time range each week during which system maintenance can occur, in Universal Coordinated Time (UTC). For more information, see Amazon RDS Maintenance Window.   Format: ddd:hh24:mi-ddd:hh24:mi  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week.  Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun. Constraints: Minimum 30-minute window.",
  "AllocatedStorage": "The amount of storage (in gibibytes) to allocate for the DB instance. Type: Integer  Amazon Aurora  Not applicable. Aurora cluster volumes automatically grow as the amount of data in your database increases, though you are only charged for the space that you use in an Aurora cluster volume.  MySQL  Constraints to the amount of storage for each storage type are the following:    General Purpose (SSD) storage (gp2): Must be an integer from 20 to 65536.   Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.   Magnetic storage (standard): Must be an integer from 5 to 3072.    MariaDB  Constraints to the amount of storage for each storage type are the following:    General Purpose (SSD) storage (gp2): Must be an integer from 20 to 65536.   Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.   Magnetic storage (standard): Must be an integer from 5 to 3072.    PostgreSQL  Constraints to the amount of storage for each storage type are the following:    General Purpose (SSD) storage (gp2): Must be an integer from 20 to 65536.   Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.   Magnetic storage (standard): Must be an integer from 5 to 3072.    Oracle  Constraints to the amount of storage for each storage type are the following:    General Purpose (SSD) storage (gp2): Must be an integer from 20 to 65536.   Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.   Magnetic storage (standard): Must be an integer from 10 to 3072.    SQL Server  Constraints to the amount of storage for each storage type are the following:    General Purpose (SSD) storage (gp2):   Enterprise and Standard editions: Must be an integer from 200 to 16384.   Web and Express editions: Must be an integer from 20 to 16384.     Provisioned IOPS storage (io1):   Enterprise and Standard editions: Must be an integer from 200 to 16384.   Web and Express editions: Must be an integer from 100 to 16384.     Magnetic storage (standard):   Enterprise and Standard editions: Must be an integer from 200 to 1024.   Web and Express editions: Must be an integer from 20 to 1024.    ",
  "StorageEncrypted": "A value that indicates whether the DB instance is encrypted. By default, it isn't encrypted.  Amazon Aurora  Not applicable. The encryption for DB instances is managed by the DB cluster.",
  "CopyTagsToSnapshot": "A value that indicates whether to copy tags from the DB instance to snapshots of the DB instance. By default, tags are not copied.  Amazon Aurora  Not applicable. Copying tags to snapshots is managed by the DB cluster. Setting this value for an Aurora DB instance has no effect on the DB cluster setting.",
  "DomainIAMRoleName": "Specify the name of the IAM role to be used when making API calls to the Directory Service.",
  "Iops": "The amount of Provisioned IOPS (input/output operations per second) to be initially allocated for the DB instance. For information about valid Iops values, see Amazon RDS Provisioned IOPS Storage to Improve Performance in the Amazon RDS User Guide.  Constraints: For MariaDB, MySQL, Oracle, and PostgreSQL DB instances, must be a multiple between .5 and 50 of the storage amount for the DB instance. For SQL Server DB instances, must be a multiple between 1 and 50 of the storage amount for the DB instance. ",
  "AvailabilityZone": " The Availability Zone (AZ) where the database will be created. For information on AWS Regions and Availability Zones, see Regions and Availability Zones.  Default: A random, system-chosen Availability Zone in the endpoint's AWS Region.  Example: us-east-1d   Constraint: The AvailabilityZone parameter can't be specified if the DB instance is a Multi-AZ deployment. The specified Availability Zone must be in the same AWS Region as the current endpoint.   If you're creating a DB instance in an RDS on VMware environment, specify the identifier of the custom Availability Zone to create the DB instance in. For more information about RDS on VMware, see the  RDS on VMware User Guide.   ",
  "EnablePerformanceInsights": "A value that indicates whether to enable Performance Insights for the DB instance.  For more information, see Using Amazon Performance Insights in the Amazon Relational Database Service User Guide. ",
  "PubliclyAccessible": "A value that indicates whether the DB instance is publicly accessible. When the DB instance is publicly accessible, it is an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address. When the DB instance isn't publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address. Default: The default behavior varies depending on whether DBSubnetGroupName is specified. If DBSubnetGroupName isn't specified, and PubliclyAccessible isn't specified, the following applies:   If the default VPC in the target region doesn’t have an Internet gateway attached to it, the DB instance is private.   If the default VPC in the target region has an Internet gateway attached to it, the DB instance is public.   If DBSubnetGroupName is specified, and PubliclyAccessible isn't specified, the following applies:   If the subnets are part of a VPC that doesn’t have an Internet gateway attached to it, the DB instance is private.   If the subnets are part of a VPC that has an Internet gateway attached to it, the DB instance is public.  ",
  "AutoMinorVersionUpgrade": "A value that indicates whether minor engine upgrades are applied automatically to the DB instance during the maintenance window. By default, minor engine upgrades are applied automatically.",
  "BackupRetentionPeriod": "The number of days for which automated backups are retained. Setting this parameter to a positive number enables backups. Setting this parameter to 0 disables automated backups.  Amazon Aurora  Not applicable. The retention period for automated backups is managed by the DB cluster. Default: 1 Constraints:   Must be a value from 0 to 35   Can't be set to 0 if the DB instance is a source to Read Replicas  ",
  "PromotionTier": "A value that specifies the order in which an Aurora Replica is promoted to the primary instance after a failure of the existing primary instance. For more information, see  Fault Tolerance for an Aurora DB Cluster in the Amazon Aurora User Guide.  Default: 1 Valid Values: 0 - 15",
  "DBSubnetGroupName": "A DB subnet group to associate with this DB instance. If there is no DB subnet group, then it is a non-VPC DB instance.",
  "Domain": "The Active Directory directory ID to create the DB instance in. Currently, only Microsoft SQL Server and Oracle DB instances can be created in an Active Directory Domain. For Microsoft SQL Server DB instances, Amazon RDS can use Windows Authentication to authenticate users that connect to the DB instance. For more information, see  Using Windows Authentication with an Amazon RDS DB Instance Running Microsoft SQL Server in the Amazon RDS User Guide. For Oracle DB instance, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB instance. For more information, see  Using Kerberos Authentication with Amazon RDS for Oracle in the Amazon RDS User Guide. ",
  "MasterUsername": "The name for the master user.  Amazon Aurora  Not applicable. The name for the master user is managed by the DB cluster.   MariaDB  Constraints:   Required for MariaDB.   Must be 1 to 16 letters or numbers.   Can't be a reserved word for the chosen database engine.    Microsoft SQL Server  Constraints:   Required for SQL Server.   Must be 1 to 128 letters or numbers.   The first character must be a letter.   Can't be a reserved word for the chosen database engine.    MySQL  Constraints:   Required for MySQL.   Must be 1 to 16 letters or numbers.   First character must be a letter.   Can't be a reserved word for the chosen database engine.    Oracle  Constraints:   Required for Oracle.   Must be 1 to 30 letters or numbers.   First character must be a letter.   Can't be a reserved word for the chosen database engine.    PostgreSQL  Constraints:   Required for PostgreSQL.   Must be 1 to 63 letters or numbers.   First character must be a letter.   Can't be a reserved word for the chosen database engine.  ",
  "MaxAllocatedStorage": "The upper limit to which Amazon RDS can automatically scale the storage of the DB instance.",
  "EngineVersion": "The version number of the database engine to use. For a list of valid engine versions, use the DescribeDBEngineVersions action. The following are the database engines and links to information about the major and minor versions that are available with Amazon RDS. Not every database engine is available for every AWS Region.  Amazon Aurora  Not applicable. The version number of the database engine to be used by the DB instance is managed by the DB cluster.  MariaDB  See MariaDB on Amazon RDS Versions in the Amazon RDS User Guide.   Microsoft SQL Server  See Version and Feature Support on Amazon RDS in the Amazon RDS User Guide.   MySQL  See MySQL on Amazon RDS Versions in the Amazon RDS User Guide.   Oracle  See Oracle Database Engine Release Notes in the Amazon RDS User Guide.   PostgreSQL  See Supported PostgreSQL Database Versions in the Amazon RDS User Guide. ",
  "ProcessorFeatures": "The number of CPU cores and the number of threads per core for the DB instance class of the DB instance.",
  "MonitoringRoleArn": "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to Amazon CloudWatch Logs. For example, arn:aws:iam:123456789012:role/emaccess. For information on creating a monitoring role, go to Setting Up and Enabling Enhanced Monitoring in the Amazon RDS User Guide. If MonitoringInterval is set to a value other than 0, then you must supply a MonitoringRoleArn value.",
  "VpcSecurityGroupIds": "A list of Amazon EC2 VPC security groups to associate with this DB instance.  Amazon Aurora  Not applicable. The associated list of EC2 VPC security groups is managed by the DB cluster. Default: The default EC2 VPC security group for the DB subnet group's VPC.",
  "StorageType": "Specifies the storage type to be associated with the DB instance.  Valid values: standard | gp2 | io1   If you specify io1, you must also include a value for the Iops parameter.   Default: io1 if the Iops parameter is specified, otherwise gp2 ",
  "Timezone": "The time zone of the DB instance. The time zone parameter is currently supported only by Microsoft SQL Server. ",
  "PerformanceInsightsKMSKeyId": "The AWS KMS key identifier for encryption of Performance Insights data. The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key. If you do not specify a value for PerformanceInsightsKMSKeyId, then Amazon RDS uses your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.",
  "OptionGroupName": "Indicates that the DB instance should be associated with the specified option group. Permanent options, such as the TDE option for Oracle Advanced Security TDE, can't be removed from an option group. Also, that option group can't be removed from a DB instance once it is associated with a DB instance",
  "CharacterSetName": "For supported engines, indicates that the DB instance should be associated with the specified CharacterSet.  Amazon Aurora  Not applicable. The character set is managed by the DB cluster. For more information, see CreateDBCluster.",
  "TdeCredentialArn": "The ARN from the key store with which to associate the instance for TDE encryption.",
  "DBSecurityGroups": "A list of DB security groups to associate with this DB instance. Default: The default DB security group for the database engine.",
  "PerformanceInsightsRetentionPeriod": "The amount of time, in days, to retain Performance Insights data. Valid values are 7 or 731 (2 years). ",
  "TdeCredentialPassword": "The password for the given ARN from the key store in order to access the device.",
  "LicenseModel": "License model information for this DB instance.  Valid values: license-included | bring-your-own-license | general-public-license ",
  "EnableCloudwatchLogsExports": "The list of log types that need to be enabled for exporting to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see Publishing Database Logs to Amazon CloudWatch Logs  in the Amazon Relational Database Service User Guide.",
  "DeletionProtection": "A value that indicates whether the DB instance has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. For more information, see  Deleting a DB Instance.   Amazon Aurora  Not applicable. You can enable or disable deletion protection for the DB cluster. For more information, see CreateDBCluster. DB instances in a DB cluster can be deleted even when deletion protection is enabled for the DB cluster. ",
  "DBClusterIdentifier": "The identifier of the DB cluster that the instance will belong to.",
  "KmsKeyId": "The AWS KMS key identifier for an encrypted DB instance. The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are creating a DB instance with the same AWS account that owns the KMS encryption key used to encrypt the new DB instance, then you can use the KMS key alias instead of the ARN for the KM encryption key.  Amazon Aurora  Not applicable. The KMS key identifier is managed by the DB cluster. For more information, see CreateDBCluster. If StorageEncrypted is enabled, and you do not specify a value for the KmsKeyId parameter, then Amazon RDS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.",
  "MonitoringInterval": "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. If MonitoringRoleArn is specified, then you must also set MonitoringInterval to a value other than 0. Valid Values: 0, 1, 5, 10, 15, 30, 60 ",
  "Tags": "Tags to assign to the DB instance.",
  "EnableIAMDatabaseAuthentication": "A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. You can enable IAM database authentication for the following database engines:  Amazon Aurora  Not applicable. Mapping AWS IAM accounts to database accounts is managed by the DB cluster.  MySQL    For MySQL 5.6, minor version 5.6.34 or higher   For MySQL 5.7, minor version 5.7.16 or higher   For MySQL 8.0, minor version 8.0.16 or higher    PostgreSQL    For PostgreSQL 9.5, minor version 9.5.15 or higher   For PostgreSQL 9.6, minor version 9.6.11 or higher   PostgreSQL 10.6, 10.7, and 10.9   For more information, see  IAM Database Authentication for MySQL and PostgreSQL in the Amazon RDS User Guide. ",
  "DBParameterGroupName": "The name of the DB parameter group to associate with this DB instance. If you do not specify a value, then the default DB parameter group for the specified DB engine and version is used. Constraints:   Must be 1 to 255 letters, numbers, or hyphens.   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens  ",
  "PreferredBackupWindow": " The daily time range during which automated backups are created if automated backups are enabled, using the BackupRetentionPeriod parameter. For more information, see The Backup Window in the Amazon RDS User Guide.   Amazon Aurora  Not applicable. The daily time range for creating automated backups is managed by the DB cluster.  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region. To see the time blocks available, see  Adjusting the Preferred DB Instance Maintenance Window in the Amazon RDS User Guide.  Constraints:   Must be in the format hh24:mi-hh24:mi.   Must be in Universal Coordinated Time (UTC).   Must not conflict with the preferred maintenance window.   Must be at least 30 minutes.  ",
  "MasterUserPassword": "The password for the master user. The password can include any printable ASCII character except \"/\", \"\"\", or \"@\".  Amazon Aurora  Not applicable. The password for the master user is managed by the DB cluster.  MariaDB  Constraints: Must contain from 8 to 41 characters.  Microsoft SQL Server  Constraints: Must contain from 8 to 128 characters.  MySQL  Constraints: Must contain from 8 to 41 characters.  Oracle  Constraints: Must contain from 8 to 30 characters.  PostgreSQL  Constraints: Must contain from 8 to 128 characters.",
  "Port": "The port number on which the database accepts connections.  MySQL   Default: 3306   Valid Values: 1150-65535  Type: Integer  MariaDB   Default: 3306   Valid Values: 1150-65535  Type: Integer  PostgreSQL   Default: 5432   Valid Values: 1150-65535  Type: Integer  Oracle   Default: 1521   Valid Values: 1150-65535   SQL Server   Default: 1433   Valid Values: 1150-65535 except for 1434, 3389, 47001, 49152, and 49152 through 49156.   Amazon Aurora   Default: 3306   Valid Values: 1150-65535  Type: Integer",
  "DBName": "The meaning of this parameter differs according to the database engine you use.  MySQL  The name of the database to create when the DB instance is created. If this parameter isn't specified, no database is created in the DB instance. Constraints:   Must contain 1 to 64 letters or numbers.   Can't be a word reserved by the specified database engine    MariaDB  The name of the database to create when the DB instance is created. If this parameter isn't specified, no database is created in the DB instance. Constraints:   Must contain 1 to 64 letters or numbers.   Can't be a word reserved by the specified database engine    PostgreSQL  The name of the database to create when the DB instance is created. If this parameter isn't specified, the default \"postgres\" database is created in the DB instance. Constraints:   Must contain 1 to 63 letters, numbers, or underscores.   Must begin with a letter or an underscore. Subsequent characters can be letters, underscores, or digits (0-9).   Can't be a word reserved by the specified database engine    Oracle  The Oracle System ID (SID) of the created DB instance. If you specify null, the default value ORCL is used. You can't specify the string NULL, or any other reserved word, for DBName.  Default: ORCL  Constraints:   Can't be longer than 8 characters    SQL Server  Not applicable. Must be null.  Amazon Aurora  The name of the database to create when the primary instance of the DB cluster is created. If this parameter isn't specified, no database is created in the DB instance. Constraints:   Must contain 1 to 64 letters or numbers.   Can't be a word reserved by the specified database engine  ",
  "MultiAZ": "A value that indicates whether the DB instance is a Multi-AZ deployment. You can't set the AvailabilityZone parameter if the DB instance is a Multi-AZ deployment."
}
"""
CreateDBInstance(args) = rds("CreateDBInstance", args)

"""
    ModifyCertificates()

Override the system-default Secure Sockets Layer/Transport Layer Security (SSL/TLS) certificate for Amazon RDS for new DB instances temporarily, or remove the override. By using this operation, you can specify an RDS-approved SSL/TLS certificate for new DB instances that is different from the default certificate provided by RDS. You can also use this operation to remove the override, so that new DB instances use the default certificate provided by RDS. You might need to override the default certificate in the following situations:   You already migrated your applications to support the latest certificate authority (CA) certificate, but the new CA certificate is not yet the RDS default CA certificate for the specified AWS Region.   RDS has already moved to a new default CA certificate for the specified AWS Region, but you are still in the process of supporting the new CA certificate. In this case, you temporarily need additional time to finish your application changes.   For more information about rotating your SSL/TLS certificate for RDS DB engines, see  Rotating Your SSL/TLS Certificate in the Amazon RDS User Guide. For more information about rotating your SSL/TLS certificate for Aurora DB engines, see  Rotating Your SSL/TLS Certificate in the Amazon Aurora User Guide.

Optional Parameters
{
  "RemoveCustomerOverride": "A value that indicates whether to remove the override for the default certificate. If the override is removed, the default certificate is the system default.",
  "CertificateIdentifier": "The new default certificate identifier to override the current one with. To determine the valid values, use the describe-certificates AWS CLI command or the DescribeCertificates API operation."
}
"""
ModifyCertificates() = rds("ModifyCertificates")
ModifyCertificates(args) = rds("ModifyCertificates", args)

"""
    ApplyPendingMaintenanceAction()

Applies a pending maintenance action to a resource (for example, to a DB instance).

Required Parameters
{
  "ApplyAction": "The pending maintenance action to apply to this resource. Valid values: system-update, db-upgrade, hardware-maintenance, ca-certificate-rotation ",
  "OptInType": "A value that specifies the type of opt-in request, or undoes an opt-in request. An opt-in request of type immediate can't be undone. Valid values:    immediate - Apply the maintenance action immediately.    next-maintenance - Apply the maintenance action during the next maintenance window for the resource.    undo-opt-in - Cancel any existing next-maintenance opt-in requests.  ",
  "ResourceIdentifier": "The RDS Amazon Resource Name (ARN) of the resource that the pending maintenance action applies to. For information about creating an ARN, see  Constructing an RDS Amazon Resource Name (ARN)."
}
"""
ApplyPendingMaintenanceAction(args) = rds("ApplyPendingMaintenanceAction", args)

"""
    ModifyDBSubnetGroup()

Modifies an existing DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs in the AWS Region.

Required Parameters
{
  "DBSubnetGroupName": "The name for the DB subnet group. This value is stored as a lowercase string. You can't modify the default subnet group.  Constraints: Must match the name of an existing DBSubnetGroup. Must not be default. Example: mySubnetgroup ",
  "SubnetIds": "The EC2 subnet IDs for the DB subnet group."
}

Optional Parameters
{
  "DBSubnetGroupDescription": "The description for the DB subnet group."
}
"""
ModifyDBSubnetGroup(args) = rds("ModifyDBSubnetGroup", args)

"""
    CopyDBSnapshot()

Copies the specified DB snapshot. The source DB snapshot must be in the "available" state. You can copy a snapshot from one AWS Region to another. In that case, the AWS Region where you call the CopyDBSnapshot action is the destination AWS Region for the DB snapshot copy.  For more information about copying snapshots, see Copying a DB Snapshot in the Amazon RDS User Guide. 

Required Parameters
{
  "TargetDBSnapshotIdentifier": "The identifier for the copy of the snapshot.  Constraints:   Can't be null, empty, or blank   Must contain from 1 to 255 letters, numbers, or hyphens   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens   Example: my-db-snapshot ",
  "SourceDBSnapshotIdentifier": "The identifier for the source DB snapshot. If the source snapshot is in the same AWS Region as the copy, specify a valid DB snapshot identifier. For example, you might specify rds:mysql-instance1-snapshot-20130805.  If the source snapshot is in a different AWS Region than the copy, specify a valid DB snapshot ARN. For example, you might specify arn:aws:rds:us-west-2:123456789012:snapshot:mysql-instance1-snapshot-20130805.  If you are copying from a shared manual DB snapshot, this parameter must be the Amazon Resource Name (ARN) of the shared DB snapshot.  If you are copying an encrypted snapshot this parameter must be in the ARN format for the source AWS Region, and must match the SourceDBSnapshotIdentifier in the PreSignedUrl parameter.  Constraints:   Must specify a valid system snapshot in the \"available\" state.   Example: rds:mydb-2012-04-02-00-01  Example: arn:aws:rds:us-west-2:123456789012:snapshot:mysql-instance1-snapshot-20130805 "
}

Optional Parameters
{
  "Tags": "",
  "SourceRegion": "The ID of the region that contains the snapshot to be copied.",
  "PreSignedUrl": "The URL that contains a Signature Version 4 signed request for the CopyDBSnapshot API action in the source AWS Region that contains the source DB snapshot to copy.  You must specify this parameter when you copy an encrypted DB snapshot from another AWS Region by using the Amazon RDS API. Don't specify PreSignedUrl when you are copying an encrypted DB snapshot in the same AWS Region. The presigned URL must be a valid request for the CopyDBSnapshot API action that can be executed in the source AWS Region that contains the encrypted DB snapshot to be copied. The presigned URL request must contain the following parameter values:     DestinationRegion - The AWS Region that the encrypted DB snapshot is copied to. This AWS Region is the same one where the CopyDBSnapshot action is called that contains this presigned URL.  For example, if you copy an encrypted DB snapshot from the us-west-2 AWS Region to the us-east-1 AWS Region, then you call the CopyDBSnapshot action in the us-east-1 AWS Region and provide a presigned URL that contains a call to the CopyDBSnapshot action in the us-west-2 AWS Region. For this example, the DestinationRegion in the presigned URL must be set to the us-east-1 AWS Region.     KmsKeyId - The AWS KMS key identifier for the key to use to encrypt the copy of the DB snapshot in the destination AWS Region. This is the same identifier for both the CopyDBSnapshot action that is called in the destination AWS Region, and the action contained in the presigned URL.     SourceDBSnapshotIdentifier - The DB snapshot identifier for the encrypted snapshot to be copied. This identifier must be in the Amazon Resource Name (ARN) format for the source AWS Region. For example, if you are copying an encrypted DB snapshot from the us-west-2 AWS Region, then your SourceDBSnapshotIdentifier looks like the following example: arn:aws:rds:us-west-2:123456789012:snapshot:mysql-instance1-snapshot-20161115.    To learn how to generate a Signature Version 4 signed request, see Authenticating Requests: Using Query Parameters (AWS Signature Version 4) and Signature Version 4 Signing Process.   If you are using an AWS SDK tool or the AWS CLI, you can specify SourceRegion (or --source-region for the AWS CLI) instead of specifying PreSignedUrl manually. Specifying SourceRegion autogenerates a pre-signed URL that is a valid request for the operation that can be executed in the source AWS Region. If you supply a value for this operation's SourceRegion parameter, a pre-signed URL will be calculated on your behalf.",
  "CopyTags": "A value that indicates whether to copy all tags from the source DB snapshot to the target DB snapshot. By default, tags are not copied.",
  "OptionGroupName": "The name of an option group to associate with the copy of the snapshot. Specify this option if you are copying a snapshot from one AWS Region to another, and your DB instance uses a nondefault option group. If your source DB instance uses Transparent Data Encryption for Oracle or Microsoft SQL Server, you must specify this option when copying across AWS Regions. For more information, see Option Group Considerations in the Amazon RDS User Guide. ",
  "KmsKeyId": "The AWS KMS key ID for an encrypted DB snapshot. The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key.  If you copy an encrypted DB snapshot from your AWS account, you can specify a value for this parameter to encrypt the copy with a new KMS encryption key. If you don't specify a value for this parameter, then the copy of the DB snapshot is encrypted with the same KMS key as the source DB snapshot.  If you copy an encrypted DB snapshot that is shared from another AWS account, then you must specify a value for this parameter.  If you specify this parameter when you copy an unencrypted snapshot, the copy is encrypted.  If you copy an encrypted snapshot to a different AWS Region, then you must specify a KMS key for the destination AWS Region. KMS encryption keys are specific to the AWS Region that they are created in, and you can't use encryption keys from one AWS Region in another AWS Region. "
}
"""
CopyDBSnapshot(args) = rds("CopyDBSnapshot", args)

"""
    DeleteDBSubnetGroup()

Deletes a DB subnet group.  The specified database subnet group must not be associated with any DB instances. 

Required Parameters
{
  "DBSubnetGroupName": "The name of the database subnet group to delete.  You can't delete the default subnet group.  Constraints: Constraints: Must match the name of an existing DBSubnetGroup. Must not be default. Example: mySubnetgroup "
}
"""
DeleteDBSubnetGroup(args) = rds("DeleteDBSubnetGroup", args)

"""
    DeleteDBSnapshot()

Deletes a DB snapshot. If the snapshot is being copied, the copy operation is terminated.  The DB snapshot must be in the available state to be deleted. 

Required Parameters
{
  "DBSnapshotIdentifier": "The DB snapshot identifier. Constraints: Must be the name of an existing DB snapshot in the available state."
}
"""
DeleteDBSnapshot(args) = rds("DeleteDBSnapshot", args)

"""
    ModifyDBProxyTargetGroup()

 This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.  Modifies the properties of a DBProxyTargetGroup.

Required Parameters
{
  "DBProxyName": "The name of the new proxy to which to assign the target group.",
  "TargetGroupName": "The name of the new target group to assign to the proxy."
}

Optional Parameters
{
  "NewName": "The new name for the modified DBProxyTarget. An identifier must begin with a letter and must contain only ASCII letters, digits, and hyphens; it can't end with a hyphen or contain two consecutive hyphens.",
  "ConnectionPoolConfig": "The settings that determine the size and behavior of the connection pool for the target group."
}
"""
ModifyDBProxyTargetGroup(args) = rds("ModifyDBProxyTargetGroup", args)

"""
    DescribeEvents()

Returns events related to DB instances, DB security groups, DB snapshots, and DB parameter groups for the past 14 days. Events specific to a particular DB instance, DB security group, database snapshot, or DB parameter group can be obtained by providing the name as a parameter. By default, the past hour of events are returned.

Optional Parameters
{
  "StartTime": " The beginning of the time interval to retrieve events for, specified in ISO 8601 format. For more information about ISO 8601, go to the ISO8601 Wikipedia page.  Example: 2009-07-08T18:00Z",
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeEvents request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "SourceIdentifier": "The identifier of the event source for which events are returned. If not specified, then all sources are included in the response. Constraints:   If SourceIdentifier is supplied, SourceType must also be provided.   If the source type is DBInstance, then a DBInstanceIdentifier must be supplied.   If the source type is DBSecurityGroup, a DBSecurityGroupName must be supplied.   If the source type is DBParameterGroup, a DBParameterGroupName must be supplied.   If the source type is DBSnapshot, a DBSnapshotIdentifier must be supplied.   Can't end with a hyphen or contain two consecutive hyphens.  ",
  "EndTime": " The end of the time interval for which to retrieve events, specified in ISO 8601 format. For more information about ISO 8601, go to the ISO8601 Wikipedia page.  Example: 2009-07-08T18:00Z",
  "SourceType": "The event source to retrieve events for. If no value is specified, all events are returned.",
  "Duration": "The number of minutes to retrieve events for. Default: 60",
  "Filters": "This parameter isn't currently supported.",
  "EventCategories": "A list of event categories that trigger notifications for a event notification subscription."
}
"""
DescribeEvents() = rds("DescribeEvents")
DescribeEvents(args) = rds("DescribeEvents", args)

"""
    DescribeEngineDefaultParameters()

Returns the default engine and system parameter information for the specified database engine.

Required Parameters
{
  "DBParameterGroupFamily": "The name of the DB parameter group family."
}

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeEngineDefaultParameters request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "Filters": "This parameter isn't currently supported."
}
"""
DescribeEngineDefaultParameters(args) = rds("DescribeEngineDefaultParameters", args)

"""
    DescribeAccountAttributes()

Lists all of the attributes for a customer account. The attributes include Amazon RDS quotas for the account, such as the number of DB instances allowed. The description for a quota includes the quota name, current usage toward that quota, and the quota's maximum value. This command doesn't take any parameters.
"""
DescribeAccountAttributes() = rds("DescribeAccountAttributes")
DescribeAccountAttributes(args) = rds("DescribeAccountAttributes", args)

"""
    CreateDBParameterGroup()

Creates a new DB parameter group.  A DB parameter group is initially created with the default parameters for the database engine used by the DB instance. To provide custom values for any of the parameters, you must modify the group after creating it using ModifyDBParameterGroup. Once you've created a DB parameter group, you need to associate it with your DB instance using ModifyDBInstance. When you associate a new DB parameter group with a running DB instance, you need to reboot the DB instance without failover for the new DB parameter group and associated settings to take effect.   After you create a DB parameter group, you should wait at least 5 minutes before creating your first DB instance that uses that DB parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the parameter group is used as the default for a new DB instance. This is especially important for parameters that are critical when creating the default database for a DB instance, such as the character set for the default database defined by the character_set_database parameter. You can use the Parameter Groups option of the Amazon RDS console or the DescribeDBParameters command to verify that your DB parameter group has been created or modified. 

Required Parameters
{
  "Description": "The description for the DB parameter group.",
  "DBParameterGroupName": "The name of the DB parameter group. Constraints:   Must be 1 to 255 letters, numbers, or hyphens.   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens    This value is stored as a lowercase string. ",
  "DBParameterGroupFamily": "The DB parameter group family name. A DB parameter group can be associated with one and only one DB parameter group family, and can be applied only to a DB instance running a database engine and engine version compatible with that DB parameter group family. To list all of the available parameter group families, use the following command:  aws rds describe-db-engine-versions --query \"DBEngineVersions[].DBParameterGroupFamily\"   The output contains duplicates. "
}

Optional Parameters
{
  "Tags": "Tags to assign to the DB parameter group."
}
"""
CreateDBParameterGroup(args) = rds("CreateDBParameterGroup", args)

"""
    PurchaseReservedDBInstancesOffering()

Purchases a reserved DB instance offering.

Required Parameters
{
  "ReservedDBInstancesOfferingId": "The ID of the Reserved DB instance offering to purchase. Example: 438012d3-4052-4cc7-b2e3-8d3372e0e706"
}

Optional Parameters
{
  "Tags": "",
  "ReservedDBInstanceId": "Customer-specified identifier to track this reservation. Example: myreservationID",
  "DBInstanceCount": "The number of instances to reserve. Default: 1 "
}
"""
PurchaseReservedDBInstancesOffering(args) = rds("PurchaseReservedDBInstancesOffering", args)

"""
    DescribeDBSecurityGroups()

 Returns a list of DBSecurityGroup descriptions. If a DBSecurityGroupName is specified, the list will contain only the descriptions of the specified DB security group. 

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeDBSecurityGroups request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "DBSecurityGroupName": "The name of the DB security group to return details for.",
  "Filters": "This parameter isn't currently supported."
}
"""
DescribeDBSecurityGroups() = rds("DescribeDBSecurityGroups")
DescribeDBSecurityGroups(args) = rds("DescribeDBSecurityGroups", args)

"""
    DescribeEventSubscriptions()

Lists all the subscription descriptions for a customer account. The description for a subscription includes SubscriptionName, SNSTopicARN, CustomerID, SourceType, SourceID, CreationTime, and Status. If you specify a SubscriptionName, lists the description for that subscription.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeOrderableDBInstanceOptions request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords . ",
  "SubscriptionName": "The name of the RDS event notification subscription you want to describe.",
  "Filters": "This parameter isn't currently supported."
}
"""
DescribeEventSubscriptions() = rds("DescribeEventSubscriptions")
DescribeEventSubscriptions(args) = rds("DescribeEventSubscriptions", args)

"""
    ModifyDBInstance()

Modifies settings for a DB instance. You can change one or more database configuration parameters by specifying these parameters and the new values in the request. To learn what modifications you can make to your DB instance, call DescribeValidDBInstanceModifications before you call ModifyDBInstance. 

Required Parameters
{
  "DBInstanceIdentifier": "The DB instance identifier. This value is stored as a lowercase string. Constraints:   Must match the identifier of an existing DBInstance.  "
}

Optional Parameters
{
  "AllowMajorVersionUpgrade": "A value that indicates whether major version upgrades are allowed. Changing this parameter doesn't result in an outage and the change is asynchronously applied as soon as possible. Constraints: Major version upgrades must be allowed when specifying a value for the EngineVersion parameter that is a different major version than the DB instance's current version.",
  "PubliclyAccessible": "A value that indicates whether the DB instance is publicly accessible. When the DB instance is publicly accessible, it is an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address. When the DB instance isn't publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address.   PubliclyAccessible only applies to DB instances in a VPC. The DB instance must be part of a public subnet and PubliclyAccessible must be enabled for it to be publicly accessible.  Changes to the PubliclyAccessible parameter are applied immediately regardless of the value of the ApplyImmediately parameter.",
  "DBPortNumber": "The port number on which the database accepts connections. The value of the DBPortNumber parameter must not match any of the port values specified for options in the option group for the DB instance. Your database will restart when you change the DBPortNumber value regardless of the value of the ApplyImmediately parameter.  MySQL   Default: 3306   Valid Values: 1150-65535   MariaDB   Default: 3306   Valid Values: 1150-65535   PostgreSQL   Default: 5432   Valid Values: 1150-65535  Type: Integer  Oracle   Default: 1521   Valid Values: 1150-65535   SQL Server   Default: 1433   Valid Values: 1150-65535 except for 1434, 3389, 47001, 49152, and 49152 through 49156.   Amazon Aurora   Default: 3306   Valid Values: 1150-65535 ",
  "PerformanceInsightsKMSKeyId": "The AWS KMS key identifier for encryption of Performance Insights data. The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key. If you do not specify a value for PerformanceInsightsKMSKeyId, then Amazon RDS uses your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.",
  "OptionGroupName": " Indicates that the DB instance should be associated with the specified option group. Changing this parameter doesn't result in an outage except in the following case and the change is applied during the next maintenance window unless the ApplyImmediately parameter is enabled for this request. If the parameter change results in an option group that enables OEM, this change can cause a brief (sub-second) period during which new connections are rejected but existing connections are not interrupted.  Permanent options, such as the TDE option for Oracle Advanced Security TDE, can't be removed from an option group, and that option group can't be removed from a DB instance once it is associated with a DB instance",
  "PreferredMaintenanceWindow": "The weekly time range (in UTC) during which system maintenance can occur, which might result in an outage. Changing this parameter doesn't result in an outage, except in the following situation, and the change is asynchronously applied as soon as possible. If there are pending actions that cause a reboot, and the maintenance window is changed to include the current time, then changing this parameter will cause a reboot of the DB instance. If moving this window to the current time, there must be at least 30 minutes between the current time and end of the window to ensure pending changes are applied. Default: Uses existing setting Format: ddd:hh24:mi-ddd:hh24:mi Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun Constraints: Must be at least 30 minutes",
  "UseDefaultProcessorFeatures": "A value that indicates whether the DB instance class of the DB instance uses its default processor features.",
  "AutoMinorVersionUpgrade": " A value that indicates whether minor version upgrades are applied automatically to the DB instance during the maintenance window. Changing this parameter doesn't result in an outage except in the following case and the change is asynchronously applied as soon as possible. An outage results if this parameter is enabled during the maintenance window, and a newer minor version is available, and RDS has enabled auto patching for that engine version. ",
  "BackupRetentionPeriod": "The number of days to retain automated backups. Setting this parameter to a positive number enables backups. Setting this parameter to 0 disables automated backups. Changing this parameter can result in an outage if you change from 0 to a non-zero value or from a non-zero value to 0. These changes are applied during the next maintenance window unless the ApplyImmediately parameter is enabled for this request. If you change the parameter from one non-zero value to another non-zero value, the change is asynchronously applied as soon as possible.  Amazon Aurora  Not applicable. The retention period for automated backups is managed by the DB cluster. For more information, see ModifyDBCluster. Default: Uses existing setting Constraints:   Must be a value from 0 to 35   Can be specified for a MySQL Read Replica only if the source is running MySQL 5.6 or later   Can be specified for a PostgreSQL Read Replica only if the source is running PostgreSQL 9.3.5   Can't be set to 0 if the DB instance is a source to Read Replicas  ",
  "MonitoringInterval": "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. If MonitoringRoleArn is specified, then you must also set MonitoringInterval to a value other than 0. Valid Values: 0, 1, 5, 10, 15, 30, 60 ",
  "AllocatedStorage": "The new amount of storage (in gibibytes) to allocate for the DB instance.  For MariaDB, MySQL, Oracle, and PostgreSQL, the value supplied must be at least 10% greater than the current value. Values that are not at least 10% greater than the existing value are rounded up so that they are 10% greater than the current value.  For the valid values for allocated storage for each engine, see CreateDBInstance. ",
  "PromotionTier": "A value that specifies the order in which an Aurora Replica is promoted to the primary instance after a failure of the existing primary instance. For more information, see  Fault Tolerance for an Aurora DB Cluster in the Amazon Aurora User Guide.  Default: 1 Valid Values: 0 - 15",
  "DBSubnetGroupName": "The new DB subnet group for the DB instance. You can use this parameter to move your DB instance to a different VPC. If your DB instance isn't in a VPC, you can also use this parameter to move your DB instance into a VPC. For more information, see Updating the VPC for a DB Instance in the Amazon RDS User Guide.  Changing the subnet group causes an outage during the change. The change is applied during the next maintenance window, unless you enable ApplyImmediately.  Constraints: If supplied, must match the name of an existing DBSubnetGroup. Example: mySubnetGroup ",
  "TdeCredentialArn": "The ARN from the key store with which to associate the instance for TDE encryption.",
  "DBSecurityGroups": "A list of DB security groups to authorize on this DB instance. Changing this setting doesn't result in an outage and the change is asynchronously applied as soon as possible. Constraints:   If supplied, must match existing DBSecurityGroups.  ",
  "CACertificateIdentifier": "Indicates the certificate that needs to be associated with the instance.",
  "CopyTagsToSnapshot": "A value that indicates whether to copy all tags from the DB instance to snapshots of the DB instance. By default, tags are not copied.  Amazon Aurora  Not applicable. Copying tags to snapshots is managed by the DB cluster. Setting this value for an Aurora DB instance has no effect on the DB cluster setting. For more information, see ModifyDBCluster.",
  "EnableIAMDatabaseAuthentication": "A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For information about the supported DB engines, see CreateDBInstance. For more information about IAM database authentication, see  IAM Database Authentication for MySQL and PostgreSQL in the Amazon RDS User Guide. ",
  "Domain": "The Active Directory directory ID to move the DB instance to. Specify none to remove the instance from its current domain. The domain must be created prior to this operation. Currently, only Microsoft SQL Server and Oracle DB instances can be created in an Active Directory Domain.  For Microsoft SQL Server DB instances, Amazon RDS can use Windows Authentication to authenticate users that connect to the DB instance. For more information, see  Using Windows Authentication with an Amazon RDS DB Instance Running Microsoft SQL Server in the Amazon RDS User Guide. For Oracle DB instances, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB instance. For more information, see  Using Kerberos Authentication with Amazon RDS for Oracle in the Amazon RDS User Guide.",
  "DBParameterGroupName": "The name of the DB parameter group to apply to the DB instance. Changing this setting doesn't result in an outage. The parameter group name itself is changed immediately, but the actual parameter changes are not applied until you reboot the instance without failover. In this case, the DB instance isn't rebooted automatically and the parameter changes isn't applied during the next maintenance window. Default: Uses existing setting Constraints: The DB parameter group must be in the same DB parameter group family as this DB instance.",
  "CertificateRotationRestart": "A value that indicates whether the DB instance is restarted when you rotate your SSL/TLS certificate. By default, the DB instance is restarted when you rotate your SSL/TLS certificate. The certificate is not updated until the DB instance is restarted.  Set this parameter only if you are not using SSL/TLS to connect to the DB instance.  If you are using SSL/TLS to connect to the DB instance, follow the appropriate instructions for your DB engine to rotate your SSL/TLS certificate:   For more information about rotating your SSL/TLS certificate for RDS DB engines, see  Rotating Your SSL/TLS Certificate. in the Amazon RDS User Guide.    For more information about rotating your SSL/TLS certificate for Aurora DB engines, see  Rotating Your SSL/TLS Certificate in the Amazon Aurora User Guide.   ",
  "DomainIAMRoleName": "The name of the IAM role to use when making API calls to the Directory Service.",
  "MaxAllocatedStorage": "The upper limit to which Amazon RDS can automatically scale the storage of the DB instance.",
  "PreferredBackupWindow": " The daily time range during which automated backups are created if automated backups are enabled, as determined by the BackupRetentionPeriod parameter. Changing this parameter doesn't result in an outage and the change is asynchronously applied as soon as possible.   Amazon Aurora  Not applicable. The daily time range for creating automated backups is managed by the DB cluster. For more information, see ModifyDBCluster. Constraints:   Must be in the format hh24:mi-hh24:mi   Must be in Universal Time Coordinated (UTC)   Must not conflict with the preferred maintenance window   Must be at least 30 minutes  ",
  "NewDBInstanceIdentifier": " The new DB instance identifier for the DB instance when renaming a DB instance. When you change the DB instance identifier, an instance reboot occurs immediately if you enable ApplyImmediately, or will occur during the next maintenance window if you disable Apply Immediately. This value is stored as a lowercase string.  Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   The first character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.   Example: mydbinstance ",
  "PerformanceInsightsRetentionPeriod": "The amount of time, in days, to retain Performance Insights data. Valid values are 7 or 731 (2 years). ",
  "TdeCredentialPassword": "The password for the given ARN from the key store in order to access the device.",
  "EngineVersion": " The version number of the database engine to upgrade to. Changing this parameter results in an outage and the change is applied during the next maintenance window unless the ApplyImmediately parameter is eanbled for this request.  For major version upgrades, if a nondefault DB parameter group is currently in use, a new DB parameter group in the DB parameter group family for the new engine version must be specified. The new DB parameter group can be the default for that DB parameter group family. For information about valid engine versions, see CreateDBInstance, or call DescribeDBEngineVersions.",
  "ProcessorFeatures": "The number of CPU cores and the number of threads per core for the DB instance class of the DB instance.",
  "LicenseModel": "The license model for the DB instance. Valid values: license-included | bring-your-own-license | general-public-license ",
  "MasterUserPassword": "The new password for the master user. The password can include any printable ASCII character except \"/\", \"\"\", or \"@\".  Changing this parameter doesn't result in an outage and the change is asynchronously applied as soon as possible. Between the time of the request and the completion of the request, the MasterUserPassword element exists in the PendingModifiedValues element of the operation response.   Amazon Aurora  Not applicable. The password for the master user is managed by the DB cluster. For more information, see ModifyDBCluster.  Default: Uses existing setting  MariaDB  Constraints: Must contain from 8 to 41 characters.  Microsoft SQL Server  Constraints: Must contain from 8 to 128 characters.  MySQL  Constraints: Must contain from 8 to 41 characters.  Oracle  Constraints: Must contain from 8 to 30 characters.  PostgreSQL  Constraints: Must contain from 8 to 128 characters.  Amazon RDS API actions never return the password, so this action provides a way to regain access to a primary instance user if the password is lost. This includes restoring privileges that might have been accidentally revoked.  ",
  "DBInstanceClass": "The new compute and memory capacity of the DB instance, for example, db.m4.large. Not all DB instance classes are available in all AWS Regions, or for all database engines. For the full list of DB instance classes, and availability for your engine, see DB Instance Class in the Amazon RDS User Guide.  If you modify the DB instance class, an outage occurs during the change. The change is applied during the next maintenance window, unless ApplyImmediately is enabled for this request.  Default: Uses existing setting",
  "Iops": "The new Provisioned IOPS (I/O operations per second) value for the RDS instance.  Changing this setting doesn't result in an outage and the change is applied during the next maintenance window unless the ApplyImmediately parameter is enabled for this request. If you are migrating from Provisioned IOPS to standard storage, set this value to 0. The DB instance will require a reboot for the change in storage type to take effect.  If you choose to migrate your DB instance from using standard storage to using Provisioned IOPS, or from using Provisioned IOPS to using standard storage, the process can take time. The duration of the migration depends on several factors such as database load, storage size, storage type (standard or Provisioned IOPS), amount of IOPS provisioned (if any), and the number of prior scale storage operations. Typical migration times are under 24 hours, but the process can take up to several days in some cases. During the migration, the DB instance is available for use, but might experience performance degradation. While the migration takes place, nightly backups for the instance are suspended. No other Amazon RDS operations can take place for the instance, including modifying the instance, rebooting the instance, deleting the instance, creating a Read Replica for the instance, and creating a DB snapshot of the instance.  Constraints: For MariaDB, MySQL, Oracle, and PostgreSQL, the value supplied must be at least 10% greater than the current value. Values that are not at least 10% greater than the existing value are rounded up so that they are 10% greater than the current value.  Default: Uses existing setting",
  "MonitoringRoleArn": "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to Amazon CloudWatch Logs. For example, arn:aws:iam:123456789012:role/emaccess. For information on creating a monitoring role, go to To create an IAM role for Amazon RDS Enhanced Monitoring in the Amazon RDS User Guide.  If MonitoringInterval is set to a value other than 0, then you must supply a MonitoringRoleArn value.",
  "DeletionProtection": "A value that indicates whether the DB instance has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. For more information, see  Deleting a DB Instance. ",
  "CloudwatchLogsExportConfiguration": "The configuration setting for the log types to be enabled for export to CloudWatch Logs for a specific DB instance. A change to the CloudwatchLogsExportConfiguration parameter is always applied to the DB instance immediately. Therefore, the ApplyImmediately parameter has no effect.",
  "ApplyImmediately": "A value that indicates whether the modifications in this request and any pending modifications are asynchronously applied as soon as possible, regardless of the PreferredMaintenanceWindow setting for the DB instance. By default, this parameter is disabled.   If this parameter is disabled, changes to the DB instance are applied during the next maintenance window. Some parameter changes can cause an outage and are applied on the next call to RebootDBInstance, or the next failure reboot. Review the table of parameters in Modifying a DB Instance in the Amazon RDS User Guide. to see the impact of enabling or disabling ApplyImmediately for each modified parameter and to determine when the changes are applied. ",
  "VpcSecurityGroupIds": "A list of EC2 VPC security groups to authorize on this DB instance. This change is asynchronously applied as soon as possible.  Amazon Aurora  Not applicable. The associated list of EC2 VPC security groups is managed by the DB cluster. For more information, see ModifyDBCluster. Constraints:   If supplied, must match existing VpcSecurityGroupIds.  ",
  "StorageType": "Specifies the storage type to be associated with the DB instance.  If you specify Provisioned IOPS (io1), you must also include a value for the Iops parameter.  If you choose to migrate your DB instance from using standard storage to using Provisioned IOPS, or from using Provisioned IOPS to using standard storage, the process can take time. The duration of the migration depends on several factors such as database load, storage size, storage type (standard or Provisioned IOPS), amount of IOPS provisioned (if any), and the number of prior scale storage operations. Typical migration times are under 24 hours, but the process can take up to several days in some cases. During the migration, the DB instance is available for use, but might experience performance degradation. While the migration takes place, nightly backups for the instance are suspended. No other Amazon RDS operations can take place for the instance, including modifying the instance, rebooting the instance, deleting the instance, creating a Read Replica for the instance, and creating a DB snapshot of the instance.   Valid values: standard | gp2 | io1  Default: io1 if the Iops parameter is specified, otherwise gp2 ",
  "EnablePerformanceInsights": "A value that indicates whether to enable Performance Insights for the DB instance. For more information, see Using Amazon Performance Insights in the Amazon Relational Database Service User Guide. ",
  "MultiAZ": "A value that indicates whether the DB instance is a Multi-AZ deployment. Changing this parameter doesn't result in an outage and the change is applied during the next maintenance window unless the ApplyImmediately parameter is enabled for this request. "
}
"""
ModifyDBInstance(args) = rds("ModifyDBInstance", args)

"""
    CancelExportTask()

Cancels an export task in progress that is exporting a snapshot to Amazon S3. Any data that has already been written to the S3 bucket isn't removed. 

Required Parameters
{
  "ExportTaskIdentifier": "The identifier of the snapshot export task to cancel."
}
"""
CancelExportTask(args) = rds("CancelExportTask", args)

"""
    StartDBCluster()

Starts an Amazon Aurora DB cluster that was stopped using the AWS console, the stop-db-cluster AWS CLI command, or the StopDBCluster action. For more information, see  Stopping and Starting an Aurora Cluster in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterIdentifier": "The DB cluster identifier of the Amazon Aurora DB cluster to be started. This parameter is stored as a lowercase string."
}
"""
StartDBCluster(args) = rds("StartDBCluster", args)

"""
    DescribeEngineDefaultClusterParameters()

Returns the default engine and system parameter information for the cluster database engine. For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide. 

Required Parameters
{
  "DBParameterGroupFamily": "The name of the DB cluster parameter group family to return engine parameter information for."
}

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeEngineDefaultClusterParameters request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "Filters": "This parameter isn't currently supported."
}
"""
DescribeEngineDefaultClusterParameters(args) = rds("DescribeEngineDefaultClusterParameters", args)

"""
    ResetDBClusterParameterGroup()

 Modifies the parameters of a DB cluster parameter group to the default value. To reset specific parameters submit a list of the following: ParameterName and ApplyMethod. To reset the entire DB cluster parameter group, specify the DBClusterParameterGroupName and ResetAllParameters parameters.   When resetting the entire group, dynamic parameters are updated immediately and static parameters are set to pending-reboot to take effect on the next DB instance restart or RebootDBInstance request. You must call RebootDBInstance for every DB instance in your DB cluster that you want the updated static parameter to apply to. For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterParameterGroupName": "The name of the DB cluster parameter group to reset."
}

Optional Parameters
{
  "Parameters": "A list of parameter names in the DB cluster parameter group to reset to the default values. You can't use this parameter if the ResetAllParameters parameter is enabled.",
  "ResetAllParameters": "A value that indicates whether to reset all parameters in the DB cluster parameter group to their default values. You can't use this parameter if there is a list of parameter names specified for the Parameters parameter."
}
"""
ResetDBClusterParameterGroup(args) = rds("ResetDBClusterParameterGroup", args)

"""
    ModifyDBProxy()

 This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.  Changes the settings for an existing DB proxy.

Required Parameters
{
  "DBProxyName": "The identifier for the DBProxy to modify."
}

Optional Parameters
{
  "NewDBProxyName": "The new identifier for the DBProxy. An identifier must begin with a letter and must contain only ASCII letters, digits, and hyphens; it can't end with a hyphen or contain two consecutive hyphens.",
  "IdleClientTimeout": "The number of seconds that a connection to the proxy can be inactive before the proxy disconnects it. You can set this value higher or lower than the connection timeout limit for the associated database.",
  "SecurityGroups": "The new list of security groups for the DBProxy.",
  "Auth": "The new authentication settings for the DBProxy.",
  "DebugLogging": "Whether the proxy includes detailed information about SQL statements in its logs. This information helps you to debug issues involving SQL behavior or the performance and scalability of the proxy connections. The debug information includes the text of SQL statements that you submit through the proxy. Thus, only enable this setting when needed for debugging, and only when you have security measures in place to safeguard any sensitive information that appears in the logs.",
  "RequireTLS": "Whether Transport Layer Security (TLS) encryption is required for connections to the proxy. By enabling this setting, you can enforce encrypted TLS connections to the proxy, even if the associated database doesn't use TLS.",
  "RoleArn": "The Amazon Resource Name (ARN) of the IAM role that the proxy uses to access secrets in AWS Secrets Manager."
}
"""
ModifyDBProxy(args) = rds("ModifyDBProxy", args)

"""
    CreateDBClusterParameterGroup()

Creates a new DB cluster parameter group. Parameters in a DB cluster parameter group apply to all of the instances in a DB cluster.  A DB cluster parameter group is initially created with the default parameters for the database engine used by instances in the DB cluster. To provide custom values for any of the parameters, you must modify the group after creating it using ModifyDBClusterParameterGroup. Once you've created a DB cluster parameter group, you need to associate it with your DB cluster using ModifyDBCluster. When you associate a new DB cluster parameter group with a running DB cluster, you need to reboot the DB instances in the DB cluster without failover for the new DB cluster parameter group and associated settings to take effect.   After you create a DB cluster parameter group, you should wait at least 5 minutes before creating your first DB cluster that uses that DB cluster parameter group as the default parameter group. This allows Amazon RDS to fully complete the create action before the DB cluster parameter group is used as the default for a new DB cluster. This is especially important for parameters that are critical when creating the default database for a DB cluster, such as the character set for the default database defined by the character_set_database parameter. You can use the Parameter Groups option of the Amazon RDS console or the DescribeDBClusterParameters action to verify that your DB cluster parameter group has been created or modified.  For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "Description": "The description for the DB cluster parameter group.",
  "DBClusterParameterGroupName": "The name of the DB cluster parameter group. Constraints:   Must match the name of an existing DB cluster parameter group.    This value is stored as a lowercase string. ",
  "DBParameterGroupFamily": "The DB cluster parameter group family name. A DB cluster parameter group can be associated with one and only one DB cluster parameter group family, and can be applied only to a DB cluster running a database engine and engine version compatible with that DB cluster parameter group family.  Aurora MySQL  Example: aurora5.6, aurora-mysql5.7   Aurora PostgreSQL  Example: aurora-postgresql9.6 "
}

Optional Parameters
{
  "Tags": "Tags to assign to the DB cluster parameter group."
}
"""
CreateDBClusterParameterGroup(args) = rds("CreateDBClusterParameterGroup", args)

"""
    RestoreDBClusterFromS3()

Creates an Amazon Aurora DB cluster from data stored in an Amazon S3 bucket. Amazon RDS must be authorized to access the Amazon S3 bucket and the data must be created using the Percona XtraBackup utility as described in  Migrating Data to an Amazon Aurora MySQL DB Cluster in the Amazon Aurora User Guide.  This action only applies to Aurora DB clusters. 

Required Parameters
{
  "SourceEngine": "The identifier for the database engine that was backed up to create the files stored in the Amazon S3 bucket.  Valid values: mysql ",
  "S3BucketName": "The name of the Amazon S3 bucket that contains the data used to create the Amazon Aurora DB cluster.",
  "DBClusterIdentifier": "The name of the DB cluster to create from the source data in the Amazon S3 bucket. This parameter is isn't case-sensitive. Constraints:   Must contain from 1 to 63 letters, numbers, or hyphens.   First character must be a letter.   Can't end with a hyphen or contain two consecutive hyphens.   Example: my-cluster1 ",
  "Engine": "The name of the database engine to be used for the restored DB cluster. Valid Values: aurora, aurora-postgresql ",
  "SourceEngineVersion": "The version of the database that the backup files were created from. MySQL version 5.5 and 5.6 are supported.  Example: 5.6.22 ",
  "MasterUserPassword": "The password for the master database user. This password can contain any printable ASCII character except \"/\", \"\"\", or \"@\". Constraints: Must contain from 8 to 41 characters.",
  "S3IngestionRoleArn": "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes Amazon RDS to access the Amazon S3 bucket on your behalf.",
  "MasterUsername": "The name of the master user for the restored DB cluster. Constraints:   Must be 1 to 16 letters or numbers.   First character must be a letter.   Can't be a reserved word for the chosen database engine.  "
}

Optional Parameters
{
  "DatabaseName": "The database name for the restored DB cluster.",
  "OptionGroupName": "A value that indicates that the restored DB cluster should be associated with the specified option group. Permanent options can't be removed from an option group. An option group can't be removed from a DB cluster once it is associated with a DB cluster.",
  "CharacterSetName": "A value that indicates that the restored DB cluster should be associated with the specified CharacterSet.",
  "PreferredMaintenanceWindow": "The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC). Format: ddd:hh24:mi-ddd:hh24:mi  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week. To see the time blocks available, see  Adjusting the Preferred Maintenance Window in the Amazon Aurora User Guide.  Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun. Constraints: Minimum 30-minute window.",
  "AvailabilityZones": "A list of Availability Zones (AZs) where instances in the restored DB cluster can be created.",
  "BackupRetentionPeriod": "The number of days for which automated backups of the restored DB cluster are retained. You must specify a minimum value of 1. Default: 1 Constraints:   Must be a value from 1 to 35  ",
  "DBSubnetGroupName": "A DB subnet group to associate with the restored DB cluster. Constraints: If supplied, must match the name of an existing DBSubnetGroup.  Example: mySubnetgroup ",
  "Tags": "",
  "StorageEncrypted": "A value that indicates whether the restored DB cluster is encrypted.",
  "BacktrackWindow": "The target backtrack window, in seconds. To disable backtracking, set this value to 0. Default: 0 Constraints:   If specified, this value must be set to a number from 0 to 259,200 (72 hours).  ",
  "EnableIAMDatabaseAuthentication": "A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For more information, see  IAM Database Authentication in the Amazon Aurora User Guide. ",
  "CopyTagsToSnapshot": "A value that indicates whether to copy all tags from the restored DB cluster to snapshots of the restored DB cluster. The default is not to copy them.",
  "Domain": "Specify the Active Directory directory ID to restore the DB cluster in. The domain must be created prior to this operation.   For Amazon Aurora DB clusters, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB cluster. For more information, see Using Kerberos Authentication for Aurora MySQL in the Amazon Aurora User Guide. ",
  "DomainIAMRoleName": "Specify the name of the IAM role to be used when making API calls to the Directory Service.",
  "PreferredBackupWindow": "The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter.  The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region. To see the time blocks available, see  Adjusting the Preferred Maintenance Window in the Amazon Aurora User Guide.  Constraints:   Must be in the format hh24:mi-hh24:mi.   Must be in Universal Coordinated Time (UTC).   Must not conflict with the preferred maintenance window.   Must be at least 30 minutes.  ",
  "EngineVersion": "The version number of the database engine to use. To list all of the available engine versions for aurora (for MySQL 5.6-compatible Aurora), use the following command:  aws rds describe-db-engine-versions --engine aurora --query \"DBEngineVersions[].EngineVersion\"  To list all of the available engine versions for aurora-mysql (for MySQL 5.7-compatible Aurora), use the following command:  aws rds describe-db-engine-versions --engine aurora-mysql --query \"DBEngineVersions[].EngineVersion\"  To list all of the available engine versions for aurora-postgresql, use the following command:  aws rds describe-db-engine-versions --engine aurora-postgresql --query \"DBEngineVersions[].EngineVersion\"   Aurora MySQL  Example: 5.6.10a, 5.6.mysql_aurora.1.19.2, 5.7.12, 5.7.mysql_aurora.2.04.5   Aurora PostgreSQL  Example: 9.6.3, 10.7 ",
  "DBClusterParameterGroupName": "The name of the DB cluster parameter group to associate with the restored DB cluster. If this argument is omitted, default.aurora5.6 is used.  Constraints:   If supplied, must match the name of an existing DBClusterParameterGroup.  ",
  "S3Prefix": "The prefix for all of the file names that contain the data used to create the Amazon Aurora DB cluster. If you do not specify a SourceS3Prefix value, then the Amazon Aurora DB cluster is created by using all of the files in the Amazon S3 bucket.",
  "Port": "The port number on which the instances in the restored DB cluster accept connections.  Default: 3306 ",
  "EnableCloudwatchLogsExports": "The list of logs that the restored DB cluster is to export to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see Publishing Database Logs to Amazon CloudWatch Logs in the Amazon Aurora User Guide.",
  "DeletionProtection": "A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. ",
  "VpcSecurityGroupIds": "A list of EC2 VPC security groups to associate with the restored DB cluster.",
  "KmsKeyId": "The AWS KMS key identifier for an encrypted DB cluster. The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are creating a DB cluster with the same AWS account that owns the KMS encryption key used to encrypt the new DB cluster, then you can use the KMS key alias instead of the ARN for the KM encryption key. If the StorageEncrypted parameter is enabled, and you do not specify a value for the KmsKeyId parameter, then Amazon RDS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region."
}
"""
RestoreDBClusterFromS3(args) = rds("RestoreDBClusterFromS3", args)

"""
    AddSourceIdentifierToSubscription()

Adds a source identifier to an existing RDS event notification subscription.

Required Parameters
{
  "SubscriptionName": "The name of the RDS event notification subscription you want to add a source identifier to.",
  "SourceIdentifier": "The identifier of the event source to be added. Constraints:   If the source type is a DB instance, then a DBInstanceIdentifier must be supplied.   If the source type is a DB security group, a DBSecurityGroupName must be supplied.   If the source type is a DB parameter group, a DBParameterGroupName must be supplied.   If the source type is a DB snapshot, a DBSnapshotIdentifier must be supplied.  "
}
"""
AddSourceIdentifierToSubscription(args) = rds("AddSourceIdentifierToSubscription", args)

"""
    CreateDBProxy()

 This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.  Creates a new DB proxy.

Required Parameters
{
  "DBProxyName": "The identifier for the proxy. This name must be unique for all proxies owned by your AWS account in the specified AWS Region. An identifier must begin with a letter and must contain only ASCII letters, digits, and hyphens; it can't end with a hyphen or contain two consecutive hyphens.",
  "VpcSubnetIds": "One or more VPC subnet IDs to associate with the new proxy.",
  "Auth": "The authorization mechanism that the proxy uses.",
  "EngineFamily": "The kinds of databases that the proxy can connect to. This value determines which database network protocol the proxy recognizes when it interprets network traffic to and from the database. Currently, this value is always MYSQL. The engine family applies to both RDS MySQL and Aurora MySQL.",
  "RoleArn": "The Amazon Resource Name (ARN) of the IAM role that the proxy uses to access secrets in AWS Secrets Manager."
}

Optional Parameters
{
  "Tags": "An optional set of key-value pairs to associate arbitrary data of your choosing with the proxy.",
  "IdleClientTimeout": "The number of seconds that a connection to the proxy can be inactive before the proxy disconnects it. You can set this value higher or lower than the connection timeout limit for the associated database.",
  "VpcSecurityGroupIds": "One or more VPC security group IDs to associate with the new proxy.",
  "DebugLogging": "Whether the proxy includes detailed information about SQL statements in its logs. This information helps you to debug issues involving SQL behavior or the performance and scalability of the proxy connections. The debug information includes the text of SQL statements that you submit through the proxy. Thus, only enable this setting when needed for debugging, and only when you have security measures in place to safeguard any sensitive information that appears in the logs.",
  "RequireTLS": "A Boolean parameter that specifies whether Transport Layer Security (TLS) encryption is required for connections to the proxy. By enabling this setting, you can enforce encrypted TLS connections to the proxy."
}
"""
CreateDBProxy(args) = rds("CreateDBProxy", args)

"""
    DeleteDBParameterGroup()

Deletes a specified DB parameter group. The DB parameter group to be deleted can't be associated with any DB instances.

Required Parameters
{
  "DBParameterGroupName": "The name of the DB parameter group. Constraints:   Must be the name of an existing DB parameter group   You can't delete a default DB parameter group   Can't be associated with any DB instances  "
}
"""
DeleteDBParameterGroup(args) = rds("DeleteDBParameterGroup", args)

"""
    DeleteDBProxy()

 This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.  Deletes an existing proxy.

Required Parameters
{
  "DBProxyName": "The name of the DB proxy to delete."
}
"""
DeleteDBProxy(args) = rds("DeleteDBProxy", args)

"""
    DescribeCertificates()

Lists the set of CA certificates provided by Amazon RDS for this AWS account.

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeCertificates request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "Filters": "This parameter isn't currently supported.",
  "CertificateIdentifier": "The user-supplied certificate identifier. If this parameter is specified, information for only the identified certificate is returned. This parameter isn't case-sensitive. Constraints:   Must match an existing CertificateIdentifier.  "
}
"""
DescribeCertificates() = rds("DescribeCertificates")
DescribeCertificates(args) = rds("DescribeCertificates", args)

"""
    DescribeDBClusters()

Returns information about provisioned Aurora DB clusters. This API supports pagination. For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This operation can also return information for Amazon Neptune DB instances and Amazon DocumentDB instances. 

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": "An optional pagination token provided by a previous DescribeDBClusters request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "IncludeShared": "Optional Boolean parameter that specifies whether the output includes information about clusters shared from other AWS accounts.",
  "DBClusterIdentifier": "The user-supplied DB cluster identifier. If this parameter is specified, information from only the specific DB cluster is returned. This parameter isn't case-sensitive. Constraints:   If supplied, must match an existing DBClusterIdentifier.  ",
  "Filters": "A filter that specifies one or more DB clusters to describe. Supported filters:    db-cluster-id - Accepts DB cluster identifiers and DB cluster Amazon Resource Names (ARNs). The results list will only include information about the DB clusters identified by these ARNs.  "
}
"""
DescribeDBClusters() = rds("DescribeDBClusters")
DescribeDBClusters(args) = rds("DescribeDBClusters", args)

"""
    ModifyCurrentDBClusterCapacity()

Set the capacity of an Aurora Serverless DB cluster to a specific value. Aurora Serverless scales seamlessly based on the workload on the DB cluster. In some cases, the capacity might not scale fast enough to meet a sudden change in workload, such as a large number of new transactions. Call ModifyCurrentDBClusterCapacity to set the capacity explicitly. After this call sets the DB cluster capacity, Aurora Serverless can automatically scale the DB cluster based on the cooldown period for scaling up and the cooldown period for scaling down. For more information about Aurora Serverless, see Using Amazon Aurora Serverless in the Amazon Aurora User Guide.  If you call ModifyCurrentDBClusterCapacity with the default TimeoutAction, connections that prevent Aurora Serverless from finding a scaling point might be dropped. For more information about scaling points, see  Autoscaling for Aurora Serverless in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Required Parameters
{
  "DBClusterIdentifier": "The DB cluster identifier for the cluster being modified. This parameter isn't case-sensitive. Constraints:   Must match the identifier of an existing DB cluster.  "
}

Optional Parameters
{
  "TimeoutAction": "The action to take when the timeout is reached, either ForceApplyCapacityChange or RollbackCapacityChange.  ForceApplyCapacityChange, the default, sets the capacity to the specified value as soon as possible.  RollbackCapacityChange ignores the capacity change if a scaling point isn't found in the timeout period.",
  "SecondsBeforeTimeout": "The amount of time, in seconds, that Aurora Serverless tries to find a scaling point to perform seamless scaling before enforcing the timeout action. The default is 300.   Value must be from 10 through 600.  ",
  "Capacity": "The DB cluster capacity. When you change the capacity of a paused Aurora Serverless DB cluster, it automatically resumes. Constraints:   For Aurora MySQL, valid capacity values are 1, 2, 4, 8, 16, 32, 64, 128, and 256.   For Aurora PostgreSQL, valid capacity values are 2, 4, 8, 16, 32, 64, 192, and 384.  "
}
"""
ModifyCurrentDBClusterCapacity(args) = rds("ModifyCurrentDBClusterCapacity", args)

"""
    DescribeDBClusterSnapshots()

Returns information about DB cluster snapshots. This API action supports pagination. For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": "An optional pagination token provided by a previous DescribeDBClusterSnapshots request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "IncludeShared": "A value that indicates whether to include shared manual DB cluster snapshots from other AWS accounts that this AWS account has been given permission to copy or restore. By default, these snapshots are not included. You can give an AWS account permission to restore a manual DB cluster snapshot from another AWS account by the ModifyDBClusterSnapshotAttribute API action.",
  "DBClusterSnapshotIdentifier": "A specific DB cluster snapshot identifier to describe. This parameter can't be used in conjunction with the DBClusterIdentifier parameter. This value is stored as a lowercase string.  Constraints:   If supplied, must match the identifier of an existing DBClusterSnapshot.   If this identifier is for an automated snapshot, the SnapshotType parameter must also be specified.  ",
  "DBClusterIdentifier": "The ID of the DB cluster to retrieve the list of DB cluster snapshots for. This parameter can't be used in conjunction with the DBClusterSnapshotIdentifier parameter. This parameter isn't case-sensitive.  Constraints:   If supplied, must match the identifier of an existing DBCluster.  ",
  "SnapshotType": "The type of DB cluster snapshots to be returned. You can specify one of the following values:    automated - Return all DB cluster snapshots that have been automatically taken by Amazon RDS for my AWS account.    manual - Return all DB cluster snapshots that have been taken by my AWS account.    shared - Return all manual DB cluster snapshots that have been shared to my AWS account.    public - Return all DB cluster snapshots that have been marked as public.   If you don't specify a SnapshotType value, then both automated and manual DB cluster snapshots are returned. You can include shared DB cluster snapshots with these results by enabling the IncludeShared parameter. You can include public DB cluster snapshots with these results by enabling the IncludePublic parameter. The IncludeShared and IncludePublic parameters don't apply for SnapshotType values of manual or automated. The IncludePublic parameter doesn't apply when SnapshotType is set to shared. The IncludeShared parameter doesn't apply when SnapshotType is set to public.",
  "Filters": "A filter that specifies one or more DB cluster snapshots to describe. Supported filters:    db-cluster-id - Accepts DB cluster identifiers and DB cluster Amazon Resource Names (ARNs).    db-cluster-snapshot-id - Accepts DB cluster snapshot identifiers.    snapshot-type - Accepts types of DB cluster snapshots.    engine - Accepts names of database engines.  ",
  "IncludePublic": "A value that indicates whether to include manual DB cluster snapshots that are public and can be copied or restored by any AWS account. By default, the public snapshots are not included. You can share a manual DB cluster snapshot as public by using the ModifyDBClusterSnapshotAttribute API action."
}
"""
DescribeDBClusterSnapshots() = rds("DescribeDBClusterSnapshots")
DescribeDBClusterSnapshots(args) = rds("DescribeDBClusterSnapshots", args)

"""
    CopyOptionGroup()

Copies the specified option group.

Required Parameters
{
  "TargetOptionGroupDescription": "The description for the copied option group.",
  "SourceOptionGroupIdentifier": "The identifier or ARN for the source option group. For information about creating an ARN, see  Constructing an ARN for Amazon RDS in the Amazon RDS User Guide.  Constraints:   Must specify a valid option group.   If the source option group is in the same AWS Region as the copy, specify a valid option group identifier, for example my-option-group, or a valid ARN.   If the source option group is in a different AWS Region than the copy, specify a valid option group ARN, for example arn:aws:rds:us-west-2:123456789012:og:special-options.  ",
  "TargetOptionGroupIdentifier": "The identifier for the copied option group. Constraints:   Can't be null, empty, or blank   Must contain from 1 to 255 letters, numbers, or hyphens   First character must be a letter   Can't end with a hyphen or contain two consecutive hyphens   Example: my-option-group "
}

Optional Parameters
{
  "Tags": ""
}
"""
CopyOptionGroup(args) = rds("CopyOptionGroup", args)

"""
    DescribeCustomAvailabilityZones()

Returns information about custom Availability Zones (AZs). A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster. For more information about RDS on VMware, see the  RDS on VMware User Guide.  

Optional Parameters
{
  "MaxRecords": "The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so you can retrieve the remaining results. Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": "An optional pagination token provided by a previous DescribeCustomAvailabilityZones request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords.",
  "CustomAvailabilityZoneId": "The custom AZ identifier. If this parameter is specified, information from only the specific custom AZ is returned.",
  "Filters": "A filter that specifies one or more custom AZs to describe."
}
"""
DescribeCustomAvailabilityZones() = rds("DescribeCustomAvailabilityZones")
DescribeCustomAvailabilityZones(args) = rds("DescribeCustomAvailabilityZones", args)

"""
    DescribeDBClusterParameterGroups()

 Returns a list of DBClusterParameterGroup descriptions. If a DBClusterParameterGroupName parameter is specified, the list will contain only the description of the specified DB cluster parameter group.  For more information on Amazon Aurora, see  What Is Amazon Aurora? in the Amazon Aurora User Guide.   This action only applies to Aurora DB clusters. 

Optional Parameters
{
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Marker": " An optional pagination token provided by a previous DescribeDBClusterParameterGroups request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. ",
  "DBClusterParameterGroupName": "The name of a specific DB cluster parameter group to return details for. Constraints:   If supplied, must match the name of an existing DBClusterParameterGroup.  ",
  "Filters": "This parameter isn't currently supported."
}
"""
DescribeDBClusterParameterGroups() = rds("DescribeDBClusterParameterGroups")
DescribeDBClusterParameterGroups(args) = rds("DescribeDBClusterParameterGroups", args)

"""
    DownloadDBLogFilePortion()

Downloads all or a portion of the specified log file, up to 1 MB in size.

Required Parameters
{
  "DBInstanceIdentifier": "The customer-assigned name of the DB instance that contains the log files you want to list. Constraints:   Must match the identifier of an existing DBInstance.  ",
  "LogFileName": "The name of the log file to be downloaded."
}

Optional Parameters
{
  "Marker": "The pagination token provided in the previous request or \"0\". If the Marker parameter is specified the response includes only records beyond the marker until the end of the file or up to NumberOfLines.",
  "NumberOfLines": "The number of lines to download. If the number of lines specified results in a file over 1 MB in size, the file is truncated at 1 MB in size. If the NumberOfLines parameter is specified, then the block of lines returned can be from the beginning or the end of the log file, depending on the value of the Marker parameter.   If neither Marker or NumberOfLines are specified, the entire log file is returned up to a maximum of 10000 lines, starting with the most recent log entries first.   If NumberOfLines is specified and Marker isn't specified, then the most recent lines from the end of the log file are returned.   If Marker is specified as \"0\", then the specified number of lines from the beginning of the log file are returned.   You can download the log file in blocks of lines by specifying the size of the block using the NumberOfLines parameter, and by specifying a value of \"0\" for the Marker parameter in your first request. Include the Marker value returned in the response as the Marker value for the next request, continuing until the AdditionalDataPending response element returns false.  "
}
"""
DownloadDBLogFilePortion(args) = rds("DownloadDBLogFilePortion", args)

"""
    DescribePendingMaintenanceActions()

Returns a list of resources (for example, DB instances) that have at least one pending maintenance action.

Optional Parameters
{
  "Marker": " An optional pagination token provided by a previous DescribePendingMaintenanceActions request. If this parameter is specified, the response includes only records beyond the marker, up to a number of records specified by MaxRecords. ",
  "MaxRecords": " The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.  Default: 100 Constraints: Minimum 20, maximum 100.",
  "Filters": "A filter that specifies one or more resources to return pending maintenance actions for. Supported filters:    db-cluster-id - Accepts DB cluster identifiers and DB cluster Amazon Resource Names (ARNs). The results list will only include pending maintenance actions for the DB clusters identified by these ARNs.    db-instance-id - Accepts DB instance identifiers and DB instance ARNs. The results list will only include pending maintenance actions for the DB instances identified by these ARNs.  ",
  "ResourceIdentifier": "The ARN of a resource to return pending maintenance actions for."
}
"""
DescribePendingMaintenanceActions() = rds("DescribePendingMaintenanceActions")
DescribePendingMaintenanceActions(args) = rds("DescribePendingMaintenanceActions", args)
