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

For our first example we will use the tenant configuration below.

```files:copy-file
path: tenant-configs-v1.yaml
preview: true
```

In this example we used a separate cluster for production and staging
environments with the label identifying this distinction being applied to the
cluster.

The tenant configuration then maps the tenants to the respective clusters.

Apply the tenant configuration by running:

```terminal:execute
command: kubectl apply --context hub -f tenant-configs-v1.yaml
```

You can validate that the tenant configuration has been loaded by running:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/tenants | jq
```

Right now no clients have been configured to be able to use these tenants and
thus the list of clients for each is empty.
