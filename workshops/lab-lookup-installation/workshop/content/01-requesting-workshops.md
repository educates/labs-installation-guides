---
title: Requesting Workshops
---

When a workshop is installed, it is associated with a training portal. The
training portal can host any number of workshops so long as the underlying
Kubernetes cluster has the required capacity to host the number of concurrent
workshop sessions the training portal is configured to allow.

The training portal provides a web based user interface for selecting from the
workshops associated with that training portal. It also provides a REST API
for fetching information about available workshops and requesting the creation
of workshop sessions. This REST API would be used by a custom front end web
portal providing access to workshops, in place of the training portals own user
interface.

If required, an Educates cluster can host more than one training portal. In this
case each training portal will have a separate hostname for accessing the REST
API. This means that a custom front end web portal may need to handle being able
to talk to multiple separate training portals.

When multiple Educates clusters are used in order to distribute load across
multiple Kubernetes cluster, or in order to provide a level of fault tolerance
for availability of a specific workshop by hosting it on multiple Educates
clusters, the custom front end web portal would need to also handle talking
to the different clusters.

In the case where multiple Educates clusters are used to host the same set of
workshops, the custom front end web portal will need to be able to track where
the workshops are available, how much capacity the clusters have, and which have
the capacity to create an instance of a workshop session, or which may have
sessions for a workshop already ready in reserve to be allocated to users.

Because dealing with multiple clusters and training portals, including tracking
of the states of each, can be non trivial, Educates 3.0 introduces a new lookup
service which runs in front of Educates, providing a single REST API access
point for requesting workshops.
