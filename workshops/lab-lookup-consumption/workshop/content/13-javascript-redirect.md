---
title: Javascript Redirect
---

Although we noted that some web browsers may place restrictions on when
automatically run Javascript can trigger a redirection, it is recommended that
when specifying `clientIndexUrl` with a workshop request, that instead of
passing the URL for where you ultimately what the user redirected, that you pass
a URL which targets a special URL handler or web page, which attempts to force
redirection of the whole web browser page using Javascript.

To demonstrate this and determine whether it will work with a specific web
browser, run:

```terminal:execute
command: |-
  SESSION_ACTIVATION_URL=$(curl --silent -X POST -H "Authorization: Bearer ${ACCESS_TOKEN}" -H "Content-Type: application/json" -d '{"tenantName": "example-tenant", "workshopName": "lab-k8s-fundamentals", "clientIndexUrl": "http://files-{{< param session_hostname >}}/htdocs/javascript-redirect.html?target=http://files-{{< param session_hostname >}}/htdocs/root-of-web-site.html", "clientUserId": "end-user-id-1"}' http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/workshops | jq -r -e .sessionActivationUrl) && echo $SESSION_ACTIVATION_URL && export SESSION_ACTIVATION_URL && envsubst < templates/embedded-dashboard.html > htdocs/embedded-dashboard.html
```

Now click below to open up this web page.

```dashboard:open-url
url: http://files-{{< param session_hostname >}}/htdocs/embedded-dashboard.html
```

If you look carefully above you will see that when passing `clientIndexUrl` we
have passed a URL to our special web page for handling the redirect. The actual
target URL where we want the users web browser to eventually be redirected
is passed as a query string parameter to that URL.

If curious as to how the special web page handling the redirection is
implemented see the `htdocs/javascript-redirect.html` file.

```editor:open-file
file: ~/exercises/htdocs/javascript-redirect.html
```

Obviously with both this web page and the prior one we showed which attempts to
close the web browser window, and which may not work and display a message, a
more appropriate message, layout and theme would be used to match the style of
your custom front end web portal.
