# This file is auto-generated by AWSMetadata.jl
include("../AWSServices.jl")
using .AWSServices: robomaker

"""
    CancelSimulationJobBatch()

Cancels a simulation job batch. When you cancel a simulation job batch, you are also cancelling all of the active simulation jobs created as part of the batch. 

Required Parameters
{
  "batch": "The id of the batch to cancel."
}
"""
CancelSimulationJobBatch(args) = robomaker("POST", "/cancelSimulationJobBatch", args)

"""
    DescribeRobotApplication()

Describes a robot application.

Required Parameters
{
  "application": "The Amazon Resource Name (ARN) of the robot application."
}

Optional Parameters
{
  "applicationVersion": "The version of the robot application to describe."
}
"""
DescribeRobotApplication(args) = robomaker("POST", "/describeRobotApplication", args)

"""
    ListRobots()

Returns a list of robots. You can optionally provide filters to retrieve specific robots.

Optional Parameters
{
  "filters": "Optional filters to limit results. The filter names status and fleetName are supported. When filtering, you must use the complete value of the filtered item. You can use up to three filters, but they must be for the same named item. For example, if you are looking for items with the status Registered or the status Available.",
  "maxResults": "When this parameter is used, ListRobots only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another ListRobots request with the returned nextToken value. This value can be between 1 and 200. If this parameter is not used, then ListRobots returns up to 200 results and a nextToken value if applicable. ",
  "nextToken": "The nextToken value returned from a previous paginated ListRobots request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value. "
}
"""
ListRobots() = robomaker("POST", "/listRobots")
ListRobots(args) = robomaker("POST", "/listRobots", args)

"""
    DescribeDeploymentJob()

Describes a deployment job.

Required Parameters
{
  "job": "The Amazon Resource Name (ARN) of the deployment job."
}
"""
DescribeDeploymentJob(args) = robomaker("POST", "/describeDeploymentJob", args)

"""
    CreateRobot()

Creates a robot.

Required Parameters
{
  "name": "The name for the robot.",
  "architecture": "The target architecture of the robot.",
  "greengrassGroupId": "The Greengrass group id."
}

Optional Parameters
{
  "tags": "A map that contains tag keys and tag values that are attached to the robot."
}
"""
CreateRobot(args) = robomaker("POST", "/createRobot", args)

"""
    ListTagsForResource()

Lists all tags on a AWS RoboMaker resource.

Required Parameters
{
  "resourceArn": "The AWS RoboMaker Amazon Resource Name (ARN) with tags to be listed."
}
"""
ListTagsForResource(args) = robomaker("GET", "/tags/{resourceArn}", args)

"""
    CreateRobotApplicationVersion()

Creates a version of a robot application.

Required Parameters
{
  "application": "The application information for the robot application."
}

Optional Parameters
{
  "currentRevisionId": "The current revision id for the robot application. If you provide a value and it matches the latest revision ID, a new version will be created."
}
"""
CreateRobotApplicationVersion(args) = robomaker("POST", "/createRobotApplicationVersion", args)

"""
    CreateSimulationJob()

Creates a simulation job.  After 90 days, simulation jobs expire and will be deleted. They will no longer be accessible.  

Required Parameters
{
  "maxJobDurationInSeconds": "The maximum simulation job duration in seconds (up to 14 days or 1,209,600 seconds. When maxJobDurationInSeconds is reached, the simulation job will status will transition to Completed.",
  "iamRole": "The IAM role name that allows the simulation instance to call the AWS APIs that are specified in its associated policies on your behalf. This is how credentials are passed in to your simulation job. "
}

Optional Parameters
{
  "simulationApplications": "The simulation application to use in the simulation job.",
  "robotApplications": "The robot application to use in the simulation job.",
  "vpcConfig": "If your simulation job accesses resources in a VPC, you provide this parameter identifying the list of security group IDs and subnet IDs. These must belong to the same VPC. You must provide at least one security group and one subnet ID. ",
  "clientRequestToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.",
  "failureBehavior": "The failure behavior the simulation job.  Continue  Restart the simulation job in the same host instance.  Fail  Stop the simulation job and terminate the instance.  ",
  "outputLocation": "Location for output files generated by the simulation job.",
  "tags": "A map that contains tag keys and tag values that are attached to the simulation job.",
  "dataSources": "Specify data sources to mount read-only files from S3 into your simulation. These files are available under /opt/robomaker/datasources/data_source_name.   There is a limit of 100 files and a combined size of 25GB for all DataSourceConfig objects.  ",
  "loggingConfig": "The logging configuration."
}
"""
CreateSimulationJob(args) = robomaker("POST", "/createSimulationJob", args)

