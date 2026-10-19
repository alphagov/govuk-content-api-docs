---
title: Retrieve and display GOV.UK content
description: tbc
type: tutorial
audience: developer
product: content-api
weight: 40
---

# Retrieve and display GOV.UK content

The example below illustrates utilising [Ruby on Rails](http://rubyonrails.org/)
with [Rest Client](https://github.com/rest-client/rest-client) to make use of
GOV.UK in your application.

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

```json
"withdrawn_notice": {
  "explanation": "<div class=\"govspeak\"><p>This document is out of date.  See the current <a href=\"https://www.gov.uk/government/publications/the-complete-routine-immunisation-schedule\">complete routine immunisation schedule</a>.</p>\n</div>",
  "withdrawn_at": "2015-08-12T13:47:11Z"
}
```

[content-item]: /reference.html/#schema-contentitem
[withdrawn-notice]: /reference.html#schema-withdrawnnotice
[rate-limiting]: /reference.html#rate-limiting
[thailand-laws-customs]: https://www.gov.uk/foreign-travel-advice/thailand/local-laws-and-customs
[thailand-print]: https://www.gov.uk/foreign-travel-advice/thailand/print
[thailand-api]: https://www.gov.uk/api/content/foreign-travel-advice/thailand
[immunisation-withdrawn]: https://www.gov.uk/government/publications/the-complete-routine-immunisation-schedule-201314
