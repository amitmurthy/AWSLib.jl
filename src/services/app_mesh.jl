include("../AWSServices.jl")
using .AWSServices: app_mesh

"""
    ListTagsForResource()

List the tags for an App Mesh resource.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) that identifies the resource to list the tags for."
}

Optional Parameters
{
  "nextToken": "The nextToken value returned from a previous paginated\n            ListTagsForResource request where limit was used and the\n         results exceeded the value of that parameter. Pagination continues from the end of the\n         previous results that returned the nextToken value.",
  "limit": "The maximum number of tag results returned by ListTagsForResource in\n         paginated output. When this parameter is used, ListTagsForResource returns\n         only limit results in a single page along with a nextToken\n         response element. You can see the remaining results of the initial request by sending\n         another ListTagsForResource request with the returned nextToken\n         value. This value can be between 1 and 100. If you don't use\n         this parameter, ListTagsForResource returns up to 100\n         results and a nextToken value if applicable."
}
"""
ListTagsForResource(args) = app_mesh("GET", "/v20190125/tags", args)

"""
    DescribeMesh()

Describes an existing service mesh.

Required Parameters
{
  "meshName": "The name of the service mesh to describe."
}

Optional Parameters
{
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
DescribeMesh(args) = app_mesh("GET", "/v20190125/meshes/{meshName}", args)

"""
    DescribeVirtualService()

Describes an existing virtual service.

Required Parameters
{
  "meshName": "The name of the service mesh that the virtual service resides in.",
  "virtualServiceName": "The name of the virtual service to describe."
}

