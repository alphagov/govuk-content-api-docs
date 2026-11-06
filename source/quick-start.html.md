---
title: Quick start
description: Learn how to get up and running with the GOV.UK Content API for the first time.
type: tutorial
audience: developer
product: content-api
weight: 20
---

# Quick start

You can use the GOV.UK Content API to look up the data that is used to
render content on GOV.UK.

To get started:

 1. Pick a page on GOV.UK, for example: [https://www.gov.uk/take-pet-abroad](https://www.gov.uk/take-pet-abroad).
 2. Make a note of the path, for example: `/take-pet-abroad`.
 3. Using a tool such as [curl](https://curl.haxx.se/),
    [Postman](https://www.getpostman.com/) or your web browser, make a GET
    request to [`https://www.gov.uk/api/content/take-pet-abroad`](https://www.gov.uk/api/content/take-pet-abroad).
 4. You’ll receive a JSON response and the fields for this are
    explained in the [reference documentation](reference.html).

For example, using the curl command line utility tool:

```shell
curl https://www.gov.uk/api/content/take-pet-abroad
```

Or, you can [use the govuk-browser-extension](https://github.com/alphagov/govuk-browser-extension).
Note that this is intended for internal use.

## Authentication

Usage of GOV.UK Content API does not require authentication.
