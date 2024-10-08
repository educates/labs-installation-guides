---
title: Install Lookup Service
---

When installing Educates 3.0.0 or later, the lookup service can optionally be
enabled. This will result in the lookup service being co-hosted with the
Educates installation.

To demonstrate installation, in this workshop we will install Educates with the
lookup service into a virtual cluster created for this workshop session.

{{< note >}}
If you are using Educates 2.7.4 and want to be able to use the lookup service,
or want to be able to install the lookup service in a separate cluster to the
Educates training platform, see the separate workshop describing installation of
a standalone instance of the lookup service.
{{< /note >}}

The required configuration for this installation is as follows. Click on the
action block below to automatically open the embedded editor and create the file
for you.

```editor:append-lines-to-file
file: ~/vcluster-config.yaml
text: |
    # Specify the infrastructure provider hosting the Kubernetes cluster.

    clusterInfrastructure:
        provider: vcluster

    # Specify the ingress domain to be used to access the workshops hosted by
    # the Educates installation.

    clusterIngress:
        domain: {{< param session_name >}}.{{< param ingress_domain >}}

    # Enable the lookup service.

    lookupService:
        enabled: true
```

The part of the configuration which enables the lookup service is found in the
`lookupService` section.

```editor:select-matching-text
file: ~/vcluster-config.yaml
text: "lookupService"
after: 1
```

With the configuration created we are ready to perform the installation by
running the CLI command:

```terminal:execute
command: educates admin platform deploy --config vcluster-config.yaml
```

If all went well, the CLI should respond with:

```
Educates has been installed succesfully
```
