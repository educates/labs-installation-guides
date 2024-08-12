---
title: Workshop Deployment
---

Although we deployed some training portals, we haven't yet deployed any
workshops. To do this run:

```terminal:execute
command: |-
  educates deploy-workshop --context cluster-1 -p portal-1 -n lab-k8s-fundamentals -f https://github.com/educates/lab-k8s-fundamentals/releases/latest/download/workshop.yaml
  educates deploy-workshop --context cluster-2 -p portal-1 -n lab-k8s-fundamentals -f https://github.com/educates/lab-k8s-fundamentals/releases/latest/download/workshop.yaml
```

This will deploy one workshop to each of the production and staging clusters,
using the same workshop.

As with deployment of training portals, deployment and registration of the
workshops may take a few moments, but once done you can check that each is
available separately via the respective portals by running:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/clusters/remote-cluster-1/portals/portal-1/environments | jq
```

and:

```terminal:execute
command: |-
  curl --silent -X GET -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/clusters/remote-cluster-2/portals/portal-1/environments | jq
```

Note that what are being listed here are actually the workshop environments
created for the workshop. The details will look the same exception for what
cluster they reside on.
