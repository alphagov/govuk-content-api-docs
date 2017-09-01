---
title: GOV.UK Content API Documentation
---

# About the GOV.UK Content API

The GOV.UK Content API provides a simple and consistent way to request GOV.UK content as structured data in a predictable format.

The API accepts HTTP requests and responds with [JSON](https://en.wikipedia.org/wiki/JSON) data containing the same published content as you see presented on GOV.UK. The content retrieved via the API is current, it is published at the same time as the information available on the GOV.UK website.

The GOV.UK Content API is a JSON [RESTful](https://en.wikipedia.org/wiki/Representational_state_transfer) API, an architectural software style in which standard HTTP requests are used to provide a standard approach to requesting and modifying data.

## Before you start

Read the [reference documentation]() to gain a better understand the various endpoints made available by the GOV.UK Content API. The documentation contains further detail of the expected structure of the responses from the API and the expected use of data returned in the response.

It's useful to have some understanding of how RESTful APIs use HTTP verbs such as `POST`, `GET`,  `PUT` and `DELETE` to retrieve and modify resources at particular URIs.

## Quick start guide and examples

The GOV.UK Content API can be interrogated using a web browser or a command line utility like `curl`, these are useful ways of examining the JSON responses prior to developing more complex integrations with the API.

Visit [https://www.gov.uk/api/content/browse/tax](https://www.gov.uk/api/content/browse/tax) or run the following command in a terminal to see a live JSON response from the GOV.UK Content API.

```
curl https://www.gov.uk/api/content/browse/tax | json_pp
```

This example makes a request for published content from the GOV.UK Content API via the `GET /content/<path>`  _endpoint_ and responds with the content identified by the `<path>` portion of the URI, in this case `/browse/tax`.
