---
title: GOV.UK Content API Documentation
---

# Technical Information

## Security and compliance

### Reporting vulnerabilites

If you believe GOV.UK Content API security has been breached, contact us immediately at govuk-content-api-support@digital.cabinet-office.gov.uk.

Please don’t disclose the suspected breach publically until it has been fixed.

### HTTPS

GOV.UK Content API follows government HTTPS security guidelines. The Hypertext Transfer Protocol Secure (HTTPS), which involves the Transport Layer Security (TLS) protocol is used by the platform to provide secure connections.

### Security patches

We treat security vulnerabilities in the platform and library code in the GOV.UK Content API as highest priority. The API codebase will be updated as soon as possible when vulnerabilites are discovered or reported.

We frequently upgrade the framework and library code in the GOV.UK Content API to latest versions for security and feature enhancements.

## Rate limiting and record limits

There is a maximum limit of 10 requests per second per client. If you exceed this, your request won't be processed until the limit is no longer exceeded and you may see timeout errors.

We think this should be sufficient for all users of the API but if you believe you need the limit increasing you can [contact support](#support-community).

## Versioning

This API is currently in beta, so versioning isn't in place at the moment. We have plans to add versioning in future releases, and each new version of this documentation will cover the changes that have been made to the API.

You can be notified of new changes to the API by [getting in contact](#support/community) with the team.

## Authors and acknowledgments

GOV.UK API for Content Team: Emma Beynon, Kevin Dew, Ben Hazell, Steve Laing, Thomas Leese, Hong Nguyen, Patrick Opoosun, Antonia Simmons, Felix Tomlinson
