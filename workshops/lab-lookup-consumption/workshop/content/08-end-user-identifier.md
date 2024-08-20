---
title: End User Identifier
---

When requesting a workshop, a unique identifier for an end user making use of
the custom front end web portal can be supplied. This is passed via the
`clientUserId` property. This ID would usually be something like a uuid, but
an email address might also be used.

If this property is not supplied, every time a workshop request is made against
a specific workshop, even if initiated for the same end user, then a new
workshop session will be returned. This will be the case even if that end user
had already had an instance of that workshop running.

In order that a user is prevented from creating multiple workshop sessions for
the same workshop, and to allow an end user to be reconnected to an existing
workshop session in the event they may have accidentally closed their browser
window, a unique identifier for every end user should be supplied when
requesting a workshop. By doing this a workshop request will always return the
existing workshop session if one already exists for that user.

To illustrate this mechanism in action, request the same workshop again using
the same end user client ID. This should show the same result as before provided
the workshop session is still running.

```terminal:execute
command: |-
  curl --silent -X POST -H "Authorization: Bearer ${ACCESS_TOKEN}" -H "Content-Type: application/json" -d '{"tenantName": "example-tenant", "workshopName": "lab-k8s-fundamentals", "clientIndexUrl": "https://www.example.com", "clientUserId": "end-user-id-1"}' http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/workshops | jq
```

Another benefit of always supplying a unique identifier for a user is that it is
possible to also restrict the number of different workshops sessions that can be
created for different workshops, when all the workshops are hosted by the same
training portal.

Do note though that this last restriction on concurrent workshop sessions isn't
a restriction which is enabled by default, and requires a training portal be
configured to limit the number of concurrent workshop sessions a user can run
across the set of workshops running on that training portal.

It is planned to also add in the future the ability to place such restrictions
on the number of concurrent sessions a specific user can run in the lookup
service itself. This will also allow the restriction to be enforced at the level
of a tenant, meaning that the cap would apply across training portals on the
same or different clusters.
