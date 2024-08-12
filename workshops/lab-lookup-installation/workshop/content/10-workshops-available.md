---
title: Workshops Available
---

The lookup service can be used purely for monitoring a set of Educates clusters,
but it's main purpose is to provide an aggregated view across portals and
clusters for requesting the creation of workshop sessions by a custom front end
web portal.

To test this, we will login using the user we created which had the tenant
role, instead of the admin user.

```terminal:execute
command: |-
  ACCESS_TOKEN=$(curl --silent -X POST http://educates-api.{{< param session_name >}}.{{< param ingress_domain >}}/login -H "Content-Type: application/json" -d '{"username": "custom-portal", "password": "my-secret"}' | jq -r -e .access_token) && echo $ACCESS_TOKEN
```

A user with the tenant role has access to two main endpoints via the REST API.

The first endpoint provides the ability to query what workshops the user has
access via a specific tenant.

To query the set of workshops for the tenant with name `tenant-1`, run the
command:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ACCESS_TOKEN}" http://educates-api.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/tenants/tenant-1/workshops | jq
```

Right now this will return an empty list as we have not yet deployed any
workshops to the cluster.

Deploy a workshop and link it to the training portal portal which was created
earlier.

```terminal:execute
command: educates deploy-workshop -p portal-1 -n lab-k8s-fundamentals -f https://github.com/educates/lab-k8s-fundamentals/releases/latest/download/workshop.yaml
```

Now run again the command to query the set of workshops available. Note that it
will take a few moments for the workshop environment to be set up and the
workshop to be registered so if an empty list is returned again, wait a moment
and try once again. You will be able to see from the lookup service logs when
the workhop has been registered.

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ACCESS_TOKEN}" http://educates-api.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/tenants/tenant-1/workshops | jq
```

Note that a custom front end web portal would only use this endpoint for
querying the set of workshops available if it were dynamically constructing the
list of workshops available to be presented to an end user. If the custom front
end web portal maintains it's own database for what workshops are available and
registration of workshops with the front end web portal is managed in another
way, there would be no need to query what workshops are available from the
lookup service.
