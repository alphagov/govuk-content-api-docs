---
title: GOV.UK Content API Documentation
---

# About the GOV.UK Content API

The GOV.UK Content API makes it easy to access the data used to render content
on [https://www.gov.uk](https://www.gov.uk). For any page on GOV.UK you can
lookup the [path](#quick-start) to the content to access the data and metadata
of the page.

This API is useful for applications that incorporate content from GOV.UK and
for keeping that content up to date. This provides a more accessible and
predictable interface than what can be achieved through scraping HTML pages.

This API provides access to content that is currently hosted on GOV.UK if you
wish to access historic content this can currently be done through the
[National Archives][]. Historic data may be made available through future
developments to this API.

The API is accessed via [HTTP][] and returns data in a [JSON][] format. The
[reference documentation](reference.html) provides a thorough overview of the
endpoints and the response format.

## Quick start

You can use this API to look up the data that is used to render content on GOV.UK

To get started:

 1. Pick a page on GOV.UK eg. [https://www.gov.uk/take-pet-abroad](https://www.gov.uk/take-pet-abroad)
 2. Make a note of the path eg. `/take-pet-abroad`
 3. Using a tool such as [curl](https://curl.haxx.se/) or [Postman](https://www.getpostman.com/) make a GET request to `https://www.gov.uk/api/content/take-pet-abroad`
 4. You’ll receive a JSON response, the fields for this are explained in the [reference documentation](reference.html)

For example, using [curl](https://curl.haxx.se/) and the [jq](https://stedolan.github.io/jq/) utility:

```shell
curl https://www.gov.uk/api/content/take-pet-abroad | jq
```

## Support

Content API is currently in a [beta](https://www.gov.uk/help/beta) phase and may
be subject to changes and improvements.

If you experience any issues or have questions regarding the Content API please:

- **If you are a government department:** Raise a ticket with [GOV.UK Support][]
- **Otherwise:** [Contact GOV.UK][] with your query

[National Archives]: http://webarchive.nationalarchives.gov.uk/*/https://www.gov.uk/
[HTTP]: https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol
[JSON]: https://en.wikipedia.org/wiki/JSON
[GOV.UK Support]: https://support.publishing.service.gov.uk
[Contact GOV.UK]: https://www.gov.uk/contact/govuk