"""
    ListSimulationApplications()

Returns a list of simulation applications. You can optionally provide filters to retrieve specific simulation applications. 

Optional Parameters
{
  "filters": "Optional list of filters to limit results. The filter name name is supported. When filtering, you must use the complete value of the filtered item. You can use up to three filters.",
  "maxResults": "When this parameter is used, ListSimulationApplications only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another ListSimulationApplications request with the returned nextToken value. This value can be between 1 and 100. If this parameter is not used, then ListSimulationApplications returns up to 100 results and a nextToken value if applicable. ",
  "nextToken": "The nextToken value returned from a previous paginated ListSimulationApplications request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value. ",
  "versionQualifier": "The version qualifier of the simulation application."
}
"""
ListSimulationApplications() = robomaker("POST", "/listSimulationApplications")
ListSimulationApplications(args) = robomaker("POST", "/listSimulationApplications", args)

"""
    BatchDescribeSimulationJob()

Describes one or more simulation jobs.

Required Parameters
{
  "jobs": "A list of Amazon Resource Names (ARNs) of simulation jobs to describe."
}
"""
BatchDescribeSimulationJob(args) = robomaker("POST", "/batchDescribeSimulationJob", args)

"""
    ListRobotApplications()

Returns a list of robot application. You can optionally provide filters to retrieve specific robot applications.

Optional Parameters
{
  "filters": "Optional filters to limit results. The filter name name is supported. When filtering, you must use the complete value of the filtered item. You can use up to three filters.",
  "maxResults": "When this parameter is used, ListRobotApplications only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another ListRobotApplications request with the returned nextToken value. This value can be between 1 and 100. If this parameter is not used, then ListRobotApplications returns up to 100 results and a nextToken value if applicable. ",
  "nextToken": "The nextToken value returned from a previous paginated ListRobotApplications request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value. ",
  "versionQualifier": "The version qualifier of the robot application."
}
"""
ListRobotApplications() = robomaker("POST", "/listRobotApplications")
ListRobotApplications(args) = robomaker("POST", "/listRobotApplications", args)

"""
    SyncDeploymentJob()

Syncrhonizes robots in a fleet to the latest deployment. This is helpful if robots were added after a deployment.

Required Parameters
{
  "fleet": "The target fleet for the synchronization.",
  "clientRequestToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the request."
}
"""
SyncDeploymentJob(args) = robomaker("POST", "/syncDeploymentJob", args)

"""
    DescribeFleet()

Describes a fleet.

Required Parameters
{
  "fleet": "The Amazon Resource Name (ARN) of the fleet."
}
"""
DescribeFleet(args) = robomaker("POST", "/describeFleet", args)

"""
    CancelDeploymentJob()

Cancels the specified deployment job.

Required Parameters
{
  "job": "The deployment job ARN to cancel."
}
"""
CancelDeploymentJob(args) = robomaker("POST", "/cancelDeploymentJob", args)

