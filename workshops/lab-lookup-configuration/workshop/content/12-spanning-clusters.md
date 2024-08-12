---
title: Spanning Clusters
---

In the example presented so far we used separate clusters for hosting production
and staging environments. To demonstrate further use of label matching, this
time against portals, we are going to mix things up by having multiple clusters,
but use both for both production and staging.

First up we need to delete the currently running training portals and workshops
hosted by them.

```terminal:execute
command: |-
  educates delete-portal --context cluster-1 -p portal-1
  educates delete-portal --context cluster-2 -p portal-1
```

Next we will update the tenant configuration to:

```files:copy-file
path: tenant-configs-v2.yaml
preview: true
```

and the cluster configuration to:

```files:copy-file
path: cluster-configs-v2.yaml
preview: true
```

Apply these updates by running:

```terminal:execute
command: |-
  kubectl apply --context hub -f cluster-configs-v2.yaml
  kubectl apply --context hub -f tenant-configs-v2.yaml
```

We haven't changed the client configs as they map to the tenant and the names
of those haven't changed.
