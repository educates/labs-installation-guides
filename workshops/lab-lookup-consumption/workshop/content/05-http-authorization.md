---
title: HTTP Authorization
---

It is the access token specified by the `access_token` property of the response
from the authentication step which must be supplied to all subsequent REST API
calls to the lookup service. This needs to be supplied via a HTTP
`Authorization` header with `Bearer` type.

When using `curl`, the access token can be captured in an environment variable
by using:

```terminal:execute
command: |-
  ACCESS_TOKEN=$(curl -s -X POST http://educates-api.hub.{{< param session_hostname >}}/login -H "Content-Type: application/json" -d '{"username": "custom-portal", "password": "secret-password"}' | jq -r -e .access_token) && echo $ACCESS_TOKEN
```

Subsequent API calls using `curl` would then be in the form:

```bash
curl -s -X GET -H "Authorization: Bearer ${ACCESS_TOKEN}" -H "Content-Type: application/json" http://educates-api.hub.{{< param session_hostname >}}/api/v1/<api-name>
```

Depending on the REST API call the HTTP method type will be either `GET` or `POST`.
