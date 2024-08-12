---
title: Scaling Capacity
---

The main reason for configuring things as we have this time is that it allows
us to scale up capacity by creating more clusters, rather than scaling up an
existing cluster. It can also be used as a part of a blue/green type strategy
for migrating to a new cluster.

When deploying the training portals this time, what we will do is label them.

```terminal:execute
command: |-
  educates create-portal --context cluster-1 -p portal-1 -l environment=production
  educates create-portal --context cluster-2 -p portal-1 -l environment=production
```

More specifically we will in this case label each as being used to host
workshops for the production environment.

Querying the set of all training portals running:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/portals | jq
```

as before we will see that both are running, but the labels we added are now
shown.

If we query what portals are associated to the tenant:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/tenants/customer-1-production/portals | jq
```

we also see both here as well, whereas before we only saw one since we only
picked up the one running on the first cluster.
