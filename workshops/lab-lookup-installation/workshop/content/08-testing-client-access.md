---
title: Testing Client Access
---

All access to the lookup service is authenticated. This requires that any client
first login to the lookup service. This will return an access token that must
be used in subsequent requests.

To test access using the admin user, login using the command:

```terminal:execute
command: |
  ACCESS_TOKEN=$(curl --silent -X POST http://educates-api.{{< param session_name >}}.{{< param ingress_domain >}}/login -H "Content-Type: application/json" -d '{"username": "admin", "password": "super-secret"}' | jq -r -e .access_token) && echo $ACCESS_TOKEN
```

Presuming access is granted, with this command the access token will be captured
in the environment variable `ACCESS_TOKEN`.

The admin user has access to various endpoints via the REST API which provide a
means of querying the state of the lookup service.

For example, to query the clusters which are being monitored run:

```terminal:execute
command: |
  curl --silent -X GET -H "Authorization: Bearer ${ACCESS_TOKEN}" http://educates-api.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/clusters | jq
```

In this case we only have the local cluster.

You can also see the set of accessible training portals by running:

```terminal:execute
command: |
  curl --silent -X GET -H "Authorization: Bearer ${ACCESS_TOKEN}" http://educates-api.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/portals | jq
```

Right now this will return an empty list as no training portals have been
created as yet.

To create a training portal with name `portal-1` run:

```terminal:execute
command: educates create-portal -p portal-1
```

Now run again the command to query the training portals. Note that it may take a
few moments for the training portal to be set up and registered so if an empty
list is returned again, wait a moment and try once again. You will be able to
see from the lookup service logs when the training portal has been registered.

```terminal:execute
command: |
  curl --silent -X GET -H "Authorization: Bearer ${ACCESS_TOKEN}" http://educates-api.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/portals | jq
```
