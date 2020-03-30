include("../AWSServices.jl")
using .AWSServices: storage_gateway

"""
    DeleteBandwidthRateLimit()

Deletes the bandwidth rate limits of a gateway. You can delete either the upload and download bandwidth rate limit, or you can delete both. If you delete only one of the limits, the other limit remains unchanged. To specify which gateway to work with, use the Amazon Resource Name (ARN) of the gateway in your request. This operation is supported for the stored volume, cached volume and tape gateway types.

Required Parameters
{
  "BandwidthType": "One of the BandwidthType values that indicates the gateway bandwidth rate limit to delete. Valid Values: Upload, Download, All.",
  "GatewayARN": ""
}
"""
DeleteBandwidthRateLimit(args) = storage_gateway("DeleteBandwidthRateLimit", args)

"""
    ListGateways()

Lists gateways owned by an AWS account in an AWS Region specified in the request. The returned list is ordered by gateway Amazon Resource Name (ARN). By default, the operation returns a maximum of 100 gateways. This operation supports pagination that allows you to optionally reduce the number of gateways returned in a response. If you have more gateways than are returned in a response (that is, the response returns only a truncated list of your gateways), the response contains a marker that you can specify in your next request to fetch the next page of gateways.

Optional Parameters
{
  "Marker": "An opaque string that indicates the position at which to begin the returned list of gateways.",
  "Limit": "Specifies that the list of gateways returned be limited to the specified number of items."
}
"""
ListGateways() = storage_gateway("ListGateways")
ListGateways(args) = storage_gateway("ListGateways", args)

"""
    DetachVolume()

Disconnects a volume from an iSCSI connection and then detaches the volume from the specified gateway. Detaching and attaching a volume enables you to recover your data from one gateway to a different gateway without creating a snapshot. It also makes it easier to move your volumes from an on-premises gateway to a gateway hosted on an Amazon EC2 instance. This operation is only supported in the volume gateway type.

Required Parameters
{
  "VolumeARN": "The Amazon Resource Name (ARN) of the volume to detach from the gateway."
}

Optional Parameters
{
  "ForceDetach": "Set to true to forcibly remove the iSCSI connection of the target volume and detach the volume. The default is false. If this value is set to false, you must manually disconnect the iSCSI connection from the target volume."
}
"""
DetachVolume(args) = storage_gateway("DetachVolume", args)

"""
    DescribeSMBSettings()

Gets a description of a Server Message Block (SMB) file share settings from a file gateway. This operation is only supported for file gateways.

Required Parameters
{
  "GatewayARN": ""
}
"""
DescribeSMBSettings(args) = storage_gateway("DescribeSMBSettings", args)

"""
    DescribeStorediSCSIVolumes()

Returns the description of the gateway volumes specified in the request. The list of gateway volumes in the request must be from one gateway. In the response Amazon Storage Gateway returns volume information sorted by volume ARNs. This operation is only supported in stored volume gateway type.

Required Parameters
{
  "VolumeARNs": "An array of strings where each string represents the Amazon Resource Name (ARN) of a stored volume. All of the specified stored volumes must from the same gateway. Use ListVolumes to get volume ARNs for a gateway."
}
"""
DescribeStorediSCSIVolumes(args) = storage_gateway("DescribeStorediSCSIVolumes", args)

"""
    CreateTapeWithBarcode()

Creates a virtual tape by using your own barcode. You write data to the virtual tape and then archive the tape. A barcode is unique and can not be reused if it has already been used on a tape . This applies to barcodes used on deleted tapes. This operation is only supported in the tape gateway type.  Cache storage must be allocated to the gateway before you can create a virtual tape. Use the AddCache operation to add cache storage to a gateway. 

Required Parameters
{
  "TapeSizeInBytes": "The size, in bytes, of the virtual tape that you want to create.  The size must be aligned by gigabyte (1024*1024*1024 byte). ",
  "TapeBarcode": "The barcode that you want to assign to the tape.  Barcodes cannot be reused. This includes barcodes used for tapes that have been deleted. ",
  "GatewayARN": "The unique Amazon Resource Name (ARN) that represents the gateway to associate the virtual tape with. Use the ListGateways operation to return a list of gateways for your account and AWS Region."
}

Optional Parameters
{
  "KMSEncrypted": "True to use Amazon S3 server side encryption with your own AWS KMS key, or false to use a key managed by Amazon S3. Optional.",
  "Tags": "A list of up to 50 tags that can be assigned to a virtual tape that has a barcode. Each tag is a key-value pair.  Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256. ",
  "KMSKey": "The Amazon Resource Name (ARN) of the AWS KMS Key used for Amazon S3 server side encryption. This value can only be set when KMSEncrypted is true. Optional.",
  "PoolId": "The ID of the pool that you want to add your tape to for archiving. The tape in this pool is archived in the S3 storage class that is associated with the pool. When you use your backup application to eject the tape, the tape is archived directly into the storage class (Glacier or Deep Archive) that corresponds to the pool. Valid values: \"GLACIER\", \"DEEP_ARCHIVE\""
}
"""
CreateTapeWithBarcode(args) = storage_gateway("CreateTapeWithBarcode", args)

"""
    DescribeCache()

Returns information about the cache of a gateway. This operation is only supported in the cached volume, tape and file gateway types. The response includes disk IDs that are configured as cache, and it includes the amount of cache allocated and used.

Required Parameters
{
  "GatewayARN": ""
}
"""
DescribeCache(args) = storage_gateway("DescribeCache", args)

"""
    DescribeChapCredentials()

Returns an array of Challenge-Handshake Authentication Protocol (CHAP) credentials information for a specified iSCSI target, one for each target-initiator pair. This operation is supported in the volume and tape gateway types.

Required Parameters
{
  "TargetARN": "The Amazon Resource Name (ARN) of the iSCSI volume target. Use the DescribeStorediSCSIVolumes operation to return to retrieve the TargetARN for specified VolumeARN."
}
"""
DescribeChapCredentials(args) = storage_gateway("DescribeChapCredentials", args)

"""
    SetSMBGuestPassword()

Sets the password for the guest user smbguest. The smbguest user is the user when the authentication method for the file share is set to GuestAccess.

Required Parameters
{
  "Password": "The password that you want to set for your SMB Server.",
  "GatewayARN": "The Amazon Resource Name (ARN) of the file gateway the SMB file share is associated with."
}
"""
SetSMBGuestPassword(args) = storage_gateway("SetSMBGuestPassword", args)

"""
    UpdateSnapshotSchedule()

Updates a snapshot schedule configured for a gateway volume. This operation is only supported in the cached volume and stored volume gateway types. The default snapshot schedule for volume is once every 24 hours, starting at the creation time of the volume. You can use this API to change the snapshot schedule configured for the volume. In the request you must identify the gateway volume whose snapshot schedule you want to update, and the schedule information, including when you want the snapshot to begin on a day and the frequency (in hours) of snapshots.

Required Parameters
{
  "StartAt": "The hour of the day at which the snapshot schedule begins represented as hh, where hh is the hour (0 to 23). The hour of the day is in the time zone of the gateway.",
  "VolumeARN": "The Amazon Resource Name (ARN) of the volume. Use the ListVolumes operation to return a list of gateway volumes.",
  "RecurrenceInHours": "Frequency of snapshots. Specify the number of hours between snapshots."
}

Optional Parameters
{
  "Description": "Optional description of the snapshot that overwrites the existing description.",
  "Tags": "A list of up to 50 tags that can be assigned to a snapshot. Each tag is a key-value pair.  Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256. "
}
"""
UpdateSnapshotSchedule(args) = storage_gateway("UpdateSnapshotSchedule", args)

"""
    AddCache()

Configures one or more gateway local disks as cache for a gateway. This operation is only supported in the cached volume, tape and file gateway type (see Storage Gateway Concepts). In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add cache, and one or more disk IDs that you want to configure as cache.

Required Parameters
{
  "GatewayARN": "",
  "DiskIds": "An array of strings that identify disks that are to be configured as working storage. Each string have a minimum length of 1 and maximum length of 300. You can get the disk IDs from the ListLocalDisks API."
}
"""
AddCache(args) = storage_gateway("AddCache", args)

"""
    AttachVolume()

Connects a volume to an iSCSI connection and then attaches the volume to the specified gateway. Detaching and attaching a volume enables you to recover your data from one gateway to a different gateway without creating a snapshot. It also makes it easier to move your volumes from an on-premises gateway to a gateway hosted on an Amazon EC2 instance.

Required Parameters
{
  "VolumeARN": "The Amazon Resource Name (ARN) of the volume to attach to the specified gateway.",
  "NetworkInterfaceId": "The network interface of the gateway on which to expose the iSCSI target. Only IPv4 addresses are accepted. Use DescribeGatewayInformation to get a list of the network interfaces available on a gateway.  Valid Values: A valid IP address.",
  "GatewayARN": "The Amazon Resource Name (ARN) of the gateway that you want to attach the volume to."
}

Optional Parameters
{
  "DiskId": "The unique device ID or other distinguishing data that identifies the local disk used to create the volume. This value is only required when you are attaching a stored volume.",
  "TargetName": "The name of the iSCSI target used by an initiator to connect to a volume and used as a suffix for the target ARN. For example, specifying TargetName as myvolume results in the target ARN of arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume. The target name must be unique across all volumes on a gateway. If you don't specify a value, Storage Gateway uses the value that was previously used for this volume as the new target name."
}
"""
AttachVolume(args) = storage_gateway("AttachVolume", args)

