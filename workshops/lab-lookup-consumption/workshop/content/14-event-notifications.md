---
title: Event Notifications
---

You may have noticed for the case of where we were redirecting straight to a
target web site page that the URL displayed in the web browser for the target
URL had a query string parameter appended with parameter name `notification`.

When using the native web interface for the training portal, this is passed
so that the web interface can display a message banner.

The possible values of this query string parameter will be:

* `session-deleted` - Used when the workshop session was completed or restarted.
* `startup-timeout` - Used when a startup timeout was specified for a workshop
  and it didn’t start within the required time.
* `session-invalid` - Used when an attempt is made to access a session which
  doesn’t exist. This can occur when the workshop dashboard is refreshed
  sometime after the workshop session has expired and been deleted.

Other values exist for `notification`, but it is believed these situations
should not arise when the REST API is used to request a workshop as HTTP errors
would be returned by the REST API call instead. 

* `workshop-invalid` - Used when the name of the workshop environment supplied
  when attempting to create the workshop was invalid.
* `session-unavailable` - Used when capacity has been reached and a workshop
  session cannot be created.

These other possible values are thus listed here only for informational
purposes, in case they occur for some unknown reason.

For the cases when a notification message is supplied in this way, it will be
added to the query string parameters passed to the URL when redirection is done.
The URL handler or web page can use this to display it's own message banner. It
may also want to rewrite the URL shown in the URL bar of the browser to remove
the notification query string parameter to avoid it being added as part of a
bookmark by a user.

Do note though that in last example where we redirected to a web page which in
turn forced the whole web browser page to be redirected, that this notification
message is received as a query string parameter by the first web page. If you
want it to be passed along to the final target URL, you will need to add it as a
query string parameter to the target URL when forcing redirection. If required
you could change the name of the query string parameter, and value, to match
what is expected of whatever page you may be redirecting to.
