---
title: GOV.UK Content API Documentation
---

# About the GOV.UK Content API

The GOV.UK Content API makes it easy to access the current content from GOV.UK as structured data in a machine readable format. If you require to access historical content, the [National Archives provides an archive of GOV.UK pages](http://webarchive.nationalarchives.gov.uk/*/https://www.gov.uk/), but unfortunately this is not available in an API.

You should use this API if you need to read the current content on GOV.UK in a format more accessible and predictable than scraping HTML pages. By using the API you can expect a consistent response format for each page on GOV.UK making it easy to interpret the content provided without having to worry about keeping up with changes in the format of the HTML pages.

Some examples on where you might use the API are provided in the [Quick Start Guide](#quick-start-guide-and-examples).

The API is provided as a [JSON](https://en.wikipedia.org/wiki/JSON) [RESTful](https://en.wikipedia.org/wiki/Representational_state_transfer) API, an architectural software style in which HTTP requests are used to provide a standard approach to requesting and modifying data. The API accepts HTTP requests and responds with JSON data containing the same published content as you see presented on GOV.UK.

Read the [reference documentation](reference.html) for a better understanding of the various endpoints made available by the API. The documentation contains further detail of the expected structure of the responses from the API and the expected use of data returned in the response. It may be useful to have some understanding of how RESTful APIs use HTTP verbs such as `POST`, `GET`,  `PUT` and `DELETE` to retrieve and modify resources at particular URIs.

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

[GOV.UK Support]: https://support.publishing.service.gov.uk
[Contact GOV.UK]: https://www.gov.uk/contact/govuk