"""
    UpdateBandwidthRateLimit()

Updates the bandwidth rate limits of a gateway. You can update both the upload and download bandwidth rate limit or specify only one of the two. If you don't set a bandwidth rate limit, the existing rate limit remains. This operation is supported for the stored volume, cached volume and tape gateway types.' By default, a gateway's bandwidth rate limits are not set. If you don't set any limit, the gateway does not have any limitations on its bandwidth usage and could potentially use the maximum available bandwidth. To specify which gateway to update, use the Amazon Resource Name (ARN) of the gateway in your request.

Required Parameters
{
  "GatewayARN": ""
}

Optional Parameters
{
  "AverageDownloadRateLimitInBitsPerSec": "The average download bandwidth rate limit in bits per second.",
  "AverageUploadRateLimitInBitsPerSec": "The average upload bandwidth rate limit in bits per second."
}
"""
UpdateBandwidthRateLimit(args) = storage_gateway("UpdateBandwidthRateLimit", args)

"""
    RetrieveTapeRecoveryPoint()

Retrieves the recovery point for the specified virtual tape. This operation is only supported in the tape gateway type. A recovery point is a point in time view of a virtual tape at which all the data on the tape is consistent. If your gateway crashes, virtual tapes that have recovery points can be recovered to a new gateway.  The virtual tape can be retrieved to only one gateway. The retrieved tape is read-only. The virtual tape can be retrieved to only a tape gateway. There is no charge for retrieving recovery points. 

Required Parameters
{
  "GatewayARN": "",
  "TapeARN": "The Amazon Resource Name (ARN) of the virtual tape for which you want to retrieve the recovery point."
}
"""
RetrieveTapeRecoveryPoint(args) = storage_gateway("RetrieveTapeRecoveryPoint", args)

"""
    ActivateGateway()

Activates the gateway you previously deployed on your host. In the activation process, you specify information such as the AWS Region that you want to use for storing snapshots or tapes, the time zone for scheduled snapshots the gateway snapshot schedule window, an activation key, and a name for your gateway. The activation process also associates your gateway with your account; for more information, see UpdateGatewayInformation.  You must turn on the gateway VM before you can activate your gateway. 

Required Parameters
{
  "GatewayName": "The name you configured for your gateway.",
  "GatewayRegion": "A value that indicates the AWS Region where you want to store your data. The gateway AWS Region specified must be the same AWS Region as the AWS Region in your Host header in the request. For more information about available AWS Regions and endpoints for AWS Storage Gateway, see Regions and Endpoints in the Amazon Web Services Glossary.  Valid Values: See AWS Storage Gateway Regions and Endpoints in the AWS General Reference. ",
  "GatewayTimezone": "A value that indicates the time zone you want to set for the gateway. The time zone is of the format \"GMT-hr:mm\" or \"GMT+hr:mm\". For example, GMT-4:00 indicates the time is 4 hours behind GMT. GMT+2:00 indicates the time is 2 hours ahead of GMT. The time zone is used, for example, for scheduling snapshots and your gateway's maintenance schedule.",
  "ActivationKey": "Your gateway activation key. You can obtain the activation key by sending an HTTP GET request with redirects enabled to the gateway IP address (port 80). The redirect URL returned in the response provides you the activation key for your gateway in the query string parameter activationKey. It may also include other activation-related parameters, however, these are merely defaults -- the arguments you pass to the ActivateGateway API call determine the actual configuration of your gateway.  For more information, see https://docs.aws.amazon.com/storagegateway/latest/userguide/get-activation-key.html in the Storage Gateway User Guide."
}

Optional Parameters
{
  "Tags": "A list of up to 50 tags that you can assign to the gateway. Each tag is a key-value pair.  Valid characters for key and value are letters, spaces, and numbers that can be represented in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256 characters. ",
  "MediumChangerType": "The value that indicates the type of medium changer to use for tape gateway. This field is optional.  Valid Values: \"STK-L700\", \"AWS-Gateway-VTL\"",
  "TapeDriveType": "The value that indicates the type of tape drive to use for tape gateway. This field is optional.  Valid Values: \"IBM-ULT3580-TD5\" ",
  "GatewayType": "A value that defines the type of gateway to activate. The type specified is critical to all later functions of the gateway and cannot be changed after activation. The default value is CACHED.   Valid Values: \"STORED\", \"CACHED\", \"VTL\", \"FILE_S3\""
}
"""
ActivateGateway(args) = storage_gateway("ActivateGateway", args)

"""
    DescribeWorkingStorage()

Returns information about the working storage of a gateway. This operation is only supported in the stored volumes gateway type. This operation is deprecated in cached volumes API version (20120630). Use DescribeUploadBuffer instead.  Working storage is also referred to as upload buffer. You can also use the DescribeUploadBuffer operation to add upload buffer to a stored volume gateway.  The response includes disk IDs that are configured as working storage, and it includes the amount of working storage allocated and used.

Required Parameters
{
  "GatewayARN": ""
}
"""
DescribeWorkingStorage(args) = storage_gateway("DescribeWorkingStorage", args)

"""
    DescribeCachediSCSIVolumes()

Returns a description of the gateway volumes specified in the request. This operation is only supported in the cached volume gateway types. The list of gateway volumes in the request must be from one gateway. In the response Amazon Storage Gateway returns volume information sorted by volume Amazon Resource Name (ARN).

Required Parameters
{
  "VolumeARNs": "An array of strings where each string represents the Amazon Resource Name (ARN) of a cached volume. All of the specified cached volumes must from the same gateway. Use ListVolumes to get volume ARNs for a gateway."
}
"""
DescribeCachediSCSIVolumes(args) = storage_gateway("DescribeCachediSCSIVolumes", args)

"""
    DeleteChapCredentials()

Deletes Challenge-Handshake Authentication Protocol (CHAP) credentials for a specified iSCSI target and initiator pair. This operation is supported in volume and tape gateway types.

Required Parameters
{
  "TargetARN": "The Amazon Resource Name (ARN) of the iSCSI volume target. Use the DescribeStorediSCSIVolumes operation to return to retrieve the TargetARN for specified VolumeARN.",
  "InitiatorName": "The iSCSI initiator that connects to the target."
}
"""
DeleteChapCredentials(args) = storage_gateway("DeleteChapCredentials", args)

"""
    ListVolumes()

Lists the iSCSI stored volumes of a gateway. Results are sorted by volume ARN. The response includes only the volume ARNs. If you want additional volume information, use the DescribeStorediSCSIVolumes or the DescribeCachediSCSIVolumes API. The operation supports pagination. By default, the operation returns a maximum of up to 100 volumes. You can optionally specify the Limit field in the body to limit the number of volumes in the response. If the number of volumes returned in the response is truncated, the response includes a Marker field. You can use this Marker value in your subsequent request to retrieve the next set of volumes. This operation is only supported in the cached volume and stored volume gateway types.

Optional Parameters
{
  "Marker": "A string that indicates the position at which to begin the returned list of volumes. Obtain the marker from the response of a previous List iSCSI Volumes request.",
  "GatewayARN": "",
  "Limit": "Specifies that the list of volumes returned be limited to the specified number of items."
}
"""
ListVolumes() = storage_gateway("ListVolumes")
ListVolumes(args) = storage_gateway("ListVolumes", args)

"""
    CreateSnapshotFromVolumeRecoveryPoint()

Initiates a snapshot of a gateway from a volume recovery point. This operation is only supported in the cached volume gateway type. A volume recovery point is a point in time at which all data of the volume is consistent and from which you can create a snapshot. To get a list of volume recovery point for cached volume gateway, use ListVolumeRecoveryPoints. In the CreateSnapshotFromVolumeRecoveryPoint request, you identify the volume by providing its Amazon Resource Name (ARN). You must also provide a description for the snapshot. When the gateway takes a snapshot of the specified volume, the snapshot and its description appear in the AWS Storage Gateway console. In response, the gateway returns you a snapshot ID. You can use this snapshot ID to check the snapshot progress or later use it when you want to create a volume from a snapshot.  To list or delete a snapshot, you must use the Amazon EC2 API. For more information, in Amazon Elastic Compute Cloud API Reference. 

Required Parameters
{
  "VolumeARN": "The Amazon Resource Name (ARN) of the iSCSI volume target. Use the DescribeStorediSCSIVolumes operation to return to retrieve the TargetARN for specified VolumeARN.",
  "SnapshotDescription": "Textual description of the snapshot that appears in the Amazon EC2 console, Elastic Block Store snapshots panel in the Description field, and in the AWS Storage Gateway snapshot Details pane, Description field"
}

Optional Parameters
{
  "Tags": "A list of up to 50 tags that can be assigned to a snapshot. Each tag is a key-value pair.  Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256. "
}
"""
CreateSnapshotFromVolumeRecoveryPoint(args) = storage_gateway("CreateSnapshotFromVolumeRecoveryPoint", args)

