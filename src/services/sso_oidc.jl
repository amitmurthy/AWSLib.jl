# This file is auto-generated by AWSMetadata.jl
include("../AWSServices.jl")
using .AWSServices: sso_oidc

"""
    CreateToken()

Creates and returns an access token for the authorized client. The access token issued will be used to fetch short-term credentials for the assigned roles in the AWS account.

Required Parameters
{
  "deviceCode": "Used only when calling this API for the device code grant type. This short-term code is used to identify this authentication attempt. This should come from an in-memory reference to the result of the StartDeviceAuthorization API.",
  "grantType": "Supports grant types for authorization code, refresh token, and device code request.",
  "clientId": "The unique identifier string for each client. This value should come from the persisted result of the RegisterClient API.",
  "clientSecret": "A secret string generated for the client. This value should come from the persisted result of the RegisterClient API."
}

Optional Parameters
{
  "refreshToken": "The token used to obtain an access token in the event that the access token is invalid or expired. This token is not issued by the service.",
  "scope": "The list of scopes that is defined by the client. Upon authorization, this list is used to restrict permissions when granting an access token.",
  "code": "The authorization code received from the authorization service. This parameter is required to perform an authorization grant request to get access to a token.",
  "redirectUri": "The location of the application that will receive the authorization code. Users authorize the service to send the request to this location."
}
"""
CreateToken(args) = sso_oidc("POST", "/token", args)

"""
    StartDeviceAuthorization()

Initiates device authorization by requesting a pair of verification codes from the authorization service.

Required Parameters
{
  "startUrl": "The URL for the AWS SSO user portal. For more information, see Using the User Portal in the AWS Single Sign-On User Guide.",
  "clientId": "The unique identifier string for the client that is registered with AWS SSO. This value should come from the persisted result of the RegisterClient API operation.",
  "clientSecret": "A secret string that is generated for the client. This value should come from the persisted result of the RegisterClient API operation."
}
"""
StartDeviceAuthorization(args) = sso_oidc("POST", "/device_authorization", args)

"""
    RegisterClient()

Registers a client with AWS SSO. This allows clients to initiate device authorization. The output should be persisted for reuse through many authentication requests.

Required Parameters
{
  "clientType": "The type of client. The service supports only public as a client type. Anything other than public will be rejected by the service.",
  "clientName": "The friendly name of the client."
}

Optional Parameters
{
  "scopes": "The list of scopes that are defined by the client. Upon authorization, this list is used to restrict permissions when granting an access token."
}
"""
RegisterClient(args) = sso_oidc("POST", "/client/register", args)