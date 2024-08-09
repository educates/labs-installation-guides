---
title: Monitored Clusters
---

A single instance of the lookup service can monitor Educates on one or more
clusters. In this case where we have installed the lookup service co-located
with Educates itself, we will configure the lookup service to monitor just
the cluster it is installed into.

In this case the configuration which needs to be used is as follows.

```editor:append-lines-to-file
file: ~/cluster-config.yaml
text: |
    apiVersion: lookup.educates.dev/v1beta1
    kind: ClusterConfig
    metadata:
        name: local-cluster
        namespace: educates-config
```

The cluster configuration definition has no `spec` section. This will result in
the lookup service monitoring only the cluster it is installed in. The cluster
will be identified by the name `local-cluster`.

This configuration needs to be applied to the `educates-config` namespace. This
namespace doesn't exist by default, so create the namespace by running:

```terminal:execute
command: kubectl create ns educates-config
```

Having created the configuration file with the definition as shown above, apply
the configuration by running:

```terminal:execute
command: kubectl apply -f ~/cluster-config.yaml
```

To monitor that the lookup service has started up and the configuration applied
you can monitor the logs by running:

```terminal:execute
session: 2
command: kubectl logs -n educates --follow deployment/lookup-service
```

Leave this running so you can also see what is logged when going through the
remainder of this workshop.
