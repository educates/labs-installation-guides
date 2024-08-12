---
title: Users and Tenants
---

Another set of REST API endpoints which the admin user has access to include
some which provide details on the users and tenants which have been configured.

To query the set of users who have access to the lookup service you can run:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ACCESS_TOKEN}" http://educates-api.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/clients | jq
```

To query the set of tenants which have been configured you can run:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ACCESS_TOKEN}" http://educates-api.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/tenants | jq
```

When querying the list of tenants, it will show you which users have access to
that tenant.
