---
title: Admin Client Access
---

The first step we will perform in configuring the lookup service is add an admin
user for accessing the respective lookup service REST APIs. The configuration
for this is:

```files:copy-file
path: admin-config.yaml
preview: true
```

This includes a `ClusterConfig` which is used to specify what clusters to
monitor and a `ClientConfig`, which is used to configure a user.

The admin user has the special role `admin` and can be used for querying the
state of each Educates cluster via the lookup service. This user should not be
used by a custom front end web portal which only needs to request workshop
sessions. When requesting workshops sessions a user with role `tenant` is
instead used, which we will get to later.

To apply this to each of our three clusters run:

```terminal:execute
command: |-
  kubectl apply --context hub -f admin-config.yaml
  kubectl apply --context cluster-1 -f admin-config.yaml
  kubectl apply --context cluster-2 -f admin-config.yaml
```

Note that this will also create the `educates-config` namespace in each cluster,
which is where lookup service configuration needs to be placed.
