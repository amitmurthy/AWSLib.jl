include("../AWSServices.jl")
using .AWSServices: frauddetector

"""
    GetOutcomes()

Gets one or more outcomes. This is a paginated API. If you provide a null maxSizePerPage, this actions retrieves a maximum of 10 records per page. If you provide a maxSizePerPage, the value must be between 50 and 100. To get the next page results, provide the pagination token from the GetOutcomesResult as part of your request. A null pagination token fetches the records from the beginning. 

Optional Parameters
{
  "name": "The name of the outcome or outcomes to get.",
  "maxResults": "The maximum number of objects to return for the request. ",
  "nextToken": "The next page token for the request. "
}
"""
GetOutcomes() = frauddetector("GetOutcomes")
GetOutcomes(args) = frauddetector("GetOutcomes", args)

"""
    DescribeDetector()

Gets all versions for a specified detector.

Required Parameters
{
  "detectorId": "The detector ID."
}

Optional Parameters
{
  "maxResults": "The maximum number of results to return for the request.",
  "nextToken": "The next token from the previous response."
}
"""
DescribeDetector(args) = frauddetector("DescribeDetector", args)

"""
    GetModelVersion()

Gets a model version. 

Required Parameters
{
  "modelType": "The model type. ",
  "modelVersionNumber": "The model version. ",
  "modelId": "The model ID. "
}
"""
GetModelVersion(args) = frauddetector("GetModelVersion", args)

"""
    DeleteEvent()

Deletes the specified event.

Required Parameters
{
  "eventId": "The ID of the event to delete."
}
"""
DeleteEvent(args) = frauddetector("DeleteEvent", args)

"""
    GetVariables()

Gets all of the variables or the specific variable. This is a paginated API. Providing null maxSizePerPage results in retrieving maximum of 100 records per page. If you provide maxSizePerPage the value must be between 50 and 100. To get the next page result, a provide a pagination token from GetVariablesResult as part of your request. Null pagination token fetches the records from the beginning. 

Optional Parameters
{
  "name": "The name of the variable. ",
  "maxResults": "The max size per page determined for the get variable request. ",
  "nextToken": "The next page token of the get variable request. "
}
"""
GetVariables() = frauddetector("GetVariables")
GetVariables(args) = frauddetector("GetVariables", args)

"""
    UpdateDetectorVersionMetadata()

Updates the detector version's description. You can update the metadata for any detector version (DRAFT, ACTIVE, or INACTIVE). 

Required Parameters
{
  "detectorId": "The detector ID.",
  "detectorVersionId": "The detector version ID. ",
  "description": "The description."
}
"""
UpdateDetectorVersionMetadata(args) = frauddetector("UpdateDetectorVersionMetadata", args)

"""
    PutModel()

Creates or updates a model. 

Required Parameters
{
  "modelType": "The model type. ",
  "modelVariables": "The model input variables.",
  "trainingDataSource": "The training data source location in Amazon S3. ",
  "labelSchema": "The label schema.",
  "modelId": "The model ID."
}

Optional Parameters
{
  "description": "The model description. "
}
"""
PutModel(args) = frauddetector("PutModel", args)

"""
    BatchCreateVariable()

Creates a batch of variables.

Required Parameters
{
  "variableEntries": "The list of variables for the batch create variable request."
}
"""
BatchCreateVariable(args) = frauddetector("BatchCreateVariable", args)

"""
    CreateVariable()

Creates a variable.

Required Parameters
{
  "name": "The name of the variable.",
  "dataSource": "The source of the data.",
  "dataType": "The data type.",
  "defaultValue": "The default value for the variable when no value is received."
}

Optional Parameters
{
  "variableType": "The variable type.",
  "description": "The description."
}
"""
CreateVariable(args) = frauddetector("CreateVariable", args)

"""
    GetExternalModels()

Gets the details for one or more Amazon SageMaker models that have been imported into the service. This is a paginated API. If you provide a null maxSizePerPage, this actions retrieves a maximum of 10 records per page. If you provide a maxSizePerPage, the value must be between 5 and 10. To get the next page results, provide the pagination token from the GetExternalModelsResult as part of your request. A null pagination token fetches the records from the beginning. 

Optional Parameters
{
  "modelEndpoint": "The Amazon SageMaker model endpoint.",
  "maxResults": "The maximum number of objects to return for the request.",
  "nextToken": "The next page token for the request."
}
"""
GetExternalModels() = frauddetector("GetExternalModels")
GetExternalModels(args) = frauddetector("GetExternalModels", args)

