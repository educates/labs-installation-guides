---
title: Install kapp-controller
---

The `kapp-controller` operator from the Carvel package which we are going to use
for installation will first need to be installed into the Kubernetes cluster.

The latest documentation for installing `kapp-controller` can be found at:

* https://carvel.dev/kapp-controller/docs/latest/install/

To install it in this virtual cluster provided with this workshop session
run:

```terminal:execute
command: kubectl apply -f https://github.com/carvel-dev/kapp-controller/releases/latest/download/release.yml
```

You will need to have cluster admin access to the cluster in order to install
`kapp-controller` and install Educates.