"""
    CreateNFSFileShare()

Creates a Network File System (NFS) file share on an existing file gateway. In Storage Gateway, a file share is a file system mount point backed by Amazon S3 cloud storage. Storage Gateway exposes file shares using a NFS interface. This operation is only supported for file gateways.  File gateway requires AWS Security Token Service (AWS STS) to be activated to enable you create a file share. Make sure AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in the AWS Region, activate it. For information about how to activate AWS STS, see Activating and Deactivating AWS STS in an AWS Region in the AWS Identity and Access Management User Guide.  File gateway does not support creating hard or symbolic links on a file share. 

Required Parameters
{
  "LocationARN": "The ARN of the backed storage used for storing file data. ",
  "GatewayARN": "The Amazon Resource Name (ARN) of the file gateway on which you want to create a file share.",
  "ClientToken": "A unique string value that you supply that is used by file gateway to ensure idempotent file share creation.",
  "Role": "The ARN of the AWS Identity and Access Management (IAM) role that a file gateway assumes when it accesses the underlying storage. "
}

Optional Parameters
{
  "DefaultStorageClass": "The default storage class for objects put into an Amazon S3 bucket by the file gateway. Possible values are S3_STANDARD, S3_STANDARD_IA, or S3_ONEZONE_IA. If this field is not populated, the default value S3_STANDARD is used. Optional.",
  "Tags": "A list of up to 50 tags that can be assigned to the NFS file share. Each tag is a key-value pair.  Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256. ",
  "ReadOnly": "A value that sets the write status of a file share. This value is true if the write status is read-only, and otherwise false.",
  "GuessMIMETypeEnabled": "A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set this value to true to enable MIME type guessing, and otherwise to false. The default value is true.",
  "KMSEncrypted": "True to use Amazon S3 server side encryption with your own AWS KMS key, or false to use a key managed by Amazon S3. Optional.",
  "NFSFileShareDefaults": "File share default values. Optional.",
  "ObjectACL": "A value that sets the access control list permission for objects in the S3 bucket that a file gateway puts objects into. The default value is \"private\".",
  "RequesterPays": "A value that sets who pays the cost of the request and the cost associated with data download from the S3 bucket. If this value is set to true, the requester pays the costs. Otherwise the S3 bucket owner pays. However, the S3 bucket owner always pays the cost of storing data.   RequesterPays is a configuration for the S3 bucket that backs the file share, so make sure that the configuration on the file share is the same as the S3 bucket configuration. ",
  "Squash": "A value that maps a user to anonymous user. Valid options are the following:     RootSquash - Only root is mapped to anonymous user.    NoSquash - No one is mapped to anonymous user    AllSquash - Everyone is mapped to anonymous user.  ",
  "KMSKey": "The Amazon Resource Name (ARN) AWS KMS key used for Amazon S3 server side encryption. This value can only be set when KMSEncrypted is true. Optional.",
  "ClientList": "The list of clients that are allowed to access the file gateway. The list must contain either valid IP addresses or valid CIDR blocks. "
}
"""
CreateNFSFileShare(args) = storage_gateway("CreateNFSFileShare", args)

"""
    SetLocalConsolePassword()

Sets the password for your VM local console. When you log in to the local console for the first time, you log in to the VM with the default credentials. We recommend that you set a new password. You don't need to know the default password to set a new password.

Required Parameters
{
  "LocalConsolePassword": "The password you want to set for your VM local console.",
  "GatewayARN": ""
}
"""
SetLocalConsolePassword(args) = storage_gateway("SetLocalConsolePassword", args)

"""
    DescribeVTLDevices()

Returns a description of virtual tape library (VTL) devices for the specified tape gateway. In the response, AWS Storage Gateway returns VTL device information. This operation is only supported in the tape gateway type.

Required Parameters
{
  "GatewayARN": ""
}

Optional Parameters
{
  "Marker": "An opaque string that indicates the position at which to begin describing the VTL devices.",
  "VTLDeviceARNs": "An array of strings, where each string represents the Amazon Resource Name (ARN) of a VTL device.  All of the specified VTL devices must be from the same gateway. If no VTL devices are specified, the result will contain all devices on the specified gateway. ",
  "Limit": "Specifies that the number of VTL devices described be limited to the specified number."
}
"""
DescribeVTLDevices(args) = storage_gateway("DescribeVTLDevices", args)

"""
    AddWorkingStorage()

Configures one or more gateway local disks as working storage for a gateway. This operation is only supported in the stored volume gateway type. This operation is deprecated in cached volume API version 20120630. Use AddUploadBuffer instead.  Working storage is also referred to as upload buffer. You can also use the AddUploadBuffer operation to add upload buffer to a stored volume gateway.  In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add working storage, and one or more disk IDs that you want to configure as working storage.

Required Parameters
{
  "GatewayARN": "",
  "DiskIds": "An array of strings that identify disks that are to be configured as working storage. Each string have a minimum length of 1 and maximum length of 300. You can get the disk IDs from the ListLocalDisks API."
}
"""
AddWorkingStorage(args) = storage_gateway("AddWorkingStorage", args)

"""
    DescribeMaintenanceStartTime()

Returns your gateway's weekly maintenance start time including the day and time of the week. Note that values are in terms of the gateway's time zone.

Required Parameters
{
  "GatewayARN": ""
}
"""
DescribeMaintenanceStartTime(args) = storage_gateway("DescribeMaintenanceStartTime", args)

"""
    DescribeSnapshotSchedule()

Describes the snapshot schedule for the specified gateway volume. The snapshot schedule information includes intervals at which snapshots are automatically initiated on the volume. This operation is only supported in the cached volume and stored volume types.

Required Parameters
{
  "VolumeARN": "The Amazon Resource Name (ARN) of the volume. Use the ListVolumes operation to return a list of gateway volumes."
}
"""
DescribeSnapshotSchedule(args) = storage_gateway("DescribeSnapshotSchedule", args)

"""
    StartAvailabilityMonitorTest()

Start a test that verifies that the specified gateway is configured for High Availability monitoring in your host environment. This request only initiates the test and that a successful response only indicates that the test was started. It doesn't indicate that the test passed. For the status of the test, invoke the DescribeAvailabilityMonitorTest API.   Starting this test will cause your gateway to go offline for a brief period. 

Required Parameters
{
  "GatewayARN": ""
}
"""
StartAvailabilityMonitorTest(args) = storage_gateway("StartAvailabilityMonitorTest", args)

"""
    ListFileShares()

Gets a list of the file shares for a specific file gateway, or the list of file shares that belong to the calling user account. This operation is only supported for file gateways.

Optional Parameters
{
  "Marker": "Opaque pagination token returned from a previous ListFileShares operation. If present, Marker specifies where to continue the list from after a previous call to ListFileShares. Optional.",
  "GatewayARN": "The Amazon resource Name (ARN) of the gateway whose file shares you want to list. If this field is not present, all file shares under your account are listed.",
  "Limit": "The maximum number of file shares to return in the response. The value must be an integer with a value greater than zero. Optional."
}
"""
ListFileShares() = storage_gateway("ListFileShares")
ListFileShares(args) = storage_gateway("ListFileShares", args)

"""
    NotifyWhenUploaded()

Sends you notification through CloudWatch Events when all files written to your file share have been uploaded to Amazon S3. AWS Storage Gateway can send a notification through Amazon CloudWatch Events when all files written to your file share up to that point in time have been uploaded to Amazon S3. These files include files written to the file share up to the time that you make a request for notification. When the upload is done, Storage Gateway sends you notification through an Amazon CloudWatch Event. You can configure CloudWatch Events to send the notification through event targets such as Amazon SNS or AWS Lambda function. This operation is only supported for file gateways. For more information, see Getting File Upload Notification in the Storage Gateway User Guide (https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-upload-notification). 

Required Parameters
{
  "FileShareARN": ""
}
"""
NotifyWhenUploaded(args) = storage_gateway("NotifyWhenUploaded", args)

"""
    DescribeTapeRecoveryPoints()

Returns a list of virtual tape recovery points that are available for the specified tape gateway. A recovery point is a point-in-time view of a virtual tape at which all the data on the virtual tape is consistent. If your gateway crashes, virtual tapes that have recovery points can be recovered to a new gateway. This operation is only supported in the tape gateway type.

Required Parameters
{
  "GatewayARN": ""
}

Optional Parameters
{
  "Marker": "An opaque string that indicates the position at which to begin describing the virtual tape recovery points.",
  "Limit": "Specifies that the number of virtual tape recovery points that are described be limited to the specified number."
}
"""
DescribeTapeRecoveryPoints(args) = storage_gateway("DescribeTapeRecoveryPoints", args)

"""
    ListVolumeRecoveryPoints()

Lists the recovery points for a specified gateway. This operation is only supported in the cached volume gateway type. Each cache volume has one recovery point. A volume recovery point is a point in time at which all data of the volume is consistent and from which you can create a snapshot or clone a new cached volume from a source volume. To create a snapshot from a volume recovery point use the CreateSnapshotFromVolumeRecoveryPoint operation.

Required Parameters
{
  "GatewayARN": ""
}
"""
ListVolumeRecoveryPoints(args) = storage_gateway("ListVolumeRecoveryPoints", args)

