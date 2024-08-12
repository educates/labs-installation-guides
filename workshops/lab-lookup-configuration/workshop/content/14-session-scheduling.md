---
title: Session Scheduling
---

Let's deploy our workshops again, one to each cluster, hosted by the training
portals we created.

```terminal:execute
command: |-
  educates deploy-workshop --context cluster-1 -p portal-1 -n lab-k8s-fundamentals -f https://github.com/educates/lab-k8s-fundamentals/releases/latest/download/workshop.yaml
  educates deploy-workshop --context cluster-2 -p portal-1 -n lab-k8s-fundamentals -f https://github.com/educates/lab-k8s-fundamentals/releases/latest/download/workshop.yaml
```

Querying the workshops environments created for each we will not see any real
difference to before either.

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/clusters/remote-cluster-1/portals/portal-1/environments | jq
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/clusters/remote-cluster-2/portals/portal-1/environments | jq
```

The difference comes when we request a workshop.

Make one request for a workshop as before.

```terminal:execute
command: |-
  curl --silent -X POST -H "Authorization: Bearer ${PORTAL_1_ACCESS_TOKEN}" -H "Content-Type: application/json" -d '{"tenantName": "customer-1-production", "workshopName": "lab-k8s-fundamentals", "clientIndexUrl": "https://www.example.com", "clientUserId": "end-user-id-1"}' http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/workshops | jq
```

And then a second, but this time we will use a different client user ID.

```terminal:execute
command: |-
  curl --silent -X POST -H "Authorization: Bearer ${PORTAL_1_ACCESS_TOKEN}" -H "Content-Type: application/json" -d '{"tenantName": "customer-1-production", "workshopName": "lab-k8s-fundamentals", "clientIndexUrl": "https://www.example.com", "clientUserId": "end-user-id-2"}' http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/workshops | jq
```

The client user ID is the user identifier from the custom front end web portal
and should uniquely identify the end user.

As the two client user IDs are different then obviously we will provide back
different workshop sessions. If you look closely you should see that the two
workshop sessions returned were allocated to different clusters.

This is because the lookup service when deciding where to create a workshop
session for the user, will look at a number of different criteria including:

* total capacity of the training portals
* total capacity of the workshop environments
* whether a workshop environment has available reserved sessions
* how much capacity a workshop environment still has available

Based on the criteria used the lookup service will aim to distribute workshop
sessions across clusters and training portals with the aim to best distribute
them based on remaining capacity, but also based on whether reserved sessions
exist which would result in quicker delivery of the workshop to a user as they
will not need to wait as long.
