---
title: Package Installation
---

Although we will be using the `kapp-controller` operator to perform the
installation, before we can do that we need to create a Kubernetes service
account in the cluster and attached roles to it with the permissions required
for installing the Educates lookup service, as well as what is required at
runtime. For simplicity we will use a service account which has full
`cluster-admin` role access.

To create the required service account and role bindings a YAML resources file
is provided with each release of the standalone installer for the Educates
lookup service.

{{< note >}}
Note that we are actually using a pre-release snapshot of Educates lookup
service pulled from a pre-release snapshot of Educates 3.0.0. Once Educates
3.0.0 is released, we will be able to reference it via the latest alias and
pickup whatever is the most recent available.
{{< /note >}}

To apply this configuration to the cluster, run the command:

```terminal:execute
command: kubectl apply -f https://github.com/educates/educates-lookup-service/releases/download/3.0.0-rc.1/educates-lookup-service-installer-app-rbac.yaml
```

As well as creating the service account with required roles as mentioned, this
will also create a namespace called `educates-lookup-service-installer` to hold
the service account.

Now create a secret in the Kubernetes cluster which holds the configuration for
deploying Educates by running:

```terminal:execute
command: kubectl create secret generic educates-lookup-service-values -n educates-lookup-service-installer --from-file config=lookup-service-installer-config.yaml --save-config
```

The secret should be created in the `educates-lookup-service-installer` namespace.

You are now ready to install Educates and any required services as dictated by
the configuration you supplied. To do this run the following command:

```terminal:execute
command: kubectl apply -f https://github.com/educates/educates-lookup-service/releases/download/3.0.0-rc.1/educates-lookup-service-installer-app.yaml
```

The same `educates-lookup-service-installer` namespace referenced in prior steps will be used.

To check when Educates has been installed successfully, you can run:

```terminal:execute
command: kctrl app status -n educates-lookup-service-installer -a lookup-service-installer.educates.dev
```

The `kctrl` command is also from the Carvel tools.

It may take a couple of minutes to deploy depending on whether this is the first
time the required container images needed to be pulled down to the Kubernetes
cluster.