"""
    AssignTapePool()

Assigns a tape to a tape pool for archiving. The tape assigned to a pool is archived in the S3 storage class that is associated with the pool. When you use your backup application to eject the tape, the tape is archived directly into the S3 storage class (Glacier or Deep Archive) that corresponds to the pool. Valid values: "GLACIER", "DEEP_ARCHIVE"

Required Parameters
{
  "TapeARN": "The unique Amazon Resource Name (ARN) of the virtual tape that you want to add to the tape pool.",
  "PoolId": "The ID of the pool that you want to add your tape to for archiving. The tape in this pool is archived in the S3 storage class that is associated with the pool. When you use your backup application to eject the tape, the tape is archived directly into the storage class (Glacier or Deep Archive) that corresponds to the pool. Valid values: \"GLACIER\", \"DEEP_ARCHIVE\""
}
"""
AssignTapePool(args) = storage_gateway("AssignTapePool", args)

"""
    UpdateSMBFileShare()

Updates a Server Message Block (SMB) file share.  To leave a file share field unchanged, set the corresponding input field to null. This operation is only supported for file gateways.   File gateways require AWS Security Token Service (AWS STS) to be activated to enable you to create a file share. Make sure that AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in this AWS Region, activate it. For information about how to activate AWS STS, see Activating and Deactivating AWS STS in an AWS Region in the AWS Identity and Access Management User Guide.  File gateways don't support creating hard or symbolic links on a file share. 

Required Parameters
{
  "FileShareARN": "The Amazon Resource Name (ARN) of the SMB file share that you want to update."
}

Optional Parameters
{
  "DefaultStorageClass": "The default storage class for objects put into an Amazon S3 bucket by the file gateway. Possible values are S3_STANDARD, S3_STANDARD_IA, or S3_ONEZONE_IA. If this field is not populated, the default value S3_STANDARD is used. Optional.",
  "ValidUserList": "A list of users or groups in the Active Directory that are allowed to access the file share. A group must be prefixed with the @ character. For example @group1. Can only be set if Authentication is set to ActiveDirectory.",
  "ReadOnly": "A value that sets the write status of a file share. This value is true if the write status is read-only, and otherwise false.",
  "AdminUserList": "A list of users in the Active Directory that have administrator rights to the file share. A group must be prefixed with the @ character. For example @group1. Can only be set if Authentication is set to ActiveDirectory.",
  "GuessMIMETypeEnabled": "A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set this value to true to enable MIME type guessing, and otherwise to false. The default value is true.",
  "KMSEncrypted": "True to use Amazon S3 server side encryption with your own AWS KMS key, or false to use a key managed by Amazon S3. Optional.",
  "ObjectACL": "A value that sets the access control list permission for objects in the S3 bucket that a file gateway puts objects into. The default value is \"private\".",
  "SMBACLEnabled": "Set this value to \"true to enable ACL (access control list) on the SMB file share. Set it to \"false\" to map file and directory permissions to the POSIX permissions. For more information, see https://docs.aws.amazon.com/storagegateway/latest/userguide/smb-acl.htmlin the Storage Gateway User Guide.",
  "RequesterPays": "A value that sets who pays the cost of the request and the cost associated with data download from the S3 bucket. If this value is set to true, the requester pays the costs. Otherwise the S3 bucket owner pays. However, the S3 bucket owner always pays the cost of storing data.   RequesterPays is a configuration for the S3 bucket that backs the file share, so make sure that the configuration on the file share is the same as the S3 bucket configuration. ",
  "KMSKey": "The Amazon Resource Name (ARN) of the AWS KMS key used for Amazon S3 server side encryption. This value can only be set when KMSEncrypted is true. Optional.",
  "InvalidUserList": "A list of users or groups in the Active Directory that are not allowed to access the file share. A group must be prefixed with the @ character. For example @group1. Can only be set if Authentication is set to ActiveDirectory."
}
"""
UpdateSMBFileShare(args) = storage_gateway("UpdateSMBFileShare", args)

"""
    RefreshCache()

Refreshes the cache for the specified file share. This operation finds objects in the Amazon S3 bucket that were added, removed or replaced since the gateway last listed the bucket's contents and cached the results. This operation is only supported in the file gateway type. You can subscribe to be notified through an Amazon CloudWatch event when your RefreshCache operation completes. For more information, see Getting Notified About File Operations. When this API is called, it only initiates the refresh operation. When the API call completes and returns a success code, it doesn't necessarily mean that the file refresh has completed. You should use the refresh-complete notification to determine that the operation has completed before you check for new files on the gateway file share. You can subscribe to be notified through an CloudWatch event when your RefreshCache operation completes.  Throttle limit: This API is asynchronous so the gateway will accept no more than two refreshes at any time. We recommend using the refresh-complete CloudWatch event notification before issuing additional requests. For more information, see Getting Notified About File Operations. If you invoke the RefreshCache API when two requests are already being processed, any new request will cause an InvalidGatewayRequestException error because too many requests were sent to the server. For more information, see "https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification".

Required Parameters
{
  "FileShareARN": "The Amazon Resource Name (ARN) of the file share you want to refresh."
}

Optional Parameters
{
  "Recursive": "A value that specifies whether to recursively refresh folders in the cache. The refresh includes folders that were in the cache the last time the gateway listed the folder's contents. If this value set to \"true\", each folder that is listed in FolderList is recursively updated. Otherwise, subfolders listed in FolderList are not refreshed. Only objects that are in folders listed directly under FolderList are found and used for the update. The default is \"true\".",
  "FolderList": "A comma-separated list of the paths of folders to refresh in the cache. The default is [\"/\"]. The default refreshes objects and folders at the root of the Amazon S3 bucket. If Recursive is set to \"true\", the entire S3 bucket that the file share has access to is refreshed."
}
"""
RefreshCache(args) = storage_gateway("RefreshCache", args)

"""
    ListTapes()

Lists virtual tapes in your virtual tape library (VTL) and your virtual tape shelf (VTS). You specify the tapes to list by specifying one or more tape Amazon Resource Names (ARNs). If you don't specify a tape ARN, the operation lists all virtual tapes in both your VTL and VTS. This operation supports pagination. By default, the operation returns a maximum of up to 100 tapes. You can optionally specify the Limit parameter in the body to limit the number of tapes in the response. If the number of tapes returned in the response is truncated, the response includes a Marker element that you can use in your subsequent request to retrieve the next set of tapes. This operation is only supported in the tape gateway type.

Optional Parameters
{
  "Marker": "A string that indicates the position at which to begin the returned list of tapes.",
  "TapeARNs": "",
  "Limit": "An optional number limit for the tapes in the list returned by this call."
}
"""
ListTapes() = storage_gateway("ListTapes")
ListTapes(args) = storage_gateway("ListTapes", args)

"""
    UpdateSMBSecurityStrategy()

Updates the SMB security strategy on a file gateway. This action is only supported in file gateways.  This API is called Security level in the User Guide. A higher security level can affect performance of the gateway. 

Required Parameters
{
  "GatewayARN": "",
  "SMBSecurityStrategy": "Specifies the type of security strategy. ClientSpecified: if you use this option, requests are established based on what is negotiated by the client. This option is recommended when you want to maximize compatibility across different clients in your environment.  MandatorySigning: if you use this option, file gateway only allows connections from SMBv2 or SMBv3 clients that have signing enabled. This option works with SMB clients on Microsoft Windows Vista, Windows Server 2008 or newer.  MandatoryEncryption: if you use this option, file gateway only allows connections from SMBv3 clients that have encryption enabled. This option is highly recommended for environments that handle sensitive data. This option works with SMB clients on Microsoft Windows 8, Windows Server 2012 or newer. "
}
"""
UpdateSMBSecurityStrategy(args) = storage_gateway("UpdateSMBSecurityStrategy", args)

