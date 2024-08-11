---
title: Testing the Installation
---

To test that the installation was successful we can deploy a workshop. For this
we will use a previously published workshop by running the command:

```terminal:execute
command: educates deploy-workshop -f https://github.com/educates/lab-k8s-fundamentals/releases/latest/download/workshop.yaml
```

To access the training portal service and browse the workshops hosted by it,
run the command:

```terminal:execute
command: educates browse-workshops
```

When the training portal service is ready, this should automatically open a new
web browser window. Unfortunately though this doesn't work reliably when using
the command inside the terminal of an Educates workshop session due to browser
popup restrictions, it should however work were you running it in a terminal on
your local machine.

For this workshop session therefore, click on the URL displayed in the terminal
window

Alternatively, click on the URL below.

```dashboard:open-url
url: http://educates-cli-ui.{{< param session_hostname >}}
```

In this later case, because an access token isn't included in the URL, you will
be prompted for an access code. Enter in the password obtained by running:

```terminal:execute
command: educates view-credentials
```
