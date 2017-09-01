---
title: GOV.UK Content API Documentation
---

# About the GOV.UK Content API

The GOV.UK Content API provides a simple and consistent way to request GOV.UK content as structured data in a predictable format.

The API accepts HTTP requests and responds with [JSON](https://en.wikipedia.org/wiki/JSON) data containing the same published content as you see presented on GOV.UK. The content retrieved via the API is current, it is published at the same time as the information available on the GOV.UK website.

The GOV.UK Content API is a JSON [RESTful](https://en.wikipedia.org/wiki/Representational_state_transfer) API, an architectural software style in which HTTP requests are used to provide a standard approach to requesting and modifying data.

## Before you start

Read the [reference documentation](./reference.html) for a better understanding of the various endpoints made available by the GOV.UK Content API. The documentation contains further detail of the expected structure of the responses from the API and the expected use of data returned in the response.

It's useful to have some understanding of how RESTful APIs use HTTP verbs such as `POST`, `GET`,  `PUT` and `DELETE` to retrieve and modify resources at particular URIs.

## Quick start guide and examples

The GOV.UK Content API can be interrogated using the command line utilities `curl` or `wget`. These provide a quick way of seeing the JSON API responses prior to developing more complex integrations.

The following example makes an HTTP `GET` request for published content from the GOV.UK Content API via the [`/content/{path}`](/reference.html#get-path)  _endpoint_. It responds with the content identified by the `path` portion of the URI, in this case `/vat-businesses`.

This path corresponds with the path used to access the content on GOV.UK: [https://www.gov.uk/vat-businesses](https://www.gov.uk/vat-businesses).

Run the following command in a terminal emulator to see a live JSON response from the GOV.UK Content API.

```
curl -X GET https://www.gov.uk/api/content/vat-businesses -H 'Accept: application/json' | json_pp
```


This endpoint responds with a resource containing all the information needed to display a web page on GOV.UK.

The JSON response contains metadata about the resource, suchas when it was published and what locale the information corresponds to:

```
 "title" : "Businesses and charging VAT",
 "public_updated_at" : "2014-12-19T15:27:25Z",
 "base_path" : "/vat-businesses",
 "locale" : "en",
 "api_path" : "/api/content/vat-businesses"
```

The response also contains the content body (truncated for clarity):

```
  "body" : "\n<div class=\"highlight-answer\">\n<p>The standard <abbr title=\"Value Added Tax\">VAT</abbr> rate is <em>20%</em></p>\n</div>..."
```

There are also contextual links to other related content resources contained within the response:

```
  "links" : {
      "mainstream_browse_pages" : [
         {
            "public_updated_at" : "2015-06-24T13:56:39Z",
            "base_path" : "/browse/tax/vat",
            "api_path" : "/api/content/browse/tax/vat",
            "locale" : "en",
            ...
            "description" : "Includes online returns, rates, charging and record keeping",
            "title" : "VAT",
         }
      ],
      "parent" : [
         {
            "title" : "VAT",
            "description" : "Includes online returns, rates, charging and record keeping",
            "links" : {
               "parent" : [
                  {
                     "public_updated_at" : "2015-04-08T10:48:40Z",
                     "api_path" : "/api/content/browse/tax",
                     "locale" : "en",
                     ...
                     "base_path" : "/browse/tax",
                     "title" : "Money and tax",
                     "description" : "Includes VAT, debt and inheritance tax"
                  }
          ...
```

