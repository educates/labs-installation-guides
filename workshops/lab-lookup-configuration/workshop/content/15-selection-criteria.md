---
title: Selection Criteria
---

In the examples we used for this workshop we employed a label selector to match
on clusters and training portals.

The use of labels provides the most flexibility as they can easily be updated
for a cluster or training portal without needing to delete and recreate a
resource, which would be the case if name based matching were used and you
needed to change the name of a resource.

Do note that labels matched by the lookup service are not Kubernetes labels
declared in the resource metadata but are labels specific to Educates which are
declared within the `spec` of the custom resources.

The previous example for `ClusterConfig` already showed the use of labels. In
the case of the training portal we created, because we used the `educates` CLI,
where the label was placed in the definition of the `TrainingPortal` was not
obvious.

If deploying training portals using the `TrainingPortal` resource rather than
the CLI, labels should be included in the `spec.portal.labels` section.

```
apiVersion: training.educates.dev/v1beta1
kind: TrainingPortal
metadata:
  name: portal-1
spec:
  portal:
    labels:
    - name: environment
      value: staging
```

In addition to `matchLabels` being supported by the `labelSelector` declaration,
it is also possible to use `matchExpressions`. This operates the same way as
for other Kubernetes resources but again targets the Educates specific labels
and not the Kubernetes labels specified in the resource metadata.

In place of, or in addition to `labelSelector`, you can also use `nameSelector`.

```
    apiVersion: lookup.educates.dev/v1beta1
    kind: TenantConfig
    metadata:
        name: tenant-1
        namespace: educates-config
    spec:
        clusters:
            nameSelector:
                matchNames:
                - remote-cluster-1
                - remote-cluster-2
        portals:
            nameSelector:
                matchNames:
                - "portal-*-production"
```

For `nameSelector` you need to specify a list of names against `matchNames`.
These can be literal names where an exact match is required, or you can also
use wildcards.
