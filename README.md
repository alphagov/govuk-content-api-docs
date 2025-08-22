# GOV.UK Content API Documentation

This is a microsite for providing documentation for the GOV.UK Content API. It
is hosted at [https://content-api.publishing.service.gov.uk](https://content-api.publishing.service.gov.uk).

This documentation is built from source files in this repository and an
[OpenAPI][] specification [file][content-store-openapi] for the
[Content Store][content-store] application.

The framework for this documentation is provided by the
[GOV.UK Tech Docs Template][tech-docs-template].

## Updating content

The [reference.html][reference-page] page is built using the
[openapi.yaml][content-store-openapi] file. Changes to content on this page
should be made by opening a pull request against the
[Content Store][content-store] application.

Other HTML pages are in the [/source][source-dir] directory of this repository
and are authored using Markdown. You can suggest edits to these pages by making
changes in a branch or fork of this project and then opening a pull request.

## Running documentation locally

To run the documentation locally you should have this repository checked out
as well as the [Content Store][content-store].

### Installing dependencies

Setting up the documentation requires Ruby. Run the following to install the
necessary dependencies:

```shell
make requirements
```

### Preview changes

Whilst writing documentation we can run a middleman server to preview how the
published version will look in the browser. After saving a change the preview in
the browser will automatically refresh on HTML pages. However for changes to
[openapi.yaml][content-store-openapi] you will need to restart the preview.

The preview is only available on our own computer. Others won't be able to
access it if they are given the link.

Type the following to start the server:

```shell
make server
```

You should now be able to view a live preview at [http://localhost:4567](http://localhost:4567).

## Publishing changes

Run the following command on your local machine to deploy the application:

```shell
make publish
```

This will push to the `gh-pages` branch and therefore deploy to GitHub Pages.

> There is no automatic or continuous deployment for this application.

## License

[MIT License](LICENCE)

[content-store-openapi]: https://github.com/alphagov/content-store/blob/main/openapi.yaml
[content-store]: https://github.com/alphagov/content-store
[OpenAPI]: https://github.com/OAI/OpenAPI-Specification
[reference-page]: https://content-api.publishing.service.gov.uk/reference.html
[source-dir]: https://github.com/alphagov/govuk-content-api-docs/tree/main/source
[tech-docs-template]: https://github.com/alphagov/tech-docs-template
