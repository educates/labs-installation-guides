---
title: REST API Endpoints
---

For the case of the lookup service being accessed from a custom front end web
portal, two key REST API endpoints are provided which implement the following
functionality.

* Ability to get a list of workshops available to the custom front end web portal.
* Ability to request a workshop session for one of the available workshops.

These REST API endpoints are associated with a client which has been designated
to have the `tenant` role. Additional REST API endpoints are available to a
client which has the `admin` role, but these would generally only be used by
applications handling operations and management of the lookup service. These
latter REST API endpoints will not be covered in this workshop.

Before any client can access these REST API endpoints they first need to
authenticate with the lookup service.
