include("../AWSServices.jl")
using .AWSServices: mobile_analytics

"""
    PutEvents()

The PutEvents operation records one or more events. You can have up to 1,500 unique custom events per app, any combination of up to 40 attributes and metrics per custom event, and any number of attribute or metric values.

Required Parameters
{
  "events": "An array of Event JSON objects",
  "clientContext": "The client context including the client ID, app title, app version and package name."
}

Optional Parameters
{
  "clientContextEncoding": "The encoding used for the client context."
}
"""
PutEvents(args) = mobile_analytics("POST", "/2014-06-05/events", args)
