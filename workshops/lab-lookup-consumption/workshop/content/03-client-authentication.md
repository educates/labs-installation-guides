---
title: Client Authentication
---

Authenticating with the lookup service entails providing appropriate login
credentials. Upon success, an access token will be returned which needs to be
provided with any subsequent REST API requests.

The URL sub path for authenticating with the lookup service is `/auth/login`.

The handler for this endpoint requires a HTTP POST request with content type
`application/json` be submitted.

The JSON request object needs to be of the form:

```json
{
  "username": "<name>",
  "password": "<password>"
}
```

The request properties are as follows:

* `username` - The name of client.
* `password` - The password for the client.

In this workshop the username for the client being used is `custom-portal` and
the password is `secret-password`.

This required request is equivalent to running the following `curl` command.

```terminal:execute
command: |-
  curl -v -s -X POST http://educates-api.hub.{{< param session_hostname >}}/auth/login -H "Content-Type: application/json" -d '{"username": "custom-portal", "password": "secret-password"}' | jq
```

Upon supplying valid credentials, a HTTP 200 response of type `application/json`
will be returned which includes a response of the form:

```json
{
  "access_token": "<token>",
  "token_type": "Bearer",
  "expires_at": <timestamp>
}
```

The returned properties are as follows:

* `access_token` - A JSON Web Token (JWT). The contents of the JWT are not
  relevant to the client and only the token value itself need be used as
  described.
* `token_type` - Indicator of token type. Will always be the value `Bearer`.
* `expires_at` - The date/time at which point the access token will expire. This
  is expressed as seconds since the UNIX time epoch.

If incorrect inputs are provided for the login request, a HTTP 400 response or
similar appropriate HTTP error will be returned.

If inputs are in the correct format but user authentication fails, a HTTP 401
response will be returned.