Optional Parameters
{
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
DescribeVirtualService(args) = app_mesh("GET", "/v20190125/meshes/{meshName}/virtualServices/{virtualServiceName}", args)

"""
    DeleteVirtualService()

Deletes an existing virtual service.

Required Parameters
{
  "meshName": "The name of the service mesh to delete the virtual service in.",
  "virtualServiceName": "The name of the virtual service to delete."
}

Optional Parameters
{
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
DeleteVirtualService(args) = app_mesh("DELETE", "/v20190125/meshes/{meshName}/virtualServices/{virtualServiceName}", args)

"""
    DescribeVirtualRouter()

Describes an existing virtual router.

Required Parameters
{
  "meshName": "The name of the service mesh that the virtual router resides in.",
  "virtualRouterName": "The name of the virtual router to describe."
}

Optional Parameters
{
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
DescribeVirtualRouter(args) = app_mesh("GET", "/v20190125/meshes/{meshName}/virtualRouters/{virtualRouterName}", args)

"""
    DescribeVirtualNode()

Describes an existing virtual node.

Required Parameters
{
  "virtualNodeName": "The name of the virtual node to describe.",
  "meshName": "The name of the service mesh that the virtual node resides in."
}

Optional Parameters
{
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
DescribeVirtualNode(args) = app_mesh("GET", "/v20190125/meshes/{meshName}/virtualNodes/{virtualNodeName}", args)

"""
    CreateVirtualRouter()

Creates a virtual router within a service mesh.
         Any inbound traffic that your virtual router expects should be specified as a
            listener. 
         Virtual routers handle traffic for one or more virtual services within your mesh. After
         you create your virtual router, create and associate routes for your virtual router that
         direct incoming requests to different virtual nodes.
         For more information about virtual routers, see Virtual Routers.

Required Parameters
{
  "spec": "The virtual router specification to apply.",
  "meshName": "The name of the service mesh to create the virtual router in.",
  "virtualRouterName": "The name to use for the virtual router."
}

Optional Parameters
{
  "clientToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.",
  "tags": "Optional metadata that you can apply to the virtual router to assist with categorization\n         and organization. Each tag consists of a key and an optional value, both of which you\n         define. Tag keys can have a maximum character length of 128 characters, and tag values can have\n            a maximum length of 256 characters.",
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then\n               the account that you specify must share the mesh with your account before you can create \n             the resource in the service mesh. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
CreateVirtualRouter(args) = app_mesh("PUT", "/v20190125/meshes/{meshName}/virtualRouters", args)

"""
    ListMeshes()

Returns a list of existing service meshes.

Optional Parameters
{
  "nextToken": "The nextToken value returned from a previous paginated\n            ListMeshes request where limit was used and the results\n         exceeded the value of that parameter. Pagination continues from the end of the previous\n         results that returned the nextToken value. \n         \n            This token should be treated as an opaque identifier that is used only to\n                retrieve the next items in a list and not for other programmatic purposes.\n        ",
  "limit": "The maximum number of results returned by ListMeshes in paginated output.\n         When you use this parameter, ListMeshes returns only limit\n         results in a single page along with a nextToken response element. You can see\n         the remaining results of the initial request by sending another ListMeshes\n         request with the returned nextToken value. This value can be between\n         1 and 100. If you don't use this parameter,\n            ListMeshes returns up to 100 results and a\n            nextToken value if applicable."
}
"""
ListMeshes() = app_mesh("GET", "/v20190125/meshes")
ListMeshes(args) = app_mesh("GET", "/v20190125/meshes", args)

"""
    UpdateMesh()

Updates an existing service mesh.

Required Parameters
{
  "meshName": "The name of the service mesh to update."
}

Optional Parameters
{
  "spec": "The service mesh specification to apply.",
  "clientToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed."
}
"""
UpdateMesh(args) = app_mesh("PUT", "/v20190125/meshes/{meshName}", args)

"""
    DescribeRoute()

Describes an existing route.

Required Parameters
{
  "routeName": "The name of the route to describe.",
  "meshName": "The name of the service mesh that the route resides in.",
  "virtualRouterName": "The name of the virtual router that the route is associated with."
}

Optional Parameters
{
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
DescribeRoute(args) = app_mesh("GET", "/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes/{routeName}", args)

"""
    UpdateVirtualNode()

Updates an existing virtual node in a specified service mesh.

Required Parameters
{
  "spec": "The new virtual node specification to apply. This overwrites the existing data.",
  "virtualNodeName": "The name of the virtual node to update.",
  "meshName": "The name of the service mesh that the virtual node resides in."
}

Optional Parameters
{
  "clientToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.",
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
UpdateVirtualNode(args) = app_mesh("PUT", "/v20190125/meshes/{meshName}/virtualNodes/{virtualNodeName}", args)

"""
    DeleteVirtualRouter()

Deletes an existing virtual router.
         You must delete any routes associated with the virtual router before you can delete the
         router itself.

Required Parameters
{
  "meshName": "The name of the service mesh to delete the virtual router in.",
  "virtualRouterName": "The name of the virtual router to delete."
}

Optional Parameters
{
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
DeleteVirtualRouter(args) = app_mesh("DELETE", "/v20190125/meshes/{meshName}/virtualRouters/{virtualRouterName}", args)

"""
    UpdateVirtualRouter()

Updates an existing virtual router in a specified service mesh.

Required Parameters
{
  "spec": "The new virtual router specification to apply. This overwrites the existing data.",
  "meshName": "The name of the service mesh that the virtual router resides in.",
  "virtualRouterName": "The name of the virtual router to update."
}

Optional Parameters
{
  "clientToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.",
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
UpdateVirtualRouter(args) = app_mesh("PUT", "/v20190125/meshes/{meshName}/virtualRouters/{virtualRouterName}", args)

"""
    TagResource()

Associates the specified tags to a resource with the specified resourceArn.
         If existing tags on a resource aren't specified in the request parameters, they aren't
         changed. When a resource is deleted, the tags associated with that resource are also
         deleted.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the resource to add tags to.",
  "tags": "The tags to add to the resource. A tag is an array of key-value pairs.\n         Tag keys can have a maximum character length of 128 characters, and tag values can have\n            a maximum length of 256 characters."
}
"""
TagResource(args) = app_mesh("PUT", "/v20190125/tag", args)

"""
    UntagResource()

Deletes specified tags from a resource.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the resource to delete tags from.",
  "tagKeys": "The keys of the tags to be removed."
}
"""
UntagResource(args) = app_mesh("PUT", "/v20190125/untag", args)

"""
    CreateVirtualNode()

Creates a virtual node within a service mesh.
         A virtual node acts as a logical pointer to a particular task group, such as an Amazon ECS
         service or a Kubernetes deployment. When you create a virtual node, you can specify the
         service discovery information for your task group.
         Any inbound traffic that your virtual node expects should be specified as a
            listener. Any outbound traffic that your virtual node expects to reach
         should be specified as a backend.
         The response metadata for your new virtual node contains the arn that is
         associated with the virtual node. Set this value (either the full ARN or the truncated
         resource name: for example, mesh/default/virtualNode/simpleapp) as the
            APPMESH_VIRTUAL_NODE_NAME environment variable for your task group's Envoy
         proxy container in your task definition or pod spec. This is then mapped to the
            node.id and node.cluster Envoy parameters.
         
            If you require your Envoy stats or tracing to use a different name, you can override
            the node.cluster value that is set by
               APPMESH_VIRTUAL_NODE_NAME with the
               APPMESH_VIRTUAL_NODE_CLUSTER environment variable.
         
         For more information about virtual nodes, see Virtual Nodes.

Required Parameters
{
  "spec": "The virtual node specification to apply.",
  "virtualNodeName": "The name to use for the virtual node.",
  "meshName": "The name of the service mesh to create the virtual node in."
}

Optional Parameters
{
  "clientToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.",
  "tags": "Optional metadata that you can apply to the virtual node to assist with categorization\n         and organization. Each tag consists of a key and an optional value, both of which you\n         define. Tag keys can have a maximum character length of 128 characters, and tag values can have\n            a maximum length of 256 characters.",
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then\n               the account that you specify must share the mesh with your account before you can create \n             the resource in the service mesh. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
CreateVirtualNode(args) = app_mesh("PUT", "/v20190125/meshes/{meshName}/virtualNodes", args)

"""
    CreateMesh()

Creates a service mesh. A service mesh is a logical boundary for network traffic between
         the services that reside within it.
         After you create your service mesh, you can create virtual services, virtual nodes,
         virtual routers, and routes to distribute traffic between the applications in your
         mesh.

Required Parameters
{
  "meshName": "The name to use for the service mesh."
}

Optional Parameters
{
  "spec": "The service mesh specification to apply.",
  "clientToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.",
  "tags": "Optional metadata that you can apply to the service mesh to assist with categorization\n         and organization. Each tag consists of a key and an optional value, both of which you\n         define. Tag keys can have a maximum character length of 128 characters, and tag values can have\n            a maximum length of 256 characters."
}
"""
CreateMesh(args) = app_mesh("PUT", "/v20190125/meshes", args)

"""
    DeleteMesh()

Deletes an existing service mesh.
         You must delete all resources (virtual services, routes, virtual routers, and virtual
         nodes) in the service mesh before you can delete the mesh itself.

Required Parameters
{
  "meshName": "The name of the service mesh to delete."
}
"""
DeleteMesh(args) = app_mesh("DELETE", "/v20190125/meshes/{meshName}", args)

"""
    DeleteRoute()

Deletes an existing route.

Required Parameters
{
  "routeName": "The name of the route to delete.",
  "meshName": "The name of the service mesh to delete the route in.",
  "virtualRouterName": "The name of the virtual router to delete the route in."
}

Optional Parameters
{
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
DeleteRoute(args) = app_mesh("DELETE", "/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes/{routeName}", args)

"""
    UpdateRoute()

Updates an existing route for a specified service mesh and virtual router.

Required Parameters
{
  "routeName": "The name of the route to update.",
  "spec": "The new route specification to apply. This overwrites the existing data.",
  "meshName": "The name of the service mesh that the route resides in.",
  "virtualRouterName": "The name of the virtual router that the route is associated with."
}

Optional Parameters
{
  "clientToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.",
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
UpdateRoute(args) = app_mesh("PUT", "/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes/{routeName}", args)

"""
    DeleteVirtualNode()

Deletes an existing virtual node.
         You must delete any virtual services that list a virtual node as a service provider
         before you can delete the virtual node itself.

Required Parameters
{
  "virtualNodeName": "The name of the virtual node to delete.",
  "meshName": "The name of the service mesh to delete the virtual node in."
}

Optional Parameters
{
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
DeleteVirtualNode(args) = app_mesh("DELETE", "/v20190125/meshes/{meshName}/virtualNodes/{virtualNodeName}", args)

"""
    CreateRoute()

Creates a route that is associated with a virtual router.
         You can use the prefix parameter in your route specification for path-based
         routing of requests. For example, if your virtual service name is
            my-service.local and you want the route to match requests to
            my-service.local/metrics, your prefix should be
         /metrics.
         If your route matches a request, you can distribute traffic to one or more target
         virtual nodes with relative weighting.
         For more information about routes, see Routes.

Required Parameters
{
  "routeName": "The name to use for the route.",
  "spec": "The route specification to apply.",
  "meshName": "The name of the service mesh to create the route in.",
  "virtualRouterName": "The name of the virtual router in which to create the route. If the virtual router is in a shared mesh,\n         then you must be the owner of the virtual router resource."
}

Optional Parameters
{
  "clientToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.",
  "tags": "Optional metadata that you can apply to the route to assist with categorization and\n         organization. Each tag consists of a key and an optional value, both of which you define.\n         Tag keys can have a maximum character length of 128 characters, and tag values can have\n            a maximum length of 256 characters.",
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then\n               the account that you specify must share the mesh with your account before you can create \n             the resource in the service mesh. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
CreateRoute(args) = app_mesh("PUT", "/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes", args)

"""
    ListVirtualServices()

Returns a list of existing virtual services in a service mesh.

Required Parameters
{
  "meshName": "The name of the service mesh to list virtual services in."
}

Optional Parameters
{
  "limit": "The maximum number of results returned by ListVirtualServices in paginated\n         output. When you use this parameter, ListVirtualServices returns only\n            limit results in a single page along with a nextToken response\n         element. You can see the remaining results of the initial request by sending another\n            ListVirtualServices request with the returned nextToken value.\n         This value can be between 1 and 100. If you don't use this\n         parameter, ListVirtualServices returns up to 100 results and\n         a nextToken value if applicable.",
  "nextToken": "The nextToken value returned from a previous paginated\n            ListVirtualServices request where limit was used and the\n         results exceeded the value of that parameter. Pagination continues from the end of the\n         previous results that returned the nextToken value.",
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
ListVirtualServices(args) = app_mesh("GET", "/v20190125/meshes/{meshName}/virtualServices", args)

"""
    ListVirtualNodes()

Returns a list of existing virtual nodes.

Required Parameters
{
  "meshName": "The name of the service mesh to list virtual nodes in."
}

Optional Parameters
{
  "limit": "The maximum number of results returned by ListVirtualNodes in paginated\n         output. When you use this parameter, ListVirtualNodes returns only\n            limit results in a single page along with a nextToken response\n         element. You can see the remaining results of the initial request by sending another\n            ListVirtualNodes request with the returned nextToken value.\n         This value can be between 1 and 100. If you don't use this\n         parameter, ListVirtualNodes returns up to 100 results and a\n            nextToken value if applicable.",
  "nextToken": "The nextToken value returned from a previous paginated\n            ListVirtualNodes request where limit was used and the results\n         exceeded the value of that parameter. Pagination continues from the end of the previous\n         results that returned the nextToken value.",
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
ListVirtualNodes(args) = app_mesh("GET", "/v20190125/meshes/{meshName}/virtualNodes", args)

"""
    ListRoutes()

Returns a list of existing routes in a service mesh.

Required Parameters
{
  "meshName": "The name of the service mesh to list routes in.",
  "virtualRouterName": "The name of the virtual router to list routes in."
}

Optional Parameters
{
  "limit": "The maximum number of results returned by ListRoutes in paginated output.\n         When you use this parameter, ListRoutes returns only limit\n         results in a single page along with a nextToken response element. You can see\n         the remaining results of the initial request by sending another ListRoutes\n         request with the returned nextToken value. This value can be between\n         1 and 100. If you don't use this parameter,\n            ListRoutes returns up to 100 results and a\n            nextToken value if applicable.",
  "nextToken": "The nextToken value returned from a previous paginated\n            ListRoutes request where limit was used and the results\n         exceeded the value of that parameter. Pagination continues from the end of the previous\n         results that returned the nextToken value.",
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
ListRoutes(args) = app_mesh("GET", "/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes", args)

"""
    CreateVirtualService()

Creates a virtual service within a service mesh.
         A virtual service is an abstraction of a real service that is provided by a virtual node
         directly or indirectly by means of a virtual router. Dependent services call your virtual
         service by its virtualServiceName, and those requests are routed to the
         virtual node or virtual router that is specified as the provider for the virtual
         service.
         For more information about virtual services, see Virtual Services.

Required Parameters
{
  "spec": "The virtual service specification to apply.",
  "meshName": "The name of the service mesh to create the virtual service in.",
  "virtualServiceName": "The name to use for the virtual service."
}

Optional Parameters
{
  "clientToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.",
  "tags": "Optional metadata that you can apply to the virtual service to assist with\n         categorization and organization. Each tag consists of a key and an optional value, both of\n         which you define. Tag keys can have a maximum character length of 128 characters, and tag values can have\n            a maximum length of 256 characters.",
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then\n               the account that you specify must share the mesh with your account before you can create \n             the resource in the service mesh. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
CreateVirtualService(args) = app_mesh("PUT", "/v20190125/meshes/{meshName}/virtualServices", args)

"""
    UpdateVirtualService()

Updates an existing virtual service in a specified service mesh.

Required Parameters
{
  "spec": "The new virtual service specification to apply. This overwrites the existing\n         data.",
  "meshName": "The name of the service mesh that the virtual service resides in.",
  "virtualServiceName": "The name of the virtual service to update."
}

Optional Parameters
{
  "clientToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.",
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
UpdateVirtualService(args) = app_mesh("PUT", "/v20190125/meshes/{meshName}/virtualServices/{virtualServiceName}", args)

"""
    ListVirtualRouters()

Returns a list of existing virtual routers in a service mesh.

Required Parameters
{
  "meshName": "The name of the service mesh to list virtual routers in."
}

Optional Parameters
{
  "limit": "The maximum number of results returned by ListVirtualRouters in paginated\n         output. When you use this parameter, ListVirtualRouters returns only\n            limit results in a single page along with a nextToken response\n         element. You can see the remaining results of the initial request by sending another\n            ListVirtualRouters request with the returned nextToken value.\n         This value can be between 1 and 100. If you don't use this\n         parameter, ListVirtualRouters returns up to 100 results and\n         a nextToken value if applicable.",
  "nextToken": "The nextToken value returned from a previous paginated\n            ListVirtualRouters request where limit was used and the\n         results exceeded the value of that parameter. Pagination continues from the end of the\n         previous results that returned the nextToken value.",
  "meshOwner": "The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see Working with Shared Meshes."
}
"""
ListVirtualRouters(args) = app_mesh("GET", "/v20190125/meshes/{meshName}/virtualRouters", args)
