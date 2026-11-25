---
title: Retrieve and display GOV.UK content
description: Learn how to retrieve and embed a piece of GOV.UK content in your HTML, and how to recognise non-canonical and withdrawn content.
type: tutorial
audience: developer
product: content-api
weight: 40
---

# Retrieve and display GOV.UK content

The example below illustrates utilising [Ruby on Rails](http://rubyonrails.org/)
with [Rest Client](https://github.com/rest-client/rest-client) to make use of
GOV.UK in your application.

<!-- markdownlint-disable MD013 -->
```ruby
require "rest-client"

tax_help = Rails.cache.fetch("govuk/tax-help", expires_in: 1.hour) do
  response = RestClient.get("https://www.gov.uk/api/content/tax-help", { content_type: "json" })
  JSON.parse(response.body).dig("details", "body")
end

content = "<h1>GOV.UK Tax Help</h1><div>#{tax_help}</div>"
```
<!-- markdownlint-enable MD013 -->

In this example we utilise the Rails cache layer so that we can infrequently
access the content without concerns of hitting the
[rate limit][rate-limiting].

We then use the API to access the content for
[Tax Help](https://www.gov.uk/tax-help). In the response we access the `body`
field from within the `details` object. We store this to a variable `tax_help`.

Finally we embed this in our own HTML and are ready to output to users.

[rate-limiting]: /reference.html#rate-limiting
