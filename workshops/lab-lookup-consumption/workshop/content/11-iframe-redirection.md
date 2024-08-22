---
title: IFrame Redirection
---

The issue of iframe redirection arises where instead of a custom front end web
portal popping out a workshop session into a new browser window, it embeds the
workshop session dashboard within another web page.

To demonstrate what is meant here, run the following command to create a web
page which embeds the workshop session dashboard returned when a workshop is
requested.

```terminal:execute
command: |-
  SESSION_ACTIVATION_URL=$(curl --silent -X POST -H "Authorization: Bearer ${ACCESS_TOKEN}" -H "Content-Type: application/json" -d '{"tenantName": "example-tenant", "workshopName": "lab-k8s-fundamentals", "clientIndexUrl": "http://files-{{< param session_hostname >}}/htdocs/root-of-web-site.html", "clientUserId": "end-user-id-1"}' http://educates-api.hub.{{< param session_name >}}.{{< param ingress_domain >}}/api/v1/workshops | jq -r -e .sessionActivationUrl) && echo $SESSION_ACTIVATION_URL && export SESSION_ACTIVATION_URL && envsubst < templates/embedded-dashboard.html > htdocs/embedded-dashboard.html
```

Now click below to open up this web page.

```dashboard:open-url
url: http://files-{{< param session_hostname >}}/htdocs/embedded-dashboard.html
```

Where the standard Educates workshop session dashboard theme is used, there are
a number of ways a workshop session can be exited due to actions of the user.

* Going through all the workshop instructions and clicking on "Finish Workshop"
  on the final page.
* Selecting the "Terminate Session" option in the drop down menu in the workshop
  session dashboard.
* Clicking on the exit icon in the workshop session dashboard banner.

In all of these cases a popup window will be displayed to confirm that the user
wants to exit, thus terminating, the workshop session.

In addition to the above cases initiated by the user, a popup window will also
be displayed when the specified duration allowed for the workshop is expired.

In all cases, pressing on the confirmation button on the popup window will
result in the workshop session being terminated if still running, with the users
web browser being redirected to the URL specified in the original request for a
workshop.
