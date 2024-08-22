---
title: Browser Redirection
---

When a workshop session has ended, the user's browser would usually need to be
redirected back to whatever site they came from in choosing to run the workshop.
This is what happens if using the native web interface for the Educates training
portal, with the user being redirected back to the index page displaying the
list of workshops they can run.

When a workshop is requested via the lookup service REST API, a suitable HTTP
web page or URL handler to redirect the user's browser to must be supplied via
the `clientIndexUrl` property.

What URL the user's web browser should be redirected back to will depend on
whether or not the workshop session dashboard was being embedded within a
web page of the custom front end web portal, or whether it was a new browser
window only displaying the workshop session dashboard.

In the examples so far, the workshop session dashboard was not being embedded
and if you had terminated the workshop session, the browser was redirected to
the URL `https://www.example.com` as we didn't have a custom front end web
portal to redirect to.

For the case where a new browser window had been created for the workshop
session there are a number of options you might consider.

The first option is to redirect to a general company, product or project web
page if the workshop was related to one of these.

The second option is to redirect back to the page from which the user initiated
the workshop session.

The problem with this second option is that the user likely already has a
separate browser window on that web page already since that is where the new
browser window for the workshop session was created.

You might be thinking you could redirect to a special web page which uses
embedded Javascript to close the browser page, however it is possible a browser
may block this and only allow a browser page to be closed from the same source
that originally opened the browser page to begin with.

A third and final option is to still attempt to automatically close the browser
page where a browser allows it, but otherwise display a message thanking the
user for doing the workshop and telling them it is now safe to close their
browser page.

You can test out how your browser behaves by ensuring you have terminated any
existing workshop sessions you requested by selecting "Terminate Session" from
the workshop session dashboard drop down menu, and then running the following.
Click on the session activation URL returned, and then terminate this new
workshop session.

```terminal:execute
command: |-
  curl --silent -X POST -H "Authorization: Bearer ${ACCESS_TOKEN}" -H "Content-Type: application/json" -d '{"tenantName": "example-tenant", "workshopName": "lab-k8s-fundamentals", "clientIndexUrl": "http://files-{{< param session_hostname >}}/htdocs/close-browser-tab.html", "clientUserId": "end-user-id-1"}' http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/workshops | jq
```

If curious as to how the web page the workshop sessions is being redirected to
is implemented see the `htdocs/close-browser-tab.html` file.

```editor:open-file
file: ~/exercises/htdocs/close-browser-tab.html
```

Remember the above options are where the workshop session is launched in a
separate browser window or tab. If a workshop session is embedded in an iframe,
there are further issues that need to be considered. Some of these related to
notifications also apply to where a separate browser window, so keep reading.
