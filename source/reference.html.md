---
title: API reference
description: Reference information for the GOV.UK Content API endpoints, schemas and rate limits.
type: reference
audience: developer
product: content-api
weight: 70
---

api>

## Rate limiting

There is a maximum limit of 10 requests per second per client. If you exceed
this your request won’t be processed until the limit is no longer exceeded
and you may see timeout errors.

We think this should be sufficient for all users of GOV.UK Content API but
if you believe you need the limit increasing you can [contact support][support].

[support]: /support.html
