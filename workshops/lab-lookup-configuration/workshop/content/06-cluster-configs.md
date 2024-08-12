---
title: Cluster Configs
---

The next step is to create `ClusterConfig` definitions for each of the remote
clusters. These refer to the `kubeconfig` files embedded in the secrets we just
created.

```files:copy-file
path: cluster-configs-v1.yaml
preview: true
```

In order to identify the way in which the clusters are being used, you can
specify labels. This will be able to be matched against later when we set up
tenant access.

In this case we use the labels on the cluster to identify which customer they
belong to and what type of environment (production or staging).

Apply the configurations for the remote clusters.

```terminal:execute
command: kubectl apply --context hub -f cluster-configs-v1.yaml
```

Verify that the lookup service has registered the remote clusters by running
again:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/clusters | jq
```
