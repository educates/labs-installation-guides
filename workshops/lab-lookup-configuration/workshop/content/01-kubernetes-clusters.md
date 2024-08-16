---
title: Kubernetes Clusters
---

In this workshop, in order to demonstrate how to configure the Educates lookup
service three separate Kubernetes virtual clusters have been created. Two of
the virtual clusters will have the Educates training platform installed and the
other will have just the Educates lookup service installed.

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
