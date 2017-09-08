---
title: GOV.UK Content API Documentation
---

# About the GOV.UK Content API

The GOV.UK Content API provides a simple and consistent way to request GOV.UK content as structured data in a predictable format.

The API accepts HTTP requests and responds with [JSON](https://en.wikipedia.org/wiki/JSON) data containing the same published content as you see presented on GOV.UK. The content retrieved via the API is current, it is published at the same time as the information available on the GOV.UK website.

The GOV.UK Content API is a JSON [RESTful](https://en.wikipedia.org/wiki/Representational_state_transfer) API, an architectural software style in which HTTP requests are used to provide a standard approach to requesting and modifying data.

## Before you start

Read the [reference documentation](reference.html) for a better understanding of the various endpoints made available by the GOV.UK Content API. The documentation contains further detail of the expected structure of the responses from the API and the expected use of data returned in the response.

It's useful to have some understanding of how RESTful APIs use HTTP verbs such as `POST`, `GET`,  `PUT` and `DELETE` to retrieve and modify resources at particular URIs.

## Quick start guide and examples

You can use this API to look up the data that is used to power content on GOV.UK

To get started:

 1. Pick a page on GOV.UK eg. [https://www.gov.uk/take-pet-abroad](https://www.gov.uk/take-pet-abroad)
 2. Make a note of the path eg. `/take-pet-abroad`
 3. Using a tool such as [curl](https://curl.haxx.se/) or [Postman](https://www.getpostman.com/) make a GET request to `https://www.gov.uk/api/content/take-pet-abroad`
 4. You’ll receive a JSON response, the fields for this are explained in the [reference documentation](reference.html)

For example, using [curl](https://curl.haxx.se/) and the [jq](https://stedolan.github.io/jq/) utility:

```shell
curl https://www.gov.uk/api/content/take-pet-abroad | jq
```