"""
    UpdateNFSFileShare()

Updates a Network File System (NFS) file share. This operation is only supported in the file gateway type.  To leave a file share field unchanged, set the corresponding input field to null.  Updates the following file share setting:   Default storage class for your S3 bucket   Metadata defaults for your S3 bucket   Allowed NFS clients for your file share   Squash settings   Write status of your file share    To leave a file share field unchanged, set the corresponding input field to null. This operation is only supported in file gateways. 

Required Parameters
{
  "FileShareARN": "The Amazon Resource Name (ARN) of the file share to be updated. "
}

Optional Parameters
{
  "KMSEncrypted": "True to use Amazon S3 server side encryption with your own AWS KMS key, or false to use a key managed by Amazon S3. Optional. ",
  "ReadOnly": "A value that sets the write status of a file share. This value is true if the write status is read-only, and otherwise false.",
  "DefaultStorageClass": "The default storage class for objects put into an Amazon S3 bucket by the file gateway. Possible values are S3_STANDARD, S3_STANDARD_IA, or S3_ONEZONE_IA. If this field is not populated, the default value S3_STANDARD is used. Optional.",
  "RequesterPays": "A value that sets who pays the cost of the request and the cost associated with data download from the S3 bucket. If this value is set to true, the requester pays the costs. Otherwise the S3 bucket owner pays. However, the S3 bucket owner always pays the cost of storing data.   RequesterPays is a configuration for the S3 bucket that backs the file share, so make sure that the configuration on the file share is the same as the S3 bucket configuration. ",
  "Squash": "The user mapped to anonymous user. Valid options are the following:    RootSquash - Only root is mapped to anonymous user.    NoSquash - No one is mapped to anonymous user    AllSquash - Everyone is mapped to anonymous user.  ",
  "NFSFileShareDefaults": "The default values for the file share. Optional.",
  "KMSKey": "The Amazon Resource Name (ARN) of the AWS KMS key used for Amazon S3 server side encryption. This value can only be set when KMSEncrypted is true. Optional. ",
  "ClientList": "The list of clients that are allowed to access the file gateway. The list must contain either valid IP addresses or valid CIDR blocks.",
  "ObjectACL": "A value that sets the access control list permission for objects in the S3 bucket that a file gateway puts objects into. The default value is \"private\".",
  "GuessMIMETypeEnabled": "A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set this value to true to enable MIME type guessing, and otherwise to false. The default value is true."
}
"""
UpdateNFSFileShare(args) = storage_gateway("UpdateNFSFileShare", args)

"""
    ResetCache()

Resets all cache disks that have encountered a error and makes the disks available for reconfiguration as cache storage. If your cache disk encounters a error, the gateway prevents read and write operations on virtual tapes in the gateway. For example, an error can occur when a disk is corrupted or removed from the gateway. When a cache is reset, the gateway loses its cache storage. At this point you can reconfigure the disks as cache disks. This operation is only supported in the cached volume and tape types.  If the cache disk you are resetting contains data that has not been uploaded to Amazon S3 yet, that data can be lost. After you reset cache disks, there will be no configured cache disks left in the gateway, so you must configure at least one new cache disk for your gateway to function properly. 

Required Parameters
{
  "GatewayARN": ""
}
"""
ResetCache(args) = storage_gateway("ResetCache", args)

"""
    ShutdownGateway()

Shuts down a gateway. To specify which gateway to shut down, use the Amazon Resource Name (ARN) of the gateway in the body of your request. The operation shuts down the gateway service component running in the gateway's virtual machine (VM) and not the host VM.  If you want to shut down the VM, it is recommended that you first shut down the gateway component in the VM to avoid unpredictable conditions.  After the gateway is shutdown, you cannot call any other API except StartGateway, DescribeGatewayInformation, and ListGateways. For more information, see ActivateGateway. Your applications cannot read from or write to the gateway's storage volumes, and there are no snapshots taken.  When you make a shutdown request, you will get a 200 OK success response immediately. However, it might take some time for the gateway to shut down. You can call the DescribeGatewayInformation API to check the status. For more information, see ActivateGateway.  If do not intend to use the gateway again, you must delete the gateway (using DeleteGateway) to no longer pay software charges associated with the gateway.

Required Parameters
{
  "GatewayARN": ""
}
"""
ShutdownGateway(args) = storage_gateway("ShutdownGateway", args)

"""
    ListTagsForResource()

Lists the tags that have been added to the specified resource. This operation is supported in storage gateways of all types.

Required Parameters
{
  "ResourceARN": "The Amazon Resource Name (ARN) of the resource for which you want to list tags."
}

Optional Parameters
{
  "Marker": "An opaque string that indicates the position at which to begin returning the list of tags.",
  "Limit": "Specifies that the list of tags returned be limited to the specified number of items."
}
"""
ListTagsForResource(args) = storage_gateway("ListTagsForResource", args)

"""
    DeleteSnapshotSchedule()

Deletes a snapshot of a volume. You can take snapshots of your gateway volumes on a scheduled or ad hoc basis. This API action enables you to delete a snapshot schedule for a volume. For more information, see Working with Snapshots. In the DeleteSnapshotSchedule request, you identify the volume by providing its Amazon Resource Name (ARN). This operation is only supported in stored and cached volume gateway types.  To list or delete a snapshot, you must use the Amazon EC2 API. in Amazon Elastic Compute Cloud API Reference. 

Required Parameters
{
  "VolumeARN": "The volume which snapshot schedule to delete."
}
"""
DeleteSnapshotSchedule(args) = storage_gateway("DeleteSnapshotSchedule", args)

"""
    DescribeTapes()

Returns a description of the specified Amazon Resource Name (ARN) of virtual tapes. If a TapeARN is not specified, returns a description of all virtual tapes associated with the specified gateway. This operation is only supported in the tape gateway type.

Required Parameters
{
  "GatewayARN": ""
}

Optional Parameters
{
  "Marker": "A marker value, obtained in a previous call to DescribeTapes. This marker indicates which page of results to retrieve.  If not specified, the first page of results is retrieved.",
  "TapeARNs": "Specifies one or more unique Amazon Resource Names (ARNs) that represent the virtual tapes you want to describe. If this parameter is not specified, Tape gateway returns a description of all virtual tapes associated with the specified gateway.",
  "Limit": "Specifies that the number of virtual tapes described be limited to the specified number.  Amazon Web Services may impose its own limit, if this field is not set. "
}
"""
DescribeTapes(args) = storage_gateway("DescribeTapes", args)

"""
    CreateSMBFileShare()

Creates a Server Message Block (SMB) file share on an existing file gateway. In Storage Gateway, a file share is a file system mount point backed by Amazon S3 cloud storage. Storage Gateway expose file shares using a SMB interface. This operation is only supported for file gateways.  File gateways require AWS Security Token Service (AWS STS) to be activated to enable you to create a file share. Make sure that AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in this AWS Region, activate it. For information about how to activate AWS STS, see Activating and Deactivating AWS STS in an AWS Region in the AWS Identity and Access Management User Guide.  File gateways don't support creating hard or symbolic links on a file share. 

Required Parameters
{
  "LocationARN": "The ARN of the backed storage used for storing file data. ",
  "GatewayARN": "The Amazon Resource Name (ARN) of the file gateway on which you want to create a file share.",
  "ClientToken": "A unique string value that you supply that is used by file gateway to ensure idempotent file share creation.",
  "Role": "The ARN of the AWS Identity and Access Management (IAM) role that a file gateway assumes when it accesses the underlying storage. "
}

Optional Parameters
{
  "Authentication": "The authentication method that users use to access the file share. Valid values are ActiveDirectory or GuestAccess. The default is ActiveDirectory.",
  "DefaultStorageClass": "The default storage class for objects put into an Amazon S3 bucket by the file gateway. Possible values are S3_STANDARD, S3_STANDARD_IA, or S3_ONEZONE_IA. If this field is not populated, the default value S3_STANDARD is used. Optional.",
  "ValidUserList": "A list of users or groups in the Active Directory that are allowed to access the file share. A group must be prefixed with the @ character. For example @group1. Can only be set if Authentication is set to ActiveDirectory.",
  "Tags": "A list of up to 50 tags that can be assigned to the NFS file share. Each tag is a key-value pair.  Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256. ",
  "ReadOnly": "A value that sets the write status of a file share. This value is true if the write status is read-only, and otherwise false.",
  "AdminUserList": "A list of users in the Active Directory that will be granted administrator privileges on the file share. These users can do all file operations as the super-user.   Use this option very carefully, because any user in this list can do anything they like on the file share, regardless of file permissions. ",
  "GuessMIMETypeEnabled": "A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set this value to true to enable MIME type guessing, and otherwise to false. The default value is true.",
  "KMSEncrypted": "True to use Amazon S3 server side encryption with your own AWS KMS key, or false to use a key managed by Amazon S3. Optional.",
  "ObjectACL": "A value that sets the access control list permission for objects in the S3 bucket that a file gateway puts objects into. The default value is \"private\".",
  "SMBACLEnabled": "Set this value to \"true to enable ACL (access control list) on the SMB file share. Set it to \"false\" to map file and directory permissions to the POSIX permissions. For more information, see https://docs.aws.amazon.com/storagegateway/latest/userguide/smb-acl.html in the Storage Gateway User Guide.",
  "RequesterPays": "A value that sets who pays the cost of the request and the cost associated with data download from the S3 bucket. If this value is set to true, the requester pays the costs. Otherwise the S3 bucket owner pays. However, the S3 bucket owner always pays the cost of storing data.   RequesterPays is a configuration for the S3 bucket that backs the file share, so make sure that the configuration on the file share is the same as the S3 bucket configuration. ",
  "KMSKey": "The Amazon Resource Name (ARN) of the AWS KMS key used for Amazon S3 server side encryption. This value can only be set when KMSEncrypted is true. Optional.",
  "InvalidUserList": "A list of users or groups in the Active Directory that are not allowed to access the file share. A group must be prefixed with the @ character. For example @group1. Can only be set if Authentication is set to ActiveDirectory."
}
"""
CreateSMBFileShare(args) = storage_gateway("CreateSMBFileShare", args)

