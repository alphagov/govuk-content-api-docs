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

The GOV.UK Content API can be interrogated using the command line utilities `curl` or `wget`. These provide a quick way of seeing the JSON API responses prior to developing more complex integrations.

### `GET` content by `path`

The following example makes an HTTP `GET` request for published content from the GOV.UK Content API via the [`/content/{path}`](reference.html#get-path)  _endpoint_.

It responds with the content identified by the `path` portion of the URI, in this case `/vat-businesses`. This is referred to as the path _parameter_ which acts as an identifier for a content resource.

The path parameter value also corresponds with the URL _path_ of the matching content on GOV.UK. ie [https://www.gov.uk/vat-businesses](https://www.gov.uk/vat-businesses).

#### Running the example

Run the following command in a terminal emulator to see a live JSON response from the GOV.UK Content API.

```sh
curl -X GET https://www.gov.uk/api/content/vat-businesses -H 'Accept: application/json' | json_pp
```

This endpoint responds with a resource containing all the information needed to display a web page on GOV.UK.

#### `GET /content/{path}` response structure

The JSON response contains metadata about the resource, suchas when it was published and what locale the information corresponds to:

```json
 "title" : "Businesses and charging VAT",
 "public_updated_at" : "2014-12-19T15:27:25Z",
 "base_path" : "/vat-businesses",
 "locale" : "en",
 "api_path" : "/api/content/vat-businesses"
```

There are also contextual links to other related content resources contained within the response:

```json
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

The response also contains the content body:

```json
  "body" : "\n<div class=\"highlight-answer\">\n<p>The standard <abbr title=\"Value Added Tax\">VAT</abbr> rate is <em>20%</em></p>\n</div>..."
```

#### Format specific response fields.

Different styles of content on GOV.UK are displayed in distinct _formats_.

For example, simple guidance on current VAT rates can be succinctly displayed in a single page format.
Whereas [The Highway Code](https://www.gov.uk/guidance/the-highway-code) is ordered into multiple sections across several pages.

The GOV.UK Content API exposes these format specific differences in a discrete field called `details`.

In the example above the `body` field containing the content body is embedded in the `details` field.

Compare this to the `details` field from the API response for The Highway Code:

```sh
curl -X GET https://www.gov.uk/api/content/guidance/the-highway-code -H 'Accept: application/json' | json_pp
```

```json
"details": {
  "body": "\n<div role=\"note\" aria-label=\"Information\" class=\"application-notice info-notice\">\n<p>There&rsquo;s a different version of The Highway Code for <a rel=\"external\" href=\"https://www.nidirect.gov.uk/articles/highway-code\">Northern Ireland</a>.</p>\n</div>\n\n<p>You can <a rel=\"external\" href=\"http://www.safedrivingforlife.info/shop/product/official-highway-code-new-edition-2015\">buy The Highway Code</a> from the Safe Driving for Life website, or from most high street and online bookshops, app and eBook stores...",
  "child_section_groups": [
  {
    "title": "Contents",
    "child_sections": [
    {
      "title": "Introduction",
      "description": "Who The Highway Code is for, how it's worded, and the consequences of not following the rules. ",
      "base_path": "/guidance/the-highway-code/introduction"
    },
    {
      "title": "Rules for pedestrians (1 to 35)",
      "description": "The Highway Code rules for pedestrians, including general guidance, crossing the road, crossings, and situations needing extra care.",
      "base_path": "/guidance/the-highway-code/rules-for-pedestrians-1-to-35"
    },
    {
      "title": "Rules for users of powered wheelchairs and mobility scooters (36 to 46) ",
      "description": "The Highway Code rules for powered wheelchairs and mobility scooters, including on pavements and on the road.",
      "base_path": "/guidance/the-highway-code/rules-for-users-of-powered-wheelchairs-and-mobility-scooters-36-to-46"
    },
  ...
```

The chaptered content of this piece of guidance is split into multiple pages and the API response is structured so that these pages, or content resources,
can be visited at a distinct path.

#### Metadata fields

While the `details` fields of the API response may differ per format, the _metadata_ fields, those at the top level of the JSON response, are generally very similar as they describe the content resource, eg. when the item was last updated.

The [reference documentation](reference.html#contentitem) contains much more detail on each of the fields in the API response.

