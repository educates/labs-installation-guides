---
title: Using Secure Ingress
---

By default the Educates lookup service when deployed using the standalone
installer will use an insecure ingress, for production use you should use secure
ingress.

In order to secure ingress for the Educates lookup service, you need to provide
the details of a Kubernetes secret holding an appropriate TLS certificate
covering the hostname for the instance of the lookup service.

If deploying the lookup service in a cluster along side the Educates training
platform, you can use the same wildcard TLS certificate as it uses for
deployment of training portals and workshop sessions.

In this case, presuming that the name of the secret holding the wildcard TLS
certificate was `educates-local-dev.test-tls`, the additional configuration
you need to include in the configuration when installing the lookup service is:

```yaml
# Specify the ingress domain to be used to access the Educates lookup
# service. By default the hostname under this domain which will be assigned
# to the lookup service ingress will be "educates-api". This should match
# what is used for the Educates training platform installation on the same
# cluster.

clusterIngress:
    domain: {{< param session_name >}}.{{< param ingress_domain >}}

# Reference to TLS certificate for secure ingress.

tlsCertificateRef:
  namespace: "educates"
  name: "educates-local-dev.test-tls"
```

Of note, we have set `namespace` within `tlsCertificateRef` to the `educates`
namespace. This will rely on the fact that the Educates training platform is
installed on the same cluster and create a `SecretCopier` to copy the named TLS
secret from the `educates` namespace to the namespace of the lookup service.

If installing the lookup service on a Kubernetes cluster which does not have
the Educates training platform installed, instead of the above, you will need
to manually create an appropriate secret containing the TLS certificate for
the lookup service hostname in the same namespace as the lookup service is
being installed. The configuration would then be:

```yaml
# Specify the ingress domain to be used to access the Educates lookup
# service. By default the hostname under this domain which will be assigned
# to the lookup service ingress will be "educates-api".

clusterIngress:
    domain: {{< param session_name >}}.{{< param ingress_domain >}}

# Reference to TLS certificate for secure ingress. No namespace is specified
# and the secret must be created in the same namespace as the lookup service
# is being installed.

tlsCertificateRef:
  name: "educates-local-dev.test-tls"
```
