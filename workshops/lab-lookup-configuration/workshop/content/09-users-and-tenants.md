---
title: Users and Tenants
---

The lookup service can be used purely for monitoring a set of Educates clusters,
but it's main purpose is to provide an aggregated view across portals and
clusters for requesting the creation of workshop sessions by a custom front end
web portal.

Such a user has a special role of `tenant` and the `admin` role should not be
used for this purpose.

For this example we are going to define two users mapping to the production and
staging clusters respectively.

```files:copy-file
path: client-configs-v1.yaml
preview: true
```

In practice, production and staging systems should really use distinct lookup
services but in this workshop we cheat as it still serves as a useful use case
to demonstrate how one can configure the lookup service.

Apply the client configuration by running:

```terminal:execute
command: kubectl apply --context hub -f client-configs-v1.yaml
```

Using the admin user we can now go back and verify that these users are indeed
mapped correctly by seeing what clients have access to our tenants.

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/tenants | jq
```

By way of the selectors in the client configuration the users should only have
access to the tenant they are mapped to.
