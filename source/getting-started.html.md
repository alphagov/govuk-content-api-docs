---
title: Getting Started
---

# Getting Started

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

```
{
  ...
  "base_path": "/vat-rates",
  ...
}
```

Every [`ContentItem`][content-item] has a `base_path` field which is the same
as the [path parameter](/reference.html#parameters) used to identify the
content.

The "base" aspect of this field is used as it indicates the root path of this
piece of content as some pieces of content
[span multiple pages][multiple-pages].

### Document type and schema name

```
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

```
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

```
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

## Making use of content

It can be simple to make use of GOV.UK in your application. The example below
illustrates a example utilising [Ruby on Rails](http://rubyonrails.org/)
with [Rest Client](https://github.com/rest-client/rest-client).


```ruby
require "rest-client"

tax_help = Rails.cache.fetch("govuk/tax-help", expires_in: 1.hour) do
  response = RestClient.get("https://www.gov.uk/api/content/tax-help", { content_type: "json" })
  JSON.parse(response.body).dig("details", "body")
end

content = "<h1>GOV.UK Tax Help</h1><div>#{tax_help}</div>"
```

In this example we utilise the Rails cache layer so that we can infrequently
access the content without concerns of hitting the
[rate limit][rate-limiting].

We then use the API to access the content for
[Tax Help](https://www.gov.uk/tax-help). In the response we access the `body`
field from within the `details` object. We store this to a variable `tax_help`.

Finally we embed this in our own HTML and are ready to output to users.

## Content that spans multiple pages

Sometimes a piece of content served by this API is used to render multiple
pages on GOV.UK. This is a situation that occurs when the content may be
presented in different scenarios.

An example of this can be found with travel advice. The
[local laws and customs][thailand-laws-customs] for Thailand can be accessed as
a single page and is also available as part of a
[complete printable guide][thailand-print]. Within the API this is powered by
a single piece of content available at
[/api/content/foreign-travel-advice/thailand][thailand-api].

You can however access this by using the path of the page you wish to access,
`/foreign-travel-advice/thailand/local-laws-and-customs`. In this case you will
receive a 303 redirect response to the canonical source of the content.

```shell
$ curl -I https://www.gov.uk/api/content/foreign-travel-advice/thailand/local-laws-and-customs
HTTP/1.1 303 See Other
...
Location: https://www.gov.uk/api/content/foreign-travel-advice/thailand
...
```

## Withdrawn content

Some content provided on GOV.UK provides information that is no longer
applicable but has been kept for posterity. This content is described as
being "withdrawn".

When browsing GOV.UK you may see withdrawn content which is introduced by a
header describing its status. An example of this is
[The complete routine immunisation schedule 2013 to 2014][immunisation-withdrawn]
which was withdrawn as the content had become out of date.

Withdrawn status is represented in GOV.UK Content API through the
`withdrawn_notice` field. We can look up the value for this using the above
example.

```shell
curl https://www.gov.uk/api/content/government/publications/the-complete-routine-immunisation-schedule-201314
```

Within the returned [`ContentItem`][content-item] object there is a
[`WithdrawnNotice`][withdrawn-notice] object that describes the withdrawn
status.

```
"withdrawn_notice": {
  "explanation": "<div class=\"govspeak\"><p>This document is out of date.  See the current <a href=\"https://www.gov.uk/government/publications/the-complete-routine-immunisation-schedule\">complete routine immunisation schedule</a>.</p>\n</div>",
  "withdrawn_at": "2015-08-12T13:47:11Z"
}
```

[content-item]: /reference.html#contentitem
[linked-content-item]: /reference.html#linkedcontentitem
[withdrawn-notice]: /reference.html#withdrawnnotice
[vat-rates-api]: https://www.gov.uk/api/content/vat-rates
[multiple-pages]: #content-that-spans-multiple-pages
[content-schemas-repo]: https://github.com/alphagov/govuk-content-schemas
[JSON Schema]: http://json-schema.org/
[answer-schema]: https://github.com/alphagov/govuk-content-schemas/blob/d0606b8a1add8066d90bcb00e890fd619340fd81/dist/formats/answer/frontend/schema.json
[rate-limiting]: /#rate-limiting
[thailand-laws-customs]: https://www.gov.uk/foreign-travel-advice/thailand/local-laws-and-customs
[thailand-print]: https://www.gov.uk/foreign-travel-advice/thailand/print
[thailand-api]: https://www.gov.uk/api/content/foreign-travel-advice/thailand
[immunisation-withdrawn]: https://www.gov.uk/government/publications/the-complete-routine-immunisation-schedule-201314
