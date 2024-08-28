---
title: Testing Installation
---

The test that the lookup service is running add an admin user for accessing the
lookup service on the virtual cluster.

Create a namespace to hold the lookup service configuration:

```terminal:execute
command: kubectl create namespace educates-config
```

and then apply the client configuration for the admin user:

```terminal:execute
command: kubectl apply -f admin-config.yaml
```

Now can use the admin user to login to the lookup service and start making
queries about the state of the lookup service.

```terminal:execute
command: |-
  ADMIN_ACCESS_TOKEN=$(curl --silent -X POST http://educates-api.{{< param session_name >}}.{{< param ingress_domain >}}/auth/login -H "Content-Type: application/json" -d '{"username": "admin", "password": "super-secret"}' | jq -r -e .access_token) && echo $ADMIN_ACCESS_TOKEN
```

Presuming access is granted, with this command the access token will be captured
in the environment variable `ADMIN_ACCESS_TOKEN`.

The admin user has access to various endpoints via the REST API which provide a
means of querying the state of the lookup service.

For example, to query the clients which are allows access, run:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/clients | jq
```
