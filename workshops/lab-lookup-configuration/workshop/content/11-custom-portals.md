---
title: Custom Portals
---

For access to workshops from a custom front end web portal, the user for that
client is used instead of the admin user.

To login the user for the first custom front end web portal run:

```terminal:execute
command: |-
  PORTAL_1_ACCESS_TOKEN=$(curl --silent -X POST http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/login -H "Content-Type: application/json" -d '{"username": "custom-portal-1", "password": "secret-1"}' | jq -r -e .access_token) && echo $PORTAL_1_ACCESS_TOKEN
```

The range of API endpoints a user with the `tenant` role has access to is much
more limited.

The first API they can use allows them to list what workshops they have
available via a specific tenant that they have access to.

```terminal:execute
command: |
  curl --silent -X GET -H "Authorization: Bearer ${PORTAL_1_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/tenants/customer-1-production/workshops | jq
```

This only provides details about the workshop itself. This does not provide
details about what clusters or portals the workshop is hosted on as such
information is in practice not required by the custom from end web portal since
it is the lookup service which will make decisions about where a workshop
session will be started.

Whether a custom front end web portal would make use of this ability to query
what workshops are available will depend on how it is implemented. If the custom
front end web portal maintains it's own database of available workshops and
workshops are registered with it using a separate mechanism, this API endpoint
would not be required. It would however be used if the custom front end web
portal constructs the list of workshops available dynamically based on what the
lookup service says is available.

To request a workshop session from the lookup service for the workshop, you can
run:

```terminal:execute
command: |-
  curl --silent -X POST -H "Authorization: Bearer ${PORTAL_1_ACCESS_TOKEN}" -H "Content-Type: application/json" -d '{"tenantName": "customer-1-production", "workshopName": "lab-k8s-fundamentals", "clientIndexUrl": "https://www.example.com", "clientUserId": "end-user-id"}' http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/workshops | jq
```

Although when listing workshops it doesn't provide details about where it may
be hosted, for debugging purposes and auditing, such information is returned
in the response when requesting a workshop.

Clicking on the session activation URL link returned in the response will launch
the workshop.
