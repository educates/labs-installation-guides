---
title: Workshops Available
---

A custom front end web portal may be configured with its own database of
available workshops, or it might instead dynamically request from the lookup
service a list of what is available.

Because the lookup service can provide an aggregated view across one or more
training portals, and potentially more than one cluster, a means of logically
partitioning available workshops is implemented. This is because not all
workshops should necessarily be accessible to all users of the lookup service.

This mechanism for partitioning available workshops is based around the concept
of tenants.

For each configured tenant, rules can be specified as to which clusters and
portals can be accessed via that tenant. These rules can match on clusters and
portals by name, or sets of labels. When the client configuration is added to
the workshop, it can be specified which tenants a client can access workshops
for.

To request a list of the workshops available, a client needs to specify which
tenant they want to make the query against. The tenant name is reflected in
what URL sub path they use when making the REST API call.

For this workshop the only tenant that the client can access is called
`example-tenant`.

To request a list of the workshops available for this tenant, the client should
use the URL sub path `/api/v1/workshops`. This should be done as a HTTP GET
request, with the tenant name being passed via the `tenant` query string
parameter.

```terminal:execute
command: |-
  curl -s -X GET -H "Authorization: Bearer ${ACCESS_TOKEN}" -H "Content-Type: application/json" http://educates-api.hub.{{< param session_hostname >}}/api/v1/workshops?tenant=example-tenant | jq
```

Failure to provide the tenant name for this case will result in a HTTP 400
response. If a tenant name is provided and there is no such tenant, or the
client is not permitted to access workshops for the tenant, a HTTP 403 response
will be returned. If the case of incomplete configuration of the lookup service
whereby a client is allowed to access a certain named tenant, but there is no
configuration for that tenant, a HTTP 503 response will be returned.
