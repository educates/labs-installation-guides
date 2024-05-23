---
title: Package Installation
---

With the configuration created we are ready to perform the installation by
running the CLI command:

```terminal:execute
command: educates admin cluster install --config vcluster-config.yaml
```

Using the Carvel tools linked into the `educates` CLI binary, this will download
the Educates package files (using `vendir`), customize the package YAML files
using our configuration (using `ytt`), resolve the container images used and pin
the versions (using `kbld`), and finally deploy everything to Kubernetes (using
`kapp`).

During the deployment phase you should see the log output as the various
different types of Kubernetes resources are created and everything is verified
as having been deployed successfully.

If all went well, the CLI should respond with:

```
Educates has been installed succesfully
```

Note that this worked because we had effective admin access to the Kubernetes
cluster we were deploying to. If you only have restricted access to the
Kubernetes cluster you are using this would not have worked. This is because
Educates creates new custom resource types in the cluster, and installs a number
of operators to manage those custom resources.
