---
title: Requesting Workshops
---

The second and primary endpoint available to a user with the tenant role, is
that for requesting a workshop session for a specific workshop.

When you know that a tenant has a workshop available, be that determined
dynamically as already demonstrated, or whether information about workshops is
maintained within a separate database of the custom front end web portal, to
then request a workshop session can be done using:

```terminal:execute
command: |-
  curl --silent -X POST -H "Authorization: Bearer ${ACCESS_TOKEN}" -H "Content-Type: application/json" -d '{"tenantName": "tenant-1", "workshopName": "lab-k8s-fundamentals", "clientIndexUrl": "https://www.example.com", "clientUserId": "end-user-id"}' http://educates-api.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/workshops | jq
```

To activate the workshop session and access it, click on the URL link shown in
the response from the call.

That is all we will cover about usage of the lookup service by a custom front
end web portal in this workshop session. A separate workshop will go into
issues related to use by a custom front end web portal.
