---
title: Service Configuration
---

As the purpose of the workshop is to work through using the lookup service REST
API we need to deploy a workshop and configure the lookup service. The details
of what we will be doing here are not important from the perspective of using
the REST API. If you want more information ensure you have done the prior
workshops on installing and configuring the lookup service.

First deploy a workshop by running:

```terminal:execute
command: |-
  educates deploy-workshop -n lab-k8s-fundamentals -f https://github.com/educates/lab-k8s-fundamentals/releases/latest/download/workshop.yaml
```

And then configure the lookup service by running:

```terminal:execute
command: |-
  kubectl apply -f service-configs.yaml
```

The URL for accessing the lookup service deployed with this workshop session
will be:

```workshop:copy
text: http://educates-api.hub.{{< param session_hostname >}}
```

In this case only the HTTP protocol is used and not HTTPS. If Educates were
installed using secure ingress then the HTTPS protocol scheme would instead need
to be used in the URL.
