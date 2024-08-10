---
title: Tenant Configuration
---

Because the lookup service provides an aggregated view across one or more
training portals, and potentially more than one cluster, a means of logically
partitioning available workshops is required. This is because not all workshops
should necessarily be accessible to all users of the lookup service.

This mechanism for partioning available workshops is based around the concept
of tenants.

For each configured tenant, rules can be specified as to which clusters and
portals can be accessed via that tenant. These rules can match on clusters and
portals by name, or sets of labels.

In this workshop we will not go into all aspects of specifying such rules and
will instead cover them in detail in a separate workshop where we show an
example of working with multiple clusters.

For this simple case of a single cluster, we will use the following
configuration for a single tenant:

```editor:append-lines-to-file
file: ~/tenant-config.yaml
text: |
    apiVersion: lookup.educates.dev/v1beta1
    kind: TenantConfig
    metadata:
        name: tenant-1
        namespace: educates-config
    spec:
        clusters:
            nameSelector:
                matchNames:
                - local-cluster
        portals:
            nameSelector:
                matchNames:
                - portal-1
```

Apply this configuration by running:

```terminal:execute
command: kubectl apply -f ~/tenant-config.yaml
```
