---
title: Training Portals
---

Before we can validate the tenant configuration is working correctly we first
need to create some training portals.

Create training portals in each cluster by running:

```terminal:execute
command: |-
  educates create-portal --context cluster-1 -p portal-1
  educates create-portal --context cluster-2 -p portal-1
```

As the training portals are running on a remote cluster, they may take a few
moments to be registered with the lookup service. When done they will be listed
when running:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/portals | jq
```

This view of the available portals will show all portals irrespective of what
tenants are mapped to them. To view what portals are mapped to just the tenant
with access to the production systems run:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/tenants/customer-1-production/portals | jq
```

And for the staging system run:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/tenants/customer-1-staging/portals | jq
```

You should see that for each, only the portal on the cluster for that
environment should be listed.
