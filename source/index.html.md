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

Visit [https://www.gov.uk/api/content/vat-businesses](https://www.gov.uk/api/content/vat-businesses) or run the following command in a terminal emulator to see a live JSON response from the GOV.UK Content API.

```
curl https://www.gov.uk/api/content/vat-businesses | json_pp
```

This example makes a request for published content from the GOV.UK Content API via the `GET /content/<path>`  _endpoint_ and responds with the content identified by the `<path>` portion of the URI, in this case `/vat-businesses`.

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

There are contextual links to other related content resources:

```
  "links" : {
      "mainstream_browse_pages" : [
         {
            "public_updated_at" : "2015-06-24T13:56:39Z",
            "base_path" : "/browse/tax/vat",
            "api_path" : "/api/content/browse/tax/vat",
            "locale" : "en",
            ...
            "content_id" : "895d337a-fa68-4c83-ab79-1c08016afe87",
            "api_url" : "https://www.gov.uk/api/content/browse/tax/vat",
            "web_url" : "https://www.gov.uk/browse/tax/vat",
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
                     "document_type" : "mainstream_browse_page",
                     "content_id" : "71255733-af6c-4887-9991-9b288d8d431f",
                     "api_path" : "/api/content/browse/tax",
                     "locale" : "en",
                     ...
                     "base_path" : "/browse/tax",
                     "web_url" : "https://www.gov.uk/browse/tax",
                     "api_url" : "https://www.gov.uk/api/content/browse/tax",
                     "title" : "Money and tax",
                     "description" : "Includes VAT, debt and inheritance tax"
                  }
               ]
            }
          ...
```

