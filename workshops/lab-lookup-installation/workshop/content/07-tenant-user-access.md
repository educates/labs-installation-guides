---
title: Tenant User Acess
---

For access by a custom front end web portal which needs to request the creation
of workshop sessions, rather than a user with `admin` role, a user with `tenant`
role is instead used.

The configuration for this user is:

```editor:append-lines-to-file
file: ~/client-config-tenant.yaml
text: |
    apiVersion: lookup.educates.dev/v1beta1
    kind: ClientConfig
    metadata:
        name: custom-portal
        namespace: educates-config
    spec:
        client:
            password: my-secret
        roles:
            - tenant
        tenants:
            - tenant-1
```

The name of the resource will be the user name for the client. This name does
not need to be the same as either the role or any specific tenant.

One or more tenants can be assigned to a user, meaning they will be able to make
requests against any of those tenants.

In general it is recommended that a user would only be able to acess a single
tenant, but you may want to have a user that can act on behalf of multiple
tenants where all the tenants are managed by the same organisation. Although you
may still want to draw a line between production, staging, or authoring
environments, where all are accessible via the same lookup service.

Apply the configuration for the tenant user.

```terminal:execute
command: kubectl apply -f ~/client-config-tenant.yaml
```

To list all the users which have been configured you can run:

```terminal:execute
command: kubectl get clientconfigs -n educates-config
```

When you have a need to delete a users access, you can use `kubectl delete`
on the resource for that user. Doing this will have the immediate affect of
revoking any active session token and they should be immediately locked out.
