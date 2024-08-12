---
title: Kubeconfig Secret
---

We now need to create Kubernetes secrets in the `educates-config` namespace of
the `hub` cluster for each of the `kubeconfig` files for the remote clusters.

```terminal:execute
command: |-
  kubectl create secret generic kubeconfig-cluster-1 --context hub -n educates-config --from-file config=kubeconfig-cluster-1.yaml
  kubectl create secret generic kubeconfig-cluster-2 --context hub -n educates-config --from-file config=kubeconfig-cluster-2.yaml
```

We store the `kubeconfig` file against the `config` data key in the secret as
that is what the lookup service will by default expect.

You can verify that the secrets were created okay by running:

```terminal:execute
command: kubectl get secrets --context hub -n educates-config
```
