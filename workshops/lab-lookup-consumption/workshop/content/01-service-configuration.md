---
title: Service Configuration
---

As the purpose of the workshop is to work through using the lookup service REST
API we need to configure the lookup service and deploy a workshop. Before we can
do that though, we need to make sure that Educates and other required components
have started up and are running okay. Only proceed once the verification step
below has completed.

```examiner:execute-test
name: check-for-crds
title: Verify that Educates is installed.
autostart: true
retries: .INF
delay: 1
```

Note that the details of what we will be doing here are not important from the
perspective of using the REST API. If you want more information ensure you have
done the prior workshops on installing and configuring the lookup service.

Now that Educates is ready, we will first apply some Kyverno policies to help us
prepare this workshop environment for the examples we will run. This is specific
to this workshop and is nothing to do with normal usage of the lookup service. 

```terminal:execute
command: |-
  kubectl apply -f configs/kyverno-policies.yaml
```

Next we configure the lookup service by running:

```terminal:execute
command: |-
  kubectl apply -f configs/service-configs.yaml
```

Then we create a training portal and deploy a workshop by running:

```terminal:execute
command: |-
  educates deploy-workshop -n lab-k8s-fundamentals -f https://github.com/educates/lab-k8s-fundamentals/releases/latest/download/workshop.yaml
```

The URL for accessing the lookup service deployed with this workshop session
will be:

```workshop:copy
text: http://educates-api.hub.{{< param session_hostname >}}
```

In this case only the HTTP protocol is used and not HTTPS. If Educates were
installed using secure ingress then the HTTPS protocol scheme would instead need
to be used in the URL.
