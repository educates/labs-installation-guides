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

For example, to follow the log output from the lookup service running in the
virtual cluster called `hub`, run:

```terminal:execute
session: 2
command: kubectl logs --context hub -n educates --follow deployment/lookup-service
```

If necessary keep running this as the lookup service may take a few moments to
start up after being deployed along with this workshop session.

Although a complete Educates installation has deployed to the `hub` virtual
cluster, for this workshop we will only make use of the lookup service running
in that cluster to monitor the `cluster-1` and `cluster-2` virtual clusters.
