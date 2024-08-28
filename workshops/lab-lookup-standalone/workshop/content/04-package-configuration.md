---
title: Package Configuration
---

The next required step is to create an appropriate configuration for deploying
the Educates lookup service.

For installation of the Educates lookup service into the virtual cluster created
for this workshop session we will use the following configuration. Click on the
action block below to automatically open the embedded editor and create the file
for you.

```editor:append-lines-to-file
file: ~/exercises/lookup-service-installer-config.yaml
text: |
    # Specify the ingress domain to be used to access the Educates lookup
    # service. By default the hostname under this domain which will be assigned
    # to the lookup service ingress will be "educates-api".

    clusterIngress:
        domain: {{< param session_name >}}.{{< param ingress_domain >}}
```

For this workshop session running in Educates, we set the ingress domain for the
Educates lookup service to correspond to the ingress domain allocated for this
workshop session.
