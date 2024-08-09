---
title: Accessing the Service
---

The lookup service will be installed in the `educates` namespace along with
other core components of Educates.

To view the deployment and ingress for accessing the service run:

```terminal:execute
command: kubectl get deployment,ingress -n educates lookup-service
```

The REST API for the lookup service will be accessible via the hostname given
in the ingress. In this case the URL for accessing the lookup service is:

```
http://educates-api.{{< param session_name >}}.{{< param ingress_domain >}}
```

Before we can access the lookup service we will need to configure it. This
entails the following.

* Specify the Educates clusters the lookup service should monitor.
* Specify the hosted tenants and which cluster/portals they can access.
* Specify credentials for client access and what tenants they can access.