"""
    DeleteTape()

Deletes the specified virtual tape. This operation is only supported in the tape gateway type.

Required Parameters
{
  "GatewayARN": "The unique Amazon Resource Name (ARN) of the gateway that the virtual tape to delete is associated with. Use the ListGateways operation to return a list of gateways for your account and AWS Region.",
  "TapeARN": "The Amazon Resource Name (ARN) of the virtual tape to delete."
}
"""
DeleteTape(args) = storage_gateway("DeleteTape", args)

"""
    RetrieveTapeArchive()

Retrieves an archived virtual tape from the virtual tape shelf (VTS) to a tape gateway. Virtual tapes archived in the VTS are not associated with any gateway. However after a tape is retrieved, it is associated with a gateway, even though it is also listed in the VTS, that is, archive. This operation is only supported in the tape gateway type. Once a tape is successfully retrieved to a gateway, it cannot be retrieved again to another gateway. You must archive the tape again before you can retrieve it to another gateway. This operation is only supported in the tape gateway type.

Required Parameters
{
  "GatewayARN": "The Amazon Resource Name (ARN) of the gateway you want to retrieve the virtual tape to. Use the ListGateways operation to return a list of gateways for your account and AWS Region. You retrieve archived virtual tapes to only one gateway and the gateway must be a tape gateway.",
  "TapeARN": "The Amazon Resource Name (ARN) of the virtual tape you want to retrieve from the virtual tape shelf (VTS)."
}
"""
RetrieveTapeArchive(args) = storage_gateway("RetrieveTapeArchive", args)

"""
    AddTagsToResource()

Adds one or more tags to the specified resource. You use tags to add metadata to resources, which you can use to categorize these resources. For example, you can categorize resources by purpose, owner, environment, or team. Each tag consists of a key and a value, which you define. You can add tags to the following AWS Storage Gateway resources:   Storage gateways of all types   Storage volumes   Virtual tapes   NFS and SMB file shares   You can create a maximum of 50 tags for each resource. Virtual tapes and storage volumes that are recovered to a new gateway maintain their tags.

Required Parameters
{
  "ResourceARN": "The Amazon Resource Name (ARN) of the resource you want to add tags to.",
  "Tags": "The key-value pair that represents the tag you want to add to the resource. The value can be an empty string.  Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256. "
}
"""
AddTagsToResource(args) = storage_gateway("AddTagsToResource", args)

"""
    RemoveTagsFromResource()

Removes one or more tags from the specified resource. This operation is supported in storage gateways of all types.

Required Parameters
{
  "ResourceARN": "The Amazon Resource Name (ARN) of the resource you want to remove the tags from.",
  "TagKeys": "The keys of the tags you want to remove from the specified resource. A tag is composed of a key/value pair."
}
"""
RemoveTagsFromResource(args) = storage_gateway("RemoveTagsFromResource", args)

"""
    StartGateway()

Starts a gateway that you previously shut down (see ShutdownGateway). After the gateway starts, you can then make other API calls, your applications can read from or write to the gateway's storage volumes and you will be able to take snapshot backups.  When you make a request, you will get a 200 OK success response immediately. However, it might take some time for the gateway to be ready. You should call DescribeGatewayInformation and check the status before making any additional API calls. For more information, see ActivateGateway.  To specify which gateway to start, use the Amazon Resource Name (ARN) of the gateway in your request.

Required Parameters
{
  "GatewayARN": ""
}
"""
StartGateway(args) = storage_gateway("StartGateway", args)

"""
    CancelRetrieval()

Cancels retrieval of a virtual tape from the virtual tape shelf (VTS) to a gateway after the retrieval process is initiated. The virtual tape is returned to the VTS. This operation is only supported in the tape gateway type.

Required Parameters
{
  "GatewayARN": "",
  "TapeARN": "The Amazon Resource Name (ARN) of the virtual tape you want to cancel retrieval for."
}
"""
CancelRetrieval(args) = storage_gateway("CancelRetrieval", args)

"""
    DisableGateway()

Disables a tape gateway when the gateway is no longer functioning. For example, if your gateway VM is damaged, you can disable the gateway so you can recover virtual tapes. Use this operation for a tape gateway that is not reachable or not functioning. This operation is only supported in the tape gateway type.  Once a gateway is disabled it cannot be enabled. 

Required Parameters
{
  "GatewayARN": ""
}
"""
DisableGateway(args) = storage_gateway("DisableGateway", args)

"""
    CreateStorediSCSIVolume()

Creates a volume on a specified gateway. This operation is only supported in the stored volume gateway type. The size of the volume to create is inferred from the disk size. You can choose to preserve existing data on the disk, create volume from an existing snapshot, or create an empty volume. If you choose to create an empty gateway volume, then any existing data on the disk is erased. In the request you must specify the gateway and the disk information on which you are creating the volume. In response, the gateway creates the volume and returns volume information such as the volume Amazon Resource Name (ARN), its size, and the iSCSI target ARN that initiators can use to connect to the volume target.

Required Parameters
{
  "PreserveExistingData": "Specify this field as true if you want to preserve the data on the local disk. Otherwise, specifying this field as false creates an empty volume.  Valid Values: true, false",
  "DiskId": "The unique identifier for the gateway local disk that is configured as a stored volume. Use ListLocalDisks to list disk IDs for a gateway.",
  "NetworkInterfaceId": "The network interface of the gateway on which to expose the iSCSI target. Only IPv4 addresses are accepted. Use DescribeGatewayInformation to get a list of the network interfaces available on a gateway.  Valid Values: A valid IP address.",
  "GatewayARN": "",
  "TargetName": "The name of the iSCSI target used by an initiator to connect to a volume and used as a suffix for the target ARN. For example, specifying TargetName as myvolume results in the target ARN of arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume. The target name must be unique across all volumes on a gateway. If you don't specify a value, Storage Gateway uses the value that was previously used for this volume as the new target name."
}

Optional Parameters
{
  "KMSEncrypted": "True to use Amazon S3 server side encryption with your own AWS KMS key, or false to use a key managed by Amazon S3. Optional.",
  "SnapshotId": "The snapshot ID (e.g. \"snap-1122aabb\") of the snapshot to restore as the new stored volume. Specify this field if you want to create the iSCSI storage volume from a snapshot otherwise do not include this field. To list snapshots for your account use DescribeSnapshots in the Amazon Elastic Compute Cloud API Reference.",
  "Tags": "A list of up to 50 tags that can be assigned to a stored volume. Each tag is a key-value pair.  Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256. ",
  "KMSKey": "The Amazon Resource Name (ARN) of the KMS key used for Amazon S3 server side encryption. This value can only be set when KMSEncrypted is true. Optional."
}
"""
CreateStorediSCSIVolume(args) = storage_gateway("CreateStorediSCSIVolume", args)

"""
    UpdateGatewayInformation()

Updates a gateway's metadata, which includes the gateway's name and time zone. To specify which gateway to update, use the Amazon Resource Name (ARN) of the gateway in your request.  For Gateways activated after September 2, 2015, the gateway's ARN contains the gateway ID rather than the gateway name. However, changing the name of the gateway has no effect on the gateway's ARN. 

Required Parameters
{
  "GatewayARN": ""
}

Optional Parameters
{
  "GatewayName": "",
  "CloudWatchLogGroupARN": "The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that you want to use to monitor and log events in the gateway.  For more information, see What Is Amazon CloudWatch Logs?.",
  "GatewayTimezone": "A value that indicates the time zone of the gateway."
}
"""
UpdateGatewayInformation(args) = storage_gateway("UpdateGatewayInformation", args)

"""
    UpdateGatewaySoftwareNow()

Updates the gateway virtual machine (VM) software. The request immediately triggers the software update.  When you make this request, you get a 200 OK success response immediately. However, it might take some time for the update to complete. You can call DescribeGatewayInformation to verify the gateway is in the STATE_RUNNING state.   A software update forces a system restart of your gateway. You can minimize the chance of any disruption to your applications by increasing your iSCSI Initiators' timeouts. For more information about increasing iSCSI Initiator timeouts for Windows and Linux, see Customizing Your Windows iSCSI Settings and Customizing Your Linux iSCSI Settings, respectively. 

Required Parameters
{
  "GatewayARN": ""
}
"""
UpdateGatewaySoftwareNow(args) = storage_gateway("UpdateGatewaySoftwareNow", args)

"""
    CancelArchival()

Cancels archiving of a virtual tape to the virtual tape shelf (VTS) after the archiving process is initiated. This operation is only supported in the tape gateway type.

Required Parameters
{
  "GatewayARN": "",
  "TapeARN": "The Amazon Resource Name (ARN) of the virtual tape you want to cancel archiving for."
}
"""
CancelArchival(args) = storage_gateway("CancelArchival", args)