"""
    ListDeploymentJobs()

Returns a list of deployment jobs for a fleet. You can optionally provide filters to retrieve specific deployment jobs. 

Optional Parameters
{
  "filters": "Optional filters to limit results. The filter names status and fleetName are supported. When filtering, you must use the complete value of the filtered item. You can use up to three filters, but they must be for the same named item. For example, if you are looking for items with the status InProgress or the status Pending.",
  "maxResults": "When this parameter is used, ListDeploymentJobs only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another ListDeploymentJobs request with the returned nextToken value. This value can be between 1 and 200. If this parameter is not used, then ListDeploymentJobs returns up to 200 results and a nextToken value if applicable. ",
  "nextToken": "The nextToken value returned from a previous paginated ListDeploymentJobs request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value. "
}
"""
ListDeploymentJobs() = robomaker("POST", "/listDeploymentJobs")
ListDeploymentJobs(args) = robomaker("POST", "/listDeploymentJobs", args)

"""
    DeleteSimulationApplication()

Deletes a simulation application.

Required Parameters
{
  "application": "The application information for the simulation application to delete."
}

Optional Parameters
{
  "applicationVersion": "The version of the simulation application to delete."
}
"""
DeleteSimulationApplication(args) = robomaker("POST", "/deleteSimulationApplication", args)

"""
    ListFleets()

Returns a list of fleets. You can optionally provide filters to retrieve specific fleets. 

Optional Parameters
{
  "filters": "Optional filters to limit results. The filter name name is supported. When filtering, you must use the complete value of the filtered item. You can use up to three filters.",
  "maxResults": "When this parameter is used, ListFleets only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another ListFleets request with the returned nextToken value. This value can be between 1 and 200. If this parameter is not used, then ListFleets returns up to 200 results and a nextToken value if applicable. ",
  "nextToken": "The nextToken value returned from a previous paginated ListFleets request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value.   This token should be treated as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes. "
}
"""
ListFleets() = robomaker("POST", "/listFleets")
ListFleets(args) = robomaker("POST", "/listFleets", args)

"""
    DeleteRobot()

Deletes a robot.

Required Parameters
{
  "robot": "The Amazon Resource Name (ARN) of the robot."
}
"""
DeleteRobot(args) = robomaker("POST", "/deleteRobot", args)

"""
    ListSimulationJobs()

Returns a list of simulation jobs. You can optionally provide filters to retrieve specific simulation jobs. 

Optional Parameters
{
  "filters": "Optional filters to limit results. The filter names status and simulationApplicationName and robotApplicationName are supported. When filtering, you must use the complete value of the filtered item. You can use up to three filters, but they must be for the same named item. For example, if you are looking for items with the status Preparing or the status Running.",
  "maxResults": "When this parameter is used, ListSimulationJobs only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another ListSimulationJobs request with the returned nextToken value. This value can be between 1 and 1000. If this parameter is not used, then ListSimulationJobs returns up to 1000 results and a nextToken value if applicable. ",
  "nextToken": "The nextToken value returned from a previous paginated ListSimulationJobs request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value.   This token should be treated as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes. "
}
"""
ListSimulationJobs() = robomaker("POST", "/listSimulationJobs")
ListSimulationJobs(args) = robomaker("POST", "/listSimulationJobs", args)

"""
    RestartSimulationJob()

Restarts a running simulation job.

Required Parameters
{
  "job": "The Amazon Resource Name (ARN) of the simulation job."
}
"""
RestartSimulationJob(args) = robomaker("POST", "/restartSimulationJob", args)

"""
    CreateRobotApplication()

Creates a robot application. 

Required Parameters
{
  "name": "The name of the robot application.",
  "sources": "The sources of the robot application.",
  "robotSoftwareSuite": "The robot software suite (ROS distribuition) used by the robot application."
}

Optional Parameters
{
  "tags": "A map that contains tag keys and tag values that are attached to the robot application."
}
"""
CreateRobotApplication(args) = robomaker("POST", "/createRobotApplication", args)

