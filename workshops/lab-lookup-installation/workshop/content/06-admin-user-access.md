---
title: Admin User Acess
---

The next thing that needs to be done is define details for users which can
access the lookup service, including the login credentials.

For this example we will define two users.

The first of these is a special admin user which will have access to all REST
API endpoints that the lookup service provides.

The configuration for this user is:

```editor:append-lines-to-file
file: ~/client-config-admin.yaml
text: |
    apiVersion: lookup.educates.dev/v1beta1
    kind: ClientConfig
    metadata:
        name: admin
        namespace: educates-config
    spec:
        client:
            password: super-secret
        roles:
            - admin
        tenants:
            - "*"
```

The name of the resource will be the user name for the client.

The list of roles is defined to include `admin`.

For an admin user the list of tenants the client is permitted to access, where
this is relevant, should be set to a single item with value `*`. This will match
on all tenants.

An admin user should only be used in cases where it is necessary to manage the
lookup service. The `admin` role would never be added to a user for a custom
front end web portal which only has the need to request workshop sessions as you
don't want to be giving more access than they need.

Apply the configuration for the admin user.

```terminal:execute
command: kubectl apply -f ~/client-config-admin.yaml
```
