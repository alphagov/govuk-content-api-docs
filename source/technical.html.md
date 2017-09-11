---
title: GOV.UK Content API Documentation
---

# Technical Information

## Security and compliance

### Reporting vulnerabilites

If you believe there is a security issue with the GOV.UK Content API, please
[contact us immediately][support]

Please don’t disclose the suspected breach publicly until it has been fixed.

### HTTPS

GOV.UK Content API follows government HTTPS security guidelines. The Hypertext
Transfer Protocol Secure (HTTPS), which involves the Transport Layer Security
(TLS) protocol is used by the platform to provide secure connections.

### Security patches

We treat security vulnerabilities in the platform and library code in the GOV.UK
Content API as highest priority. The API codebase will be updated as soon as
possible when vulnerabilities are discovered or reported.

We frequently upgrade the framework and library code in the GOV.UK Content API
to latest versions for security and feature enhancements.

## Rate limiting and record limits

There is a maximum limit of 10 requests per second per client. If you exceed
this, your request won't be processed until the limit is no longer exceeded
and you may see timeout errors.

We think this should be sufficient for all users of the API but if you believe
you need the limit increasing you can [contact support][support].

## Versioning

This API is currently beta software and may be subject to changes and
improvements as we learn from usage. We intend to introduce versioning into
this API as part of the process to leave beta.

[support]: ./#support