"""
    CancelSimulationJob()

Cancels the specified simulation job.

Required Parameters
{
  "job": "The simulation job ARN to cancel."
}
"""
CancelSimulationJob(args) = robomaker("POST", "/cancelSimulationJob", args)

"""
    RegisterRobot()

Registers a robot with a fleet.

Required Parameters
{
  "robot": "The Amazon Resource Name (ARN) of the robot.",
  "fleet": "The Amazon Resource Name (ARN) of the fleet."
}
"""
RegisterRobot(args) = robomaker("POST", "/registerRobot", args)

"""
    DeregisterRobot()

Deregisters a robot.

Required Parameters
{
  "robot": "The Amazon Resource Name (ARN) of the robot.",
  "fleet": "The Amazon Resource Name (ARN) of the fleet."
}
"""
DeregisterRobot(args) = robomaker("POST", "/deregisterRobot", args)

"""
    StartSimulationJobBatch()

Starts a new simulation job batch. The batch is defined using one or more SimulationJobRequest objects. 

Required Parameters
{
  "createSimulationJobRequests": "A list of simulation job requests to create in the batch."
}

Optional Parameters
{
  "clientRequestToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.",
  "batchPolicy": "The batch policy.",
  "tags": "A map that contains tag keys and tag values that are attached to the deployment job batch."
}
"""
StartSimulationJobBatch(args) = robomaker("POST", "/startSimulationJobBatch", args)

"""
    TagResource()

Adds or edits tags for a AWS RoboMaker resource. Each tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty strings.  For information about the rules that apply to tag keys and tag values, see User-Defined Tag Restrictions in the AWS Billing and Cost Management User Guide. 

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the AWS RoboMaker resource you are tagging.",
  "tags": "A map that contains tag keys and tag values that are attached to the resource."
}
"""
TagResource(args) = robomaker("POST", "/tags/{resourceArn}", args)

"""
    DescribeSimulationJob()

Describes a simulation job.

Required Parameters
{
  "job": "The Amazon Resource Name (ARN) of the simulation job to be described."
}
"""
DescribeSimulationJob(args) = robomaker("POST", "/describeSimulationJob", args)

"""
    CreateSimulationApplicationVersion()

Creates a simulation application with a specific revision id.

Required Parameters
{
  "application": "The application information for the simulation application."
}

Optional Parameters
{
  "currentRevisionId": "The current revision id for the simulation application. If you provide a value and it matches the latest revision ID, a new version will be created."
}
"""
CreateSimulationApplicationVersion(args) = robomaker("POST", "/createSimulationApplicationVersion", args)

"""
    DeleteFleet()

Deletes a fleet.

Required Parameters
{
  "fleet": "The Amazon Resource Name (ARN) of the fleet."
}
"""
DeleteFleet(args) = robomaker("POST", "/deleteFleet", args)

"""
    CreateSimulationApplication()

Creates a simulation application.

Required Parameters
{
  "name": "The name of the simulation application.",
  "simulationSoftwareSuite": "The simulation software suite used by the simulation application.",
  "sources": "The sources of the simulation application.",
  "robotSoftwareSuite": "The robot software suite (ROS distribution) used by the simulation application."
}

Optional Parameters
{
  "renderingEngine": "The rendering engine for the simulation application.",
  "tags": "A map that contains tag keys and tag values that are attached to the simulation application."
}
"""
CreateSimulationApplication(args) = robomaker("POST", "/createSimulationApplication", args)

"""
    UntagResource()

Removes the specified tags from the specified AWS RoboMaker resource. To remove a tag, specify the tag key. To change the tag value of an existing tag key, use  TagResource . 

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the AWS RoboMaker resource you are removing tags.",
  "tagKeys": "A map that contains tag keys and tag values that will be unattached from the resource."
}
"""
UntagResource(args) = robomaker("DELETE", "/tags/{resourceArn}", args)

