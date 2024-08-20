---
title: Requesting Workshops
---

When you know that a tenant has a workshop available, be that determined
dynamically by requesting the list of workshops available from the lookup
service, or whether information about workshops is maintained within a separate
database of the custom front end web portal, a client can request access to an
instance of that workshop.

To request a workshop available via the tenant, the client again uses the URL
sub path `/api/v1/tenants/workshops` but this time a HTTP POST request is
required, with content type `application/json`.

The JSON request object needs to be of the form:

```json
{
  "tenantName": "<name>",
  "workshopName": "<name>",
  "clientUserId": "<id>",
  "clientIndexUrl": "<url>",
  "clientActionId": "<id>",
  "workshopParams": [
    {
      "name": "<name>",
      "value": "<value>"
    }
  ]
}
```

The request properties are as follows:

* `tenantName` - The name of the tenant against which the workshop request is
  being made.
* `workshopName` - The name of the workshop for which a session is being
  requested.
* `clientUserId` - A unique identifier for the end user using the custom front
  end web portal.
* `clientIndexUrl` - A URL to which the user should be redirected when the
  workshop session has been completed or has expired.
* `clientActionId` - An optional tracking ID to identify the request for a
  workshop session.
* `workshopParams` - An optional list of parameters to be injected into the
  workshop session when allocated to the user.

In this workshop the name of the workshop which is available for making a
request against is `lab-k8s-fundamentals`. As before this is within the tenant
`example-tenant`.

This request is equivalent to running the following `curl` command.

```terminal:execute
command: |-
  curl --silent -X POST -H "Authorization: Bearer ${ACCESS_TOKEN}" -H "Content-Type: application/json" -d '{"tenantName": "example-tenant", "workshopName": "lab-k8s-fundamentals", "clientIndexUrl": "https://www.example.com", "clientUserId": "end-user-id-1"}' http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/workshops | jq
```

Upon success a HTTP 200 response of type `application/json` will be returned
which includes a response of the form:

```json
{
  "tenantName": "<tenant-name>",
  "clusterName": "<cluster-name>",
  "portalName": "<portal-name>",
  "environmentName": "<environment-name>",
  "sessionName": "<session-name>",
  "clientUserId": "<client-user-id>",
  "sessionActivationUrl": "<activation-url>"
}
```

The returned properties are as follows:

* `tenantName` - The name of the tenant against which workshop the request was
  being made.
* `clusterName` - The name of the Educates cluster where the workshop session
  is running.
* `portalName` - The name of the training portal hosting the workshop
  environment for the requested workshop.
* `environmentName` - The name of the workshop environment the workshop
  session is associated with.
* `sessionName` - The name of the workshop session.
* `clientUserId` - The unique identifier for the end user using the custom front
  end web portal.
* `sessionActivationUrl` - The URL to which the user should be redirected to
  activate the workshop session.

The key property of interest in the response is `sessionActivationUrl` and all
others are provided for debugging and auditing purposes only.

The custom front end web portal should redirect the user web browser to the URL
given in `sessionActivationUrl`. This can be as a new browser window, or an
browser HTML `iframe` could be used to load the URL resulting in the session
being embedded with the custom front end web portal web page.
