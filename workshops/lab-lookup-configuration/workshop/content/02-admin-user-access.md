---
title: Admin User Access
---

The first step we will perform in configuring the lookup service is add an admin
user for accessing the lookup service on the `hub` cluster. The configuration
for this is:

```files:copy-file
path: admin-config.yaml
preview: true
```

The admin user has the special role `admin` and can be used for querying the
state of any monitored Educates cluster via the lookup service. This user should
not be used by a custom front end web portal which only needs to request
workshop sessions. When requesting workshop sessions a user with role `tenant`
is instead used, which we will get to later.

Configuration for the lookup service needs to be added to the `educates-config`
namespace. Since this namespace doesn't exist by default, first create it.

```terminal:execute
command: kubectl create ns educates-config
```

You can then apply the configuration by running:

```terminal:execute
command: |-
  kubectl apply --context hub -f admin-config.yaml
```