"""
    UpdateSimulationApplication()

Updates a simulation application.

Required Parameters
{
  "application": "The application information for the simulation application.",
  "simulationSoftwareSuite": "The simulation software suite used by the simulation application.",
  "sources": "The sources of the simulation application.",
  "robotSoftwareSuite": "Information about the robot software suite (ROS distribution)."
}

Optional Parameters
{
  "currentRevisionId": "The revision id for the robot application.",
  "renderingEngine": "The rendering engine for the simulation application."
}
"""
UpdateSimulationApplication(args) = robomaker("POST", "/updateSimulationApplication", args)

"""
    UpdateRobotApplication()

Updates a robot application.

Required Parameters
{
  "application": "The application information for the robot application.",
  "sources": "The sources of the robot application.",
  "robotSoftwareSuite": "The robot software suite (ROS distribution) used by the robot application."
}

Optional Parameters
{
  "currentRevisionId": "The revision id for the robot application."
}
"""
UpdateRobotApplication(args) = robomaker("POST", "/updateRobotApplication", args)

"""
    DescribeSimulationJobBatch()

Describes a simulation job batch.

Required Parameters
{
  "batch": "The id of the batch to describe."
}
"""
DescribeSimulationJobBatch(args) = robomaker("POST", "/describeSimulationJobBatch", args)

"""
    DescribeRobot()

Describes a robot.

Required Parameters
{
  "robot": "The Amazon Resource Name (ARN) of the robot to be described."
}
"""
DescribeRobot(args) = robomaker("POST", "/describeRobot", args)

"""
    CreateDeploymentJob()

Deploys a specific version of a robot application to robots in a fleet. The robot application must have a numbered applicationVersion for consistency reasons. To create a new version, use CreateRobotApplicationVersion or see Creating a Robot Application Version.   After 90 days, deployment jobs expire and will be deleted. They will no longer be accessible.  

Required Parameters
{
  "fleet": "The Amazon Resource Name (ARN) of the fleet to deploy.",
  "clientRequestToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.",
  "deploymentApplicationConfigs": "The deployment application configuration."
}

Optional Parameters
{
  "deploymentConfig": "The requested deployment configuration.",
  "tags": "A map that contains tag keys and tag values that are attached to the deployment job."
}
"""
CreateDeploymentJob(args) = robomaker("POST", "/createDeploymentJob", args)

"""
    ListSimulationJobBatches()

Returns a list simulation job batches. You can optionally provide filters to retrieve specific simulation batch jobs. 

Optional Parameters
{
  "filters": "Optional filters to limit results.",
  "maxResults": "When this parameter is used, ListSimulationJobBatches only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another ListSimulationJobBatches request with the returned nextToken value. ",
  "nextToken": "The nextToken value returned from a previous paginated ListSimulationJobBatches request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value. "
}
"""
ListSimulationJobBatches() = robomaker("POST", "/listSimulationJobBatches")
ListSimulationJobBatches(args) = robomaker("POST", "/listSimulationJobBatches", args)

"""
    CreateFleet()

Creates a fleet, a logical group of robots running the same robot application.

Required Parameters
{
  "name": "The name of the fleet."
}

Optional Parameters
{
  "tags": "A map that contains tag keys and tag values that are attached to the fleet."
}
"""
CreateFleet(args) = robomaker("POST", "/createFleet", args)

"""
    DescribeSimulationApplication()

Describes a simulation application.

Required Parameters
{
  "application": "The application information for the simulation application."
}

Optional Parameters
{
  "applicationVersion": "The version of the simulation application to describe."
}
"""
DescribeSimulationApplication(args) = robomaker("POST", "/describeSimulationApplication", args)

"""
    DeleteRobotApplication()

Deletes a robot application.

Required Parameters
{
  "application": "The Amazon Resource Name (ARN) of the the robot application."
}

Optional Parameters
{
  "applicationVersion": "The version of the robot application to delete."
}
"""
DeleteRobotApplication(args) = robomaker("POST", "/deleteRobotApplication", args)
