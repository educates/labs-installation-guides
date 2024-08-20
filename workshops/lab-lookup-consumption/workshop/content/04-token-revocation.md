---
title: Token Revocation
---

The access token returned will be revoked and not usable with subsequent REST
API calls in the following circumstances:

* When the access token expires at the time specified by `expires_at`.
* When the client configuration is deleted from the lookup service.
* The lookup service deployment is restarted.

If a revoked access token is used with a REST API call, a HTTP 401 response will
be returned. In this case the client should re-authenticate with the lookup
service and attempt the REST API call again.

If the subsequent attempt to re-authenticate returns a HTTP 401 response it
indicates that the client configuration has been removed or the password has
been changed.

Because all tokens will be revoked on a restart of the lookup service, a front
end web portal should not assume that a token will always be valid right up
until the original time it was due to expire, and that instead a token can be
revoked at any time.

If a client configuration is deleted but immediately recreated with the same
name and password, the access token will still be revoked and it will be
necessary to re-authenticate.
