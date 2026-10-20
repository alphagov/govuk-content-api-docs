---
title: How the GOV.UK Content API works
description: Understand the key concepts behind what you can expect to send and receive from the GOV.UK Content API.
type: concept
audience: developer
product: content-api
weight: 30
---

# How the GOV.UK Content API works

This guide introduces a number of key concepts in GOV.UK Content API through
the usage of examples. It utilises [curl](https://curl.haxx.se/) for
interfacing with the API on the command line and is chosen due to the wide
availability of curl, however you may prefer the structured output of
using [HTTPie](https://httpie.org/) or piping the curl responses
through [jq](https://stedolan.github.io/jq/).

## Accessing Content

GOV.UK Content API is used to access content that is hosted on
[www.gov.uk](https://www.gov.uk) (referred to as GOV.UK). For a given HTML
page, for example [VAT Rates](https://www.gov.uk/vat-rates), we can look this
up through this API:

```shell
curl https://www.gov.uk/api/content/vat-rates
```

This will return a [`ContentItem`][content-item] object. Within this object are
fields that describe the content itself, metadata and associations
with other content. This section will explain conceptually some of the key
fields.

### Base path

```json
{
  ...
  "base_path": "/vat-rates",
  ...
}
```

Every [`ContentItem`][content-item] has a `base_path` field which is the same
as the [path parameter](/reference.html#path-get-parameters) used to identify
the content.

The "base" aspect of this field is used as it indicates the root path of this
piece of content as some pieces of content
[span multiple pages][multiple-pages].

### Document type and schema name

```json
{
  ...
  "document_type": "answer",
  "schema_name": "answer",
  ...
}
```

The `document_type` and `schema_name` fields are used to define the format of
the data represented in a [`ContentItem`][content-item]. The main fields that
are affected by this are [`details`](#details) and [`links`](#links).

The `schema_name` refers to a file referenced in
[GOV.UK Content Schemas][content-schemas-repo] which utilises
[JSON Schema][] to describe the rules of the data. The `document_type` defines
the name of the format on GOV.UK. Often these fields share the same value as
there is often only one schema for a particular `document_type`.

This is the case with [VAT Rates][vat-rates-api] where the content returned
utilises the [`answer` schema][answer-schema].

### Details

```json
{
  ...
  "details": {
    "body": "\n<div class=\"highlight-answer\">\n<p>The standard <abbr title=\"Value Added Tax\">VAT</abbr> rate is <em>20%</em></p>\n</div>\n\n<h2 id=\"vat-rates-for-goods-and-services\">\n<abbr title=\"Value Added Tax\">VAT</abbr> rates for goods and services</h2>\n\n<table>\n  <thead>\n    <tr>\n      <th>Rate</th>\n      <th>% of <abbr title=\"Value Added Tax\">VAT</abbr>\n</th>\n      <th>What the rate applies to</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td>Standard</td>\n      <td>20%</td>\n      <td>Most goods and services</td>\n    </tr>\n    <tr>\n      <td>Reduced rate</td>\n      <td>5%</td>\n      <td>Some goods and services, eg children’s car seats and home energy</td>\n    </tr>\n    <tr>\n      <td>Zero rate</td>\n      <td>0%</td>\n      <td>Zero-rated goods and services, eg most food and children’s clothes</td>\n    </tr>\n  </tbody>\n</table>\n\n<p>The standard rate of <abbr title=\"Value Added Tax\">VAT</abbr> increased to 20% on 4 January 2011 (from 17.5%).</p>\n\n<p>Some things are exempt from <abbr title=\"Value Added Tax\">VAT</abbr>, eg postage stamps, financial and property transactions.</p>\n\n<p>The <a href=\"/vat-businesses/vat-rates\"><abbr title=\"Value Added Tax\">VAT</abbr> rate businesses charge</a> depends on their goods and services.</p>\n\n<p>Check the <a href=\"https://www.gov.uk/rates-of-vat-on-different-goods-and-services\">rates of <abbr title=\"Value Added Tax\">VAT</abbr></a> on different goods and services.</p>\n\n",
    "external_related_links": []
  },
  ...
}
```

The `details` field of a [`ContentItem`][content-item] is an object that
contains data in a particular structure relevant for the type of content. This
structure is described by the [schema](#document-type-and-schema-name), which
itself is defined by the `schema_name` field.

In the case of [VAT Rates][vat-rates-api] an [`answer` schema][answer-schema]
is used. The `answer` schema  allows a `body` value, which contains the HTML
for the page and a `external_related_links` value, which is an array that can
be used to provide links to associated pages hosted off GOV.UK.

### Links

The `links` field is used to describe relationships between content. It is
presented as an object where the key represents a link type and the
value represents an array of [`LinkedContentItems`][linked-content-item]. A
`LinkedContentItem` is effectively a condensed [`ContentItem`][content-item].

The values that can be used for link types are defined within the
[schema](#document-type-and-schema-name) associated with the content.
This value describes the type of relationship between content. For example,
with [VAT Rates][vat-rates-api] there is a relationship with a link type of
`mainstream_browse_pages`. The purpose of this link type is to enable linking
to pages to help users find similar content that is suitable for a mainstream
audience.

```json
{
  ...
  "links": {
    ...
    "mainstream_browse_pages": [
      {
        "api_path": "/api/content/browse/tax/vat",
        "api_url": "https://www.gov.uk/api/content/browse/tax/vat",
        "base_path": "/browse/tax/vat",
        "content_id": "895d337a-fa68-4c83-ab79-1c08016afe87",
        "description": "Includes online returns, rates, charging and record keeping",
        "document_type": "mainstream_browse_page",
        "links": {},
        "locale": "en",
        "public_updated_at": "2015-06-24T13:56:39Z",
        "schema_name": "mainstream_browse_page",
        "title": "VAT",
        "web_url": "https://www.gov.uk/browse/tax/vat",
        "withdrawn": false
      }
    ],
    ...
  },
  ...
}
```

You may also notice in the above example that there is a `links` field inside
the `LinkedContentItem` object. This is available as it can be useful to have
a tree of linked content. A common usage of this is to show the hierarchy of
pages through use of the `parent` link type.

## Responses containing HTML

The Content API returns a JSON response containing a details object. Within
this object, various fields, such as body, may contain content formatted using
[Govspeak](https://insidegovuk.blog.gov.uk/2022/07/29/how-were-saving-publishers-time-by-converting-formatted-text/).
Govspeak is a simplified markdown syntax developed for GOV.UK.

The API processes the Govspeak into HTML before returning it in the response.
This pre-rendering ensures that consuming applications can directly display the
content with the intended formatting without needing to implement their own
Govspeak parser. The inclusion of HTML within the JSON payload allows for the
direct presentation of rich text elements, such as headings, lists, and links,
as defined by the original content. This approach standardises content delivery
and maintains consistency across all GOV.UK platforms that utilise the Content
API.

It's important to highlight that even though the API response presents HTML, the
styling is the responsibility of the consuming service that will need to create
its own CSS to present the content in the best way for their application.

[content-item]: /reference.html#schema-contentitem
[linked-content-item]: /reference.html#schema-linkedcontentitem
[vat-rates-api]: https://www.gov.uk/api/content/vat-rates
[multiple-pages]: /retrieve-and-display.html#content-that-spans-multiple-pages
[content-schemas-repo]: https://github.com/alphagov/publishing-api/tree/main/content_schemas
[JSON Schema]: http://json-schema.org/
[answer-schema]: https://github.com/alphagov/publishing-api/blob/ec396b5c305f740c7b3161d344262e4052ad97f9/content_schemas/dist/formats/answer/frontend/schema.json
