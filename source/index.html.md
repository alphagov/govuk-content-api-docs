---
title: GOV.UK Content API Documentation
---

# About GOV.UK Content API

GOV.UK Content API makes it easy to access the data used to render content
on [https://www.gov.uk](https://www.gov.uk). For any page hosted on www.gov.uk
you can lookup the [path](#quick-start) to access the content component and
associated metadata for a page.

This API is useful for applications that incorporate content from GOV.UK and
for keeping that content up to date. This provides a more accessible and
predictable interface than what can be achieved through scraping HTML pages.

This API provides access to content that is currently hosted on www.gov.uk. If
you wish to access historic content this can currently be done through the
[National Archives][]. Historic data may be made available through future
developments to this API.

GOV.UK Content API is accessed via [HTTP][] and returns data in a [JSON][]
format. The [reference documentation](reference.html) provides a thorough
overview of the endpoints and the response format.

## Quick start

You can use GOV.UK Content API to lookup the data that is used to render
content on GOV.UK.

To get started:

 1. Pick a page on GOV.UK eg. [https://www.gov.uk/take-pet-abroad](https://www.gov.uk/take-pet-abroad)
 2. Make a note of the path eg. `/take-pet-abroad`
 3. Using a tool such as [curl](https://curl.haxx.se/),
    [Postman](https://www.getpostman.com/) or your web browser, make a GET
    request to [`https://www.gov.uk/api/content/take-pet-abroad`](https://www.gov.uk/api/content/take-pet-abroad)
 4. You’ll receive a JSON response and the fields for this are
    explained in the [reference documentation](reference.html)

For example, using [curl](https://curl.haxx.se/) command line utility and the
[jq](https://stedolan.github.io/jq/) tool to display the response:

```shell
curl https://www.gov.uk/api/content/take-pet-abroad | jq
```

## Support

GOV.UK Content API is currently in a [beta](https://www.gov.uk/help/beta)
phase and may be subject to changes and improvements.

If you experience any issues or have questions regarding GOV.UK Content API
please:

- **If you are a government department:** Raise a ticket with [GOV.UK Support][]
- **Otherwise:** [Contact GOV.UK][] with your query

To keep informed of changes and developments to this API please join our
[mailing list][google-group].

## Security and compliance

### Reporting vulnerabilities

If you believe there is a security issue with GOV.UK Content API, please
[contact us immediately](#support).

Please don’t disclose the suspected breach publicly until it has been fixed.

### HTTPS

GOV.UK Content API follows government HTTPS security guidelines. The
Hypertext Transfer Protocol Secure (HTTPS), which involves the Transport Layer
Security (TLS) protocol is used by the platform to provide secure connections.

### Security patches

We treat security vulnerabilities in the platform and library code in the GOV.UK
Content API as our highest priority. The codebase will be updated as soon as
possible when vulnerabilities are discovered or reported.

We frequently upgrade the framework and library code in GOV.UK Content API
to the latest versions for security and feature enhancements.

## Rate limiting and record limits

There is a maximum limit of 10 requests per second per client. If you exceed
this your request won't be processed until the limit is no longer exceeded
and you may see timeout errors.

We think this should be sufficient for all users of GOV.UK Content API but
if you believe you need the limit increasing you can [contact support](#support).

## Versioning

GOV.UK Content API is currently beta software and may be subject to changes
and improvements as we learn from usage. We intend to introduce a versioning
distinction to this API before we complete the beta phase.

[google-group]: https://groups.google.com/a/digital.cabinet-office.gov.uk/forum/#!forum/contentapi
[National Archives]: http://webarchive.nationalarchives.gov.uk/*/https://www.gov.uk/
[HTTP]: https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol
[JSON]: https://en.wikipedia.org/wiki/JSON
[GOV.UK Support]: https://support.publishing.service.gov.uk
[Contact GOV.UK]: https://www.gov.uk/contact/govuk
