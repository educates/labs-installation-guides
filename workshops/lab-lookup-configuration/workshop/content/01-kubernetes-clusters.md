---
title: Kubernetes Clusters
---

In this workshop, in order to demonstrate how to configure the Educates lookup
service three separate Kubernetes virtual clusters have been created. Each of
the virtual clusters has Educates installed, with the lookup service enabled.

Access to each virtual cluster is provided through separate contexts defined
in the user kubeconfig file. To list the contexts run:

```terminal:execute
command: kubectl config get-contexts
```

When using the `kubectl` or `educates` commands, to select the virtual cluster
against which the operation should be run, the `--context` option should be
used.

For example, to query the ingress for the lookup service in the `hub` cluster,
so we know how to access it, you can run:

```terminal:execute
session: 1
command: kubectl get ingress/lookup-service --context hub -n educates
```

Although a complete Educates installation has been deployed to the `hub` virtual
cluster, for this workshop we will only make use of the lookup service running
in that cluster to monitor Educates running in the `cluster-1` and `cluster-2`
virtual clusters. Conversely, for `cluster-1` and `cluster-2`, we will make use
of Educates for deploying workshops, but will not use the lookup service in
those clusters.
