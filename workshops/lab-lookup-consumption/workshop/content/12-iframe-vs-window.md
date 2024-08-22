---
title: IFrame vs Window
---

Normally when a web application embedded within an iframe returns a HTTP
response triggering the web browser to perform a redirection, only the view
bounded by the iframe is redirected. This means that if this method of
redirection is used, whatever web page was being redirected to would be
displayed embedded within the original parent web page, just like the workshop
session dashboard had been.

Since this would result in an undesirable nesting of web pages, the workshop
session dashboard is implemented such that when the confirmation button on the
popup windows is pressed, it uses Javascript running in the web browser to
override the target URL for the top most HTML frame displayed by the web
browser.

If you terminate the workshop session you started demonstrating where it was
embedded, you should see this as rather than the result being nested, the whole
browser window is correctly redirected to the target web site.

So under normal circumstances everything works fine and as one would expect.
Because though interaction with the workshop session dashboard is part mediated
via the training portal, there are corner cases that could arise where the
training portal will deliver up an error. Where an error occurs and only an
error page can be returned, the subsequent error page will be displayed within
the iframe.

In certain situations though which are hard to replicate and not always easy to
understand what led to it occuring, the training portal can itself attempt to
trigger a redirection of the users web browser. In this case a standard HTTP
redirection response is used, which results in the target web site being
displayed within the iframe, rather than replacing what the browser window as a
whole is displaying.

For historical and technical reasons, including web browsers blocking the use
of automated Javascript tricks to try and set the target URL for the whole web
browser window, nesting of web pages can thus still occur.
