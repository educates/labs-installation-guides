---
title: Kubernetes Cluster
---

The full Educates training platform requires a Kubernetes cluster in which to
run. It is possible to deploy single workshop instances in a local docker
container runtime, however in this workshop we will only be covering deployment
to Kubernetes.

Kubernetes clusters which can be used include being able to use a local Kind
cluster running on your own computer, or a hosted Kubernetes cluster such as EKS
(AWS), GKE (GCP) or AKS (Azure). You can also use a custom Kubernetes cluster
you have installed yourself to an IaaS or your own compute hardware.

In this workshop we will be deploying to a Kubernetes virtual cluster created
for you for this workshop session. This virtual cluster is running inside of the
larger Kubernetes cluster that the Educates instance hosting this workshop, is
running.

In other words, we are using Educates itself to teach you about installing
Educates.