"""
    JoinDomain()

Adds a file gateway to an Active Directory domain. This operation is only supported for file gateways that support the SMB file protocol.

Required Parameters
{
  "UserName": "Sets the user name of user who has permission to add the gateway to the Active Directory domain. The domain user account should be enabled to join computers to the domain. For example, you can use the domain administrator account or an account with delegated permissions to join computers to the domain.",
  "Password": "Sets the password of the user who has permission to add the gateway to the Active Directory domain.",
  "DomainName": "The name of the domain that you want the gateway to join.",
  "GatewayARN": "The Amazon Resource Name (ARN) of the gateway. Use the ListGateways operation to return a list of gateways for your account and AWS Region."
}

Optional Parameters
{
  "DomainControllers": "List of IPv4 addresses, NetBIOS names, or host names of your domain server. If you need to specify the port number include it after the colon (“:”). For example, mydc.mydomain.com:389.",
  "OrganizationalUnit": "The organizational unit (OU) is a container in an Active Directory that can hold users, groups, computers, and other OUs and this parameter specifies the OU that the gateway will join within the AD domain.",
  "TimeoutInSeconds": "Specifies the time in seconds, in which the JoinDomain operation must complete. The default is 20 seconds."
}
"""
JoinDomain(args) = storage_gateway("JoinDomain", args)

"""
    ListLocalDisks()

Returns a list of the gateway's local disks. To specify which gateway to describe, you use the Amazon Resource Name (ARN) of the gateway in the body of the request. The request returns a list of all disks, specifying which are configured as working storage, cache storage, or stored volume or not configured at all. The response includes a DiskStatus field. This field can have a value of present (the disk is available to use), missing (the disk is no longer connected to the gateway), or mismatch (the disk node is occupied by a disk that has incorrect metadata or the disk content is corrupted).

Required Parameters
{
  "GatewayARN": ""
}
"""
ListLocalDisks(args) = storage_gateway("ListLocalDisks", args)

"""
    UpdateChapCredentials()

Updates the Challenge-Handshake Authentication Protocol (CHAP) credentials for a specified iSCSI target. By default, a gateway does not have CHAP enabled; however, for added security, you might use it. This operation is supported in the volume and tape gateway types.  When you update CHAP credentials, all existing connections on the target are closed and initiators must reconnect with the new credentials. 

Required Parameters
{
  "TargetARN": "The Amazon Resource Name (ARN) of the iSCSI volume target. Use the DescribeStorediSCSIVolumes operation to return the TargetARN for specified VolumeARN.",
  "InitiatorName": "The iSCSI initiator that connects to the target.",
  "SecretToAuthenticateInitiator": "The secret key that the initiator (for example, the Windows client) must provide to participate in mutual CHAP with the target.  The secret key must be between 12 and 16 bytes when encoded in UTF-8. "
}

Optional Parameters
{
  "SecretToAuthenticateTarget": "The secret key that the target must provide to participate in mutual CHAP with the initiator (e.g. Windows client). Byte constraints: Minimum bytes of 12. Maximum bytes of 16.  The secret key must be between 12 and 16 bytes when encoded in UTF-8. "
}
"""
UpdateChapCredentials(args) = storage_gateway("UpdateChapCredentials", args)

"""
    DescribeUploadBuffer()

Returns information about the upload buffer of a gateway. This operation is supported for the stored volume, cached volume and tape gateway types. The response includes disk IDs that are configured as upload buffer space, and it includes the amount of upload buffer space allocated and used.

Required Parameters
{
  "GatewayARN": ""
}
"""
DescribeUploadBuffer(args) = storage_gateway("DescribeUploadBuffer", args)

"""
    DescribeAvailabilityMonitorTest()

Returns information about the most recent High Availability monitoring test that was performed on the host in a cluster. If a test isn't performed, the status and start time in the response would be null.

Required Parameters
{
  "GatewayARN": ""
}
"""
DescribeAvailabilityMonitorTest(args) = storage_gateway("DescribeAvailabilityMonitorTest", args)

"""
    CreateTapes()

Creates one or more virtual tapes. You write data to the virtual tapes and then archive the tapes. This operation is only supported in the tape gateway type.  Cache storage must be allocated to the gateway before you can create virtual tapes. Use the AddCache operation to add cache storage to a gateway.  

Required Parameters
{
  "TapeBarcodePrefix": "A prefix that you append to the barcode of the virtual tape you are creating. This prefix makes the barcode unique.  The prefix must be 1 to 4 characters in length and must be one of the uppercase letters from A to Z. ",
  "TapeSizeInBytes": "The size, in bytes, of the virtual tapes that you want to create.  The size must be aligned by gigabyte (1024*1024*1024 byte). ",
  "GatewayARN": "The unique Amazon Resource Name (ARN) that represents the gateway to associate the virtual tapes with. Use the ListGateways operation to return a list of gateways for your account and AWS Region.",
  "ClientToken": "A unique identifier that you use to retry a request. If you retry a request, use the same ClientToken you specified in the initial request.  Using the same ClientToken prevents creating the tape multiple times. ",
  "NumTapesToCreate": "The number of virtual tapes that you want to create."
}

Optional Parameters
{
  "KMSEncrypted": "True to use Amazon S3 server side encryption with your own AWS KMS key, or false to use a key managed by Amazon S3. Optional.",
  "Tags": "A list of up to 50 tags that can be assigned to a virtual tape. Each tag is a key-value pair.  Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256. ",
  "KMSKey": "The Amazon Resource Name (ARN) of the AWS KMS key used for Amazon S3 server side encryption. This value can only be set when KMSEncrypted is true. Optional.",
  "PoolId": "The ID of the pool that you want to add your tape to for archiving. The tape in this pool is archived in the S3 storage class that is associated with the pool. When you use your backup application to eject the tape, the tape is archived directly into the storage class (Glacier or Deep Archive) that corresponds to the pool. Valid values: \"GLACIER\", \"DEEP_ARCHIVE\""
}
"""
CreateTapes(args) = storage_gateway("CreateTapes", args)

"""
    UpdateVTLDeviceType()

Updates the type of medium changer in a tape gateway. When you activate a tape gateway, you select a medium changer type for the tape gateway. This operation enables you to select a different type of medium changer after a tape gateway is activated. This operation is only supported in the tape gateway type.

Required Parameters
{
  "DeviceType": "The type of medium changer you want to select.  Valid Values: \"STK-L700\", \"AWS-Gateway-VTL\"",
  "VTLDeviceARN": "The Amazon Resource Name (ARN) of the medium changer you want to select."
}
"""
UpdateVTLDeviceType(args) = storage_gateway("UpdateVTLDeviceType", args)

"""
    DescribeBandwidthRateLimit()

Returns the bandwidth rate limits of a gateway. By default, these limits are not set, which means no bandwidth rate limiting is in effect. This operation is supported for the stored volume, cached volume and tape gateway types.' This operation only returns a value for a bandwidth rate limit only if the limit is set. If no limits are set for the gateway, then this operation returns only the gateway ARN in the response body. To specify which gateway to describe, use the Amazon Resource Name (ARN) of the gateway in your request.

Required Parameters
{
  "GatewayARN": ""
}
"""
DescribeBandwidthRateLimit(args) = storage_gateway("DescribeBandwidthRateLimit", args)

"""
    CreateSnapshot()

Initiates a snapshot of a volume. AWS Storage Gateway provides the ability to back up point-in-time snapshots of your data to Amazon Simple Storage (S3) for durable off-site recovery, as well as import the data to an Amazon Elastic Block Store (EBS) volume in Amazon Elastic Compute Cloud (EC2). You can take snapshots of your gateway volume on a scheduled or ad hoc basis. This API enables you to take ad-hoc snapshot. For more information, see Editing a Snapshot Schedule. In the CreateSnapshot request you identify the volume by providing its Amazon Resource Name (ARN). You must also provide description for the snapshot. When AWS Storage Gateway takes the snapshot of specified volume, the snapshot and description appears in the AWS Storage Gateway Console. In response, AWS Storage Gateway returns you a snapshot ID. You can use this snapshot ID to check the snapshot progress or later use it when you want to create a volume from a snapshot. This operation is only supported in stored and cached volume gateway type.  To list or delete a snapshot, you must use the Amazon EC2 API. For more information, see DescribeSnapshots or DeleteSnapshot in the EC2 API reference.   Volume and snapshot IDs are changing to a longer length ID format. For more information, see the important note on the Welcome page. 

Required Parameters
{
  "VolumeARN": "The Amazon Resource Name (ARN) of the volume. Use the ListVolumes operation to return a list of gateway volumes.",
  "SnapshotDescription": "Textual description of the snapshot that appears in the Amazon EC2 console, Elastic Block Store snapshots panel in the Description field, and in the AWS Storage Gateway snapshot Details pane, Description field"
}

Optional Parameters
{
  "Tags": "A list of up to 50 tags that can be assigned to a snapshot. Each tag is a key-value pair.  Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256. "
}
"""
CreateSnapshot(args) = storage_gateway("CreateSnapshot", args)

"""
    AddUploadBuffer()

Configures one or more gateway local disks as upload buffer for a specified gateway. This operation is supported for the stored volume, cached volume and tape gateway types. In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add upload buffer, and one or more disk IDs that you want to configure as upload buffer.

Required Parameters
{
  "GatewayARN": "",
  "DiskIds": "An array of strings that identify disks that are to be configured as working storage. Each string have a minimum length of 1 and maximum length of 300. You can get the disk IDs from the ListLocalDisks API."
}
"""
AddUploadBuffer(args) = storage_gateway("AddUploadBuffer", args)

