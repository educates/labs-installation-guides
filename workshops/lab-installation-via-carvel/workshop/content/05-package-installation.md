---
title: Package Installation
---

Although we will be using the `kapp-controller` operator to perform the
installation, before we can do that we need to create a Kubernetes service
account in the cluster and attached roles to it with the permissions required
for installing Educates, as well as what is required at runtime.

Because the Educates training platform may need to create instances of any
available Kubernetes resource type when deploying specific workshops, it needs
to have full `cluster-admin` role access.

To create the required service account and role bindings a YAML resources file
is provided with each Educates release.

To apply this configuration to the cluster, run the command:

```terminal:execute
command: kubectl apply -f https://github.com/educates/educates-training-platform/releases/download/3.3.2/educates-installer-app-rbac.yaml
```

As well as creating the service account with required roles as mentioned, this
will also create a namespace called `educates-installer` to hold the service
account.

Now create a secret in the Kubernetes cluster which holds the configuration for
deploying Educates by running:

```terminal:execute
command: kubectl create secret generic educates-installer -n educates-installer --from-file vcluster-config.yaml --save-config
```

The secret should be created in the `educates-installer` namespace.

You are now ready to install Educates and any required services as dictated by
the configuration you supplied. To do this run the following command:

```terminal:execute
command: kubectl apply -f https://github.com/educates/educates-training-platform/releases/download/3.3.2/educates-installer-app.yaml
```

The same `educates-installer` namespace referenced in prior steps will be used.

To check when Educates has been installed successfully, you can run:

```terminal:execute
command: kctrl app status -n educates-installer -a installer.educates.dev
```

The `kctrl` command is also from the Carvel tools.

It may take a couple of minutes to deploy depending on whether this is the first
time the required container images needed to be pulled down to the Kubernetes
cluster.
