---
title: Package Configuration
---

The next required step is to create an appropriate configuration for deploying
Educates.

For installation of Educates into the virtual cluster created for this workshop
session we will use the following configuration. Click on the action block below
to automatically open the embedded editor and create the file for you.

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
```

The two key bits of information that we are supplying here are the type of
infrastructure provider and what domain name should be used to access workshops
hosted by the cluster after Educates has been installed.

For this workshop session running in Educates, we set the ingress domain for
our Educates installation to correspond to the ingress domain allocated for
this workshop session.

To make it easier to install Educates into a freshly created Kubernetes cluster
a number of opinionated configurations are provided for different infrastructure
providers, such as EKS (AWS), GKE (GCP) and AKS (Azure). In this case we have
set the provider as `vcluster` corresponding to what would be expected for a
virtual cluster created using the
[vCluster](https://github.com/loft-sh/vcluster) package from [Loft
Labs](https://loft.sh/). 

In the case of the opinionated virtual cluster configuration, it makes for
example the assumption that the virtual cluster was preconfigured to delegate
ingress handling to the underlying Kubernetes cluster, and thus the virtual
cluster doesn't itself require an ingress controller to be installed. In the
case of the opinionated configuration for major IaaS providers, they might
instead automatically install and configure the ingress controller as well, and
if appropriate credentials are provided, the DNS provider for that IaaS could
also be automatically configured to point at the ingress router for the cluster
which is installed.

To see what hidden configuration would be added in the case of setting the
provider to `vcluster` you can run the Educates CLI `educates` to expand out
the configuration.

```terminal:execute
command: educates admin platform values --config vcluster-config.yaml 
```

The aim of the opinionated cluster configurations is thus to take a fresh
Kubernetes cluster and install everything you need to run Educates, as well as
Educates itself.