"""
    CreateRule()

Creates a rule for use with the specified detector. 

Required Parameters
{
  "detectorId": "The detector ID for the rule's parent detector.",
  "ruleId": "The rule ID.",
  "expression": "The rule expression.",
  "language": "The language of the rule.",
  "outcomes": "The outcome or outcomes returned when the rule expression matches."
}

Optional Parameters
{
  "description": "The rule description."
}
"""
CreateRule(args) = frauddetector("CreateRule", args)

"""
    PutOutcome()

Creates or updates an outcome. 

Required Parameters
{
  "name": "The name of the outcome."
}

Optional Parameters
{
  "description": "The outcome description."
}
"""
PutOutcome(args) = frauddetector("PutOutcome", args)

"""
    CreateModelVersion()

Creates a version of the model using the specified model type. 

Required Parameters
{
  "modelType": "The model type.",
  "modelId": "The model ID. "
}

Optional Parameters
{
  "description": "The model version description."
}
"""
CreateModelVersion(args) = frauddetector("CreateModelVersion", args)

"""
    GetModels()

Gets all of the models for the AWS account, or the specified model type, or gets a single model for the specified model type, model ID combination. 

Optional Parameters
{
  "modelType": "The model type.",
  "modelId": "The model ID.",
  "maxResults": "The maximum results to return for the request.",
  "nextToken": "The next token for the request."
}
"""
GetModels() = frauddetector("GetModels")
GetModels(args) = frauddetector("GetModels", args)

"""
    GetPrediction()

Evaluates an event against a detector version. If a version ID is not provided, the detector’s (ACTIVE) version is used. 

Required Parameters
{
  "detectorId": "The detector ID. ",
  "eventId": "The unique ID used to identify the event."
}

Optional Parameters
{
  "externalModelEndpointDataBlobs": "The Amazon SageMaker model endpoint input data blobs.",
  "detectorVersionId": "The detector version ID.",
  "eventAttributes": "Names of variables you defined in Amazon Fraud Detector to represent event data elements and their corresponding values for the event you are sending for evaluation."
}
"""
GetPrediction(args) = frauddetector("GetPrediction", args)

"""
    UpdateDetectorVersionStatus()

Updates the detector version’s status. You can perform the following promotions or demotions using UpdateDetectorVersionStatus: DRAFT to ACTIVE, ACTIVE to INACTIVE, and INACTIVE to ACTIVE.

Required Parameters
{
  "detectorId": "The detector ID. ",
  "detectorVersionId": "The detector version ID. ",
  "status": "The new status."
}
"""
UpdateDetectorVersionStatus(args) = frauddetector("UpdateDetectorVersionStatus", args)

"""
    UpdateVariable()

Updates a variable.

Required Parameters
{
  "name": "The name of the variable."
}

Optional Parameters
{
  "variableType": "The variable type.",
  "defaultValue": "The new default value of the variable.",
  "description": "The new description."
}
"""
UpdateVariable(args) = frauddetector("UpdateVariable", args)

"""
    GetRules()

Gets all rules available for the specified detector.

Required Parameters
{
  "detectorId": "The detector ID."
}

Optional Parameters
{
  "ruleId": "The rule ID.",
  "ruleVersion": "The rule version.",
  "maxResults": "The maximum number of rules to return for the request.",
  "nextToken": "The next page token."
}
"""
GetRules(args) = frauddetector("GetRules", args)

"""
    DescribeModelVersions()

Gets all of the model versions for the specified model type or for the specified model type and model ID. You can also get details for a single, specified model version. 

Optional Parameters
{
  "modelType": "The model type.",
  "modelVersionNumber": "The model version. ",
  "modelId": "The model ID.",
  "maxResults": "The maximum number of results to return.",
  "nextToken": "The next token from the previous results."
}
"""
DescribeModelVersions() = frauddetector("DescribeModelVersions")
DescribeModelVersions(args) = frauddetector("DescribeModelVersions", args)

"""
    UpdateDetectorVersion()

 Updates a detector version. The detector version attributes that you can update include models, external model endpoints, rules, and description. You can only update a DRAFT detector version.

Required Parameters
{
  "detectorId": "The parent detector ID for the detector version you want to update.",
  "externalModelEndpoints": "The Amazon SageMaker model endpoints to include in the detector version.",
  "detectorVersionId": "The detector version ID. ",
  "rules": "The rules to include in the detector version."
}

Optional Parameters
{
  "modelVersions": "The model versions to include in the detector version.",
  "description": "The detector version description. "
}
"""
UpdateDetectorVersion(args) = frauddetector("UpdateDetectorVersion", args)

