---
title: Cluster Configs
---

The next step is to create `ClusterConfig` definitions for each of the remote
clusters.

```files:copy-file
path: remote-clusters.yaml
preview: true
```

In order to identify the way in which the clusters are being used, you can
specify labels. This will be able to be matched against later when we set up
tenant access.

Apply the configurations for the remote clusters.

```terminal:execute
command: kubectl apply --context hub -f remote-clusters.yaml
```

Verify that the lookup service has registered the remote clusters by running
again:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/clusters | jq
```
