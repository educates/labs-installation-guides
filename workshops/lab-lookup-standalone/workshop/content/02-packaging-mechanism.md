---
title: Packaging Mechanism
---

Numerous packaging and installation mechanisms exist for applications to be
deployed to a Kubernetes cluster. Probably the most well known is Helm
templates. For Educates, we use an alternative packaging and installation
mechanism utilizing the [Carvel](https://carvel.dev/) tool set.

The Carvel tool set consists of a number of different tools which perform tasks
such as vendoring (`vendir`), YAML templating (`ytt`), container image
resolution and pinning (`kbld`), and Kubernetes application deployment (`kapp`).

Used together these tools provide a very powerful and flexible system for
distributing and installing packages for Kubernetes.

To install Educates you can use the Carvel command line tools from your
computer, or using Carvel's in cluster `kapp-controller` operator.

In this workshop we will use `kapp-controller` to install the Educates lookup
service into the Kubernetes virtual cluster allocated to your workshop session.
