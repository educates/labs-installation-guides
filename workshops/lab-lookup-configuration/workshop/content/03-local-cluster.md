---
title: Local Cluster
---

The `ClusterConfig` we used in the prior step was:

```
apiVersion: lookup.educates.dev/v1beta1
kind: ClusterConfig
metadata:
  name: local-cluster
  namespace: educates-config
```

You will note that there is no `spec` section within this resource definition.
The lack of any details about how to connect to a cluster will result in this
named cluster being linked to the local cluster that the lookup service is
running in. The name used to refer to the cluster when required will be
`local-cluster`.

To test that the configuration is working, we can use the admin user to login
to the lookup service and start making queries about the state of the lookup
service.

```terminal:execute
command: |-
  ADMIN_ACCESS_TOKEN=$(curl --silent -X POST http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/login -H "Content-Type: application/json" -d '{"username": "admin", "password": "super-secret"}' | jq -r -e .access_token) && echo $ADMIN_ACCESS_TOKEN
```

Presuming access is granted, with this command the access token will be captured
in the environment variable `ADMIN_ACCESS_TOKEN`.

The admin user has access to various endpoints via the REST API which provide a
means of querying the state of the lookup service.

For example, to query the clusters which are being monitored run:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/clusters | jq
```
