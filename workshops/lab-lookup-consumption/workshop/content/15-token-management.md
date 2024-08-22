---
title: Token Management
---

In the final topic of this workshop we are going to revisit access tokens.

As already documented, it is necessary for a client to login to the lookup
service using it's credentials and obtain an access token which needs to then
be used for subequent REST API requests.

There are two basic strategies one can employ for dealing with access tokens,
each with different pros and cons.

In the first strategy, for each distinct client the custom front end web portal
needs to use to access the lookup service when accessing tenants, if no valid
access token is currently cached when a workshop request is required, login for
that client would be performed.

If this login fails, the workshop request which triggered the need to login
would be failed and the end user would be given a message that the workshop
is not available and to try again later. Because failure to login for a client
means an issue in communicating with the lookup service, an alert should be
raised for operations to investigate.

If login is successful, the access token would be cached for that client.

Whether it was necessary to first perform the client login or not, having a
cached access token for the client, a workshop request can be initiated. If the
workshop request is successful the workshop session would be handed out to the
end user. If unsucessful and due to no workshop sessions being available, the
end user would be given a message that the workshop is not available and to try
again later.

If the workshop request was unsuccessful because the access token had been
revoked, the end user could still be given a message that the workshop is not
available and to try again later. At the same time, any cached access client for
the token would be cleared.

Although one could try and retrigger login if a workshop request failed due to
a revoked token, this would only complicate logic. It is easier to just tell
the user to try again later, and use their subsequent request to start things
over again.

A second strategy would be similar to the above except that no caching of the
access token would be done and instead the access token would be thrown away
after having successfully dealt with the workshop request.

Not needing to cache access tokens using the second strategy could simplify the
front end portal code, but means that for every workshop request you are sending
the raw login credentials across the network as a separate HTTP request. You are
also generating a new access token for every workshop request and with so many
tokens available it may make it easier to brute force working out the secret
used for signing access tokens. Even so, the risks from this are very low and
may not be a concern.

So in implementing interaction with the REST API of the lookup service you will
need to balance between slightly more complicated code for handling caching of
access tokens, and less complicated code but where handling of login credentials
and access tokens is not as secure.