"""
    DescribeNFSFileShares()

Gets a description for one or more Network File System (NFS) file shares from a file gateway. This operation is only supported for file gateways.

Required Parameters
{
  "FileShareARNList": "An array containing the Amazon Resource Name (ARN) of each file share to be described. "
}
"""
DescribeNFSFileShares(args) = storage_gateway("DescribeNFSFileShares", args)

"""
    DescribeTapeArchives()

Returns a description of specified virtual tapes in the virtual tape shelf (VTS). This operation is only supported in the tape gateway type. If a specific TapeARN is not specified, AWS Storage Gateway returns a description of all virtual tapes found in the VTS associated with your account.

Optional Parameters
{
  "Marker": "An opaque string that indicates the position at which to begin describing virtual tapes.",
  "TapeARNs": "Specifies one or more unique Amazon Resource Names (ARNs) that represent the virtual tapes you want to describe.",
  "Limit": "Specifies that the number of virtual tapes descried be limited to the specified number."
}
"""
DescribeTapeArchives() = storage_gateway("DescribeTapeArchives")
DescribeTapeArchives(args) = storage_gateway("DescribeTapeArchives", args)

"""
    DeleteFileShare()

Deletes a file share from a file gateway. This operation is only supported for file gateways.

Required Parameters
{
  "FileShareARN": "The Amazon Resource Name (ARN) of the file share to be deleted. "
}

Optional Parameters
{
  "ForceDelete": "If this value is set to true, the operation deletes a file share immediately and aborts all data uploads to AWS. Otherwise, the file share is not deleted until all data is uploaded to AWS. This process aborts the data upload process, and the file share enters the FORCE_DELETING status."
}
"""
DeleteFileShare(args) = storage_gateway("DeleteFileShare", args)

"""
    DeleteTapeArchive()

Deletes the specified virtual tape from the virtual tape shelf (VTS). This operation is only supported in the tape gateway type.

Required Parameters
{
  "TapeARN": "The Amazon Resource Name (ARN) of the virtual tape to delete from the virtual tape shelf (VTS)."
}
"""
DeleteTapeArchive(args) = storage_gateway("DeleteTapeArchive", args)

"""
    UpdateMaintenanceStartTime()

Updates a gateway's weekly maintenance start time information, including day and time of the week. The maintenance time is the time in your gateway's time zone.

Required Parameters
{
  "MinuteOfHour": "The minute component of the maintenance start time represented as mm, where mm is the minute (00 to 59). The minute of the hour is in the time zone of the gateway.",
  "GatewayARN": "",
  "HourOfDay": "The hour component of the maintenance start time represented as hh, where hh is the hour (00 to 23). The hour of the day is in the time zone of the gateway."
}

Optional Parameters
{
  "DayOfWeek": "The day of the week component of the maintenance start time week represented as an ordinal number from 0 to 6, where 0 represents Sunday and 6 Saturday.",
  "DayOfMonth": "The day of the month component of the maintenance start time represented as an ordinal number from 1 to 28, where 1 represents the first day of the month and 28 represents the last day of the month.  This value is only available for tape and volume gateways. "
}
"""
UpdateMaintenanceStartTime(args) = storage_gateway("UpdateMaintenanceStartTime", args)

"""
    DescribeSMBFileShares()

Gets a description for one or more Server Message Block (SMB) file shares from a file gateway. This operation is only supported for file gateways.

Required Parameters
{
  "FileShareARNList": "An array containing the Amazon Resource Name (ARN) of each file share to be described. "
}
"""
DescribeSMBFileShares(args) = storage_gateway("DescribeSMBFileShares", args)

"""
    DeleteGateway()

Deletes a gateway. To specify which gateway to delete, use the Amazon Resource Name (ARN) of the gateway in your request. The operation deletes the gateway; however, it does not delete the gateway virtual machine (VM) from your host computer. After you delete a gateway, you cannot reactivate it. Completed snapshots of the gateway volumes are not deleted upon deleting the gateway, however, pending snapshots will not complete. After you delete a gateway, your next step is to remove it from your environment.  You no longer pay software charges after the gateway is deleted; however, your existing Amazon EBS snapshots persist and you will continue to be billed for these snapshots. You can choose to remove all remaining Amazon EBS snapshots by canceling your Amazon EC2 subscription.  If you prefer not to cancel your Amazon EC2 subscription, you can delete your snapshots using the Amazon EC2 console. For more information, see the  AWS Storage Gateway Detail Page.  

Required Parameters
{
  "GatewayARN": ""
}
"""
DeleteGateway(args) = storage_gateway("DeleteGateway", args)

"""
    DeleteVolume()

Deletes the specified storage volume that you previously created using the CreateCachediSCSIVolume or CreateStorediSCSIVolume API. This operation is only supported in the cached volume and stored volume types. For stored volume gateways, the local disk that was configured as the storage volume is not deleted. You can reuse the local disk to create another storage volume.  Before you delete a volume, make sure there are no iSCSI connections to the volume you are deleting. You should also make sure there is no snapshot in progress. You can use the Amazon Elastic Compute Cloud (Amazon EC2) API to query snapshots on the volume you are deleting and check the snapshot status. For more information, go to DescribeSnapshots in the Amazon Elastic Compute Cloud API Reference. In the request, you must provide the Amazon Resource Name (ARN) of the storage volume you want to delete.

Required Parameters
{
  "VolumeARN": "The Amazon Resource Name (ARN) of the volume. Use the ListVolumes operation to return a list of gateway volumes."
}
"""
DeleteVolume(args) = storage_gateway("DeleteVolume", args)

"""
    DescribeGatewayInformation()

Returns metadata about a gateway such as its name, network interfaces, configured time zone, and the state (whether the gateway is running or not). To specify which gateway to describe, use the Amazon Resource Name (ARN) of the gateway in your request.

Required Parameters
{
  "GatewayARN": ""
}
"""
DescribeGatewayInformation(args) = storage_gateway("DescribeGatewayInformation", args)

"""
    CreateCachediSCSIVolume()

Creates a cached volume on a specified cached volume gateway. This operation is only supported in the cached volume gateway type.  Cache storage must be allocated to the gateway before you can create a cached volume. Use the AddCache operation to add cache storage to a gateway.   In the request, you must specify the gateway, size of the volume in bytes, the iSCSI target name, an IP address on which to expose the target, and a unique client token. In response, the gateway creates the volume and returns information about it. This information includes the volume Amazon Resource Name (ARN), its size, and the iSCSI target ARN that initiators can use to connect to the volume target. Optionally, you can provide the ARN for an existing volume as the SourceVolumeARN for this cached volume, which creates an exact copy of the existing volume’s latest recovery point. The VolumeSizeInBytes value must be equal to or larger than the size of the copied volume, in bytes.

Required Parameters
{
  "VolumeSizeInBytes": "The size of the volume in bytes.",
  "NetworkInterfaceId": "The network interface of the gateway on which to expose the iSCSI target. Only IPv4 addresses are accepted. Use DescribeGatewayInformation to get a list of the network interfaces available on a gateway.  Valid Values: A valid IP address.",
  "GatewayARN": "",
  "ClientToken": "A unique identifier that you use to retry a request. If you retry a request, use the same ClientToken you specified in the initial request.",
  "TargetName": "The name of the iSCSI target used by an initiator to connect to a volume and used as a suffix for the target ARN. For example, specifying TargetName as myvolume results in the target ARN of arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume. The target name must be unique across all volumes on a gateway. If you don't specify a value, Storage Gateway uses the value that was previously used for this volume as the new target name."
}

Optional Parameters
{
  "KMSEncrypted": "True to use Amazon S3 server side encryption with your own AWS KMS key, or false to use a key managed by Amazon S3. Optional.",
  "SnapshotId": "The snapshot ID (e.g. \"snap-1122aabb\") of the snapshot to restore as the new cached volume. Specify this field if you want to create the iSCSI storage volume from a snapshot otherwise do not include this field. To list snapshots for your account use DescribeSnapshots in the Amazon Elastic Compute Cloud API Reference.",
  "Tags": "A list of up to 50 tags that you can assign to a cached volume. Each tag is a key-value pair.  Valid characters for key and value are letters, spaces, and numbers that you can represent in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256 characters. ",
  "KMSKey": "The Amazon Resource Name (ARN) of the AWS KMS key used for Amazon S3 server side encryption. This value can only be set when KMSEncrypted is true. Optional.",
  "SourceVolumeARN": "The ARN for an existing volume. Specifying this ARN makes the new volume into an exact copy of the specified existing volume's latest recovery point. The VolumeSizeInBytes value for this new volume must be equal to or larger than the size of the existing volume, in bytes."
}
"""
CreateCachediSCSIVolume(args) = storage_gateway("CreateCachediSCSIVolume", args)

"""
    ListVolumeInitiators()

Lists iSCSI initiators that are connected to a volume. You can use this operation to determine whether a volume is being used or not. This operation is only supported in the cached volume and stored volume gateway types.

Required Parameters
{
  "VolumeARN": "The Amazon Resource Name (ARN) of the volume. Use the ListVolumes operation to return a list of gateway volumes for the gateway."
}
"""
ListVolumeInitiators(args) = storage_gateway("ListVolumeInitiators", args)
