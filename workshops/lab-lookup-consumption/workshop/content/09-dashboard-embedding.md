---
title: Dashboard Embedding
---

When a request for a workshop session is successful, the activation URL for
accessing the workshop session dashboard is returned. Any custom front end
portal would redirect the user's web browser to this URL. In most cases the
redirection to this URL would be done from within an HTML `iframe` included as
part of a larger web page of the custom front end web portal.

When the Educates workshop session dashboard is embedded within an iframe of a
custom front end web portal it is necessary for Educates to have been
[configured](https://docs.educates.dev/installation-guides/configuration-settings#allowing-sites-to-embed-workshops)
with knowledge of the hostname of the custom front end web portal so as to allow
iframe embedding under web content security policies (CSP). If this is not done,
then when redirected, the user's web browser will block access to the embedded
workshop session dashboard.

Although to enable such embedding requires appropriate configuration of
Educates, no special requirements are placed on the custom front end web portal
itself.
