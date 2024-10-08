---
title: Remote Clusters
---

In order for the lookup service to monitor a remote cluster, it needs to be
provided with a suitable `kubeconfig` file for accessing the cluster. The
Kubernetes service account in the remote cluster should be configured with RBAC
that permits `get`, `list` and `watch` access to the following Educates custom
resources.

* TrainingPortal
* WorkshopEnvironment
* WorkshopSession
* WorkshopAllocation
* Workshop

Although it may be tempting to using a `kubeconfig` file which provides
`cluster-admin` access to the remote cluster, it is strongly advised that this
not be done.

Because the steps required against each remote cluster to create the service
account, role, role binding and the Kubernetes access token secret are somewhat
fiddly, an `educates` CLI command has been provided for generating a suitable
`kubeconfig` file for a cluster. This generates the `kubeconfig` file from the
required resources where they have been pre-created when Educates was installed.

To create a suitable `kubeconfig` file for `cluster-1` run:

```terminal:execute
command: |-
  educates admin lookup kubeconfig --context cluster-1 --output kubeconfig-cluster-1.yaml
```

In case you don't want to use the `educates` CLI, you can also use `kubectl`.
The steps for this are a bit more complicated though so as way of example we
have also included the `generate-kubeconfig.sh` shell script.

```terminal:execute
command: |-
  ./generate-kubeconfig.sh --context cluster-2 > kubeconfig-cluster-2.yaml
```

To verify access to `cluster-1` using the generated `kubeconfig` file, run:

```terminal:execute
command: kubectl get trainingportals --kubeconfig kubeconfig-cluster-1.yaml
```

The output will be empty as no training portals have yet been created, but more
importantly it should not error.

If you instead run:

```terminal:execute
command: kubectl get namespaces --kubeconfig kubeconfig-cluster-1.yaml
```

it should fail as the RBAC for the service account from which the `kubeconfig`
file is being generated does not allow any access to namespaces.

Also check access for `cluster-2` by running:

```terminal:execute
command: kubectl get trainingportals --kubeconfig kubeconfig-cluster-2.yaml
```

To view the contents of the `generate-kubeconfig.sh` script use the editor.

```editor:open-file
file: ~/exercises/generate-kubeconfig.sh
```