"""
    GetDetectorVersion()

Gets a particular detector version. 

Required Parameters
{
  "detectorId": "The detector ID.",
  "detectorVersionId": "The detector version ID."
}
"""
GetDetectorVersion(args) = frauddetector("GetDetectorVersion", args)

"""
    DeleteDetectorVersion()

Deletes the detector version.

Required Parameters
{
  "detectorId": "The ID of the parent detector for the detector version to delete.",
  "detectorVersionId": "The ID of the detector version to delete."
}
"""
DeleteDetectorVersion(args) = frauddetector("DeleteDetectorVersion", args)

"""
    UpdateModelVersion()

Updates a model version. You can update the description and status attributes using this action. You can perform the following status updates:    Change the TRAINING_COMPLETE status to ACTIVE    Change ACTIVE back to TRAINING_COMPLETE   

Required Parameters
{
  "modelType": "The model type.",
  "modelVersionNumber": "The model version.",
  "status": "The new model status.",
  "modelId": "The model ID.",
  "description": "The model description."
}
"""
UpdateModelVersion(args) = frauddetector("UpdateModelVersion", args)

"""
    PutDetector()

Creates or updates a detector. 

Required Parameters
{
  "detectorId": "The detector ID. "
}

Optional Parameters
{
  "description": "The description of the detector."
}
"""
PutDetector(args) = frauddetector("PutDetector", args)

"""
    UpdateRuleMetadata()

Updates a rule's metadata. 

Required Parameters
{
  "rule": "The rule to update.",
  "description": "The rule description."
}
"""
UpdateRuleMetadata(args) = frauddetector("UpdateRuleMetadata", args)

"""
    BatchGetVariable()

Gets a batch of variables.

Required Parameters
{
  "names": "The list of variable names to get."
}
"""
BatchGetVariable(args) = frauddetector("BatchGetVariable", args)

"""
    PutExternalModel()

Creates or updates an Amazon SageMaker model endpoint. You can also use this action to update the configuration of the model endpoint, including the IAM role and/or the mapped variables. 

Required Parameters
{
  "modelEndpoint": "The model endpoints name.",
  "role": "The IAM role used to invoke the model endpoint.",
  "modelEndpointStatus": "The model endpoint’s status in Amazon Fraud Detector.",
  "outputConfiguration": "The model endpoint output configuration.",
  "modelSource": "The source of the model.",
  "inputConfiguration": "The model endpoint input configuration."
}
"""
PutExternalModel(args) = frauddetector("PutExternalModel", args)

"""
    UpdateRuleVersion()

Updates a rule version resulting in a new rule version. 

Required Parameters
{
  "expression": "The rule expression.",
  "language": "The language.",
  "outcomes": "The outcomes.",
  "rule": "The rule to update."
}

Optional Parameters
{
  "description": "The description."
}
"""
UpdateRuleVersion(args) = frauddetector("UpdateRuleVersion", args)

"""
    CreateDetectorVersion()

Creates a detector version. The detector version starts in a DRAFT status.

Required Parameters
{
  "detectorId": "The ID of the detector under which you want to create a new version.",
  "rules": "The rules to include in the detector version."
}

Optional Parameters
{
  "externalModelEndpoints": "The Amazon Sagemaker model endpoints to include in the detector version.",
  "modelVersions": "The model versions to include in the detector version.",
  "description": "The description of the detector version."
}
"""
CreateDetectorVersion(args) = frauddetector("CreateDetectorVersion", args)

"""
    GetDetectors()

Gets all of detectors. This is a paginated API. If you provide a null maxSizePerPage, this actions retrieves a maximum of 10 records per page. If you provide a maxSizePerPage, the value must be between 5 and 10. To get the next page results, provide the pagination token from the GetEventTypesResponse as part of your request. A null pagination token fetches the records from the beginning. 

Optional Parameters
{
  "detectorId": "The detector ID.",
  "maxResults": "The maximum number of objects to return for the request.",
  "nextToken": "The next token for the subsequent request."
}
"""
GetDetectors() = frauddetector("GetDetectors")
GetDetectors(args) = frauddetector("GetDetectors", args)
