# GOV.UK Content API Documentation

This is a microsite for providing documentation for the GOV.UK Content API. It
is hosted at https://content-api.publishing.service.gov.uk.

This documentation is built from source files in this repository and an
[OpenAPI](https://github.com/OAI/OpenAPI-Specification) specification
[file][content-store-openapi] for the
[Content Store][content-store] application.

The framework for this documentation
is provided by the [GOV.UK Tech Docs Template][tech-docs-template] and through
the use of a [fork][forked-widdershins] of [widdershins][widdershins] to
convert the [`openapi.yaml`][content-store-openapi] to Markdown.

## Updating content

The [`reference.html`][reference-page] page is built using the
[`openapi.yaml`][content-store-openapi] file. Changes to content on this page
should be made by opening a pull request against the
[Content Store][content-store] application. Some aspects of the reference.html
page are controlled by templates which are stored in the
[`/templates`][templates-dir] of this repository.

Other HTML pages are in the [`/source`][source-dir] of this repository and are
authored using Markdown. You can suggest edits to these pages by making changes
in a branch or fork of this project and then opening a pull request.

## Running documentation locally

To run the documentation locally you should have this repository checked out
as well as the [Content Store][content-store].

### Installing dependencies

Setting up the documentation requires Ruby and Node. Run the following to
install the necessary dependencies:

```
make requirements
```

### Preview changes

Whilst writing documentation we can run a middleman server to preview how the
published version will look in the browser. After saving a change the preview in
the browser will automatically refresh on HTML pages. However for changes to
[`openapi.yaml`][content-store-openapi] you will need to restart the preview.

The preview is only available on our own computer. Others won't be able to
access it if they are given the link.

Type the following to start the server:

```
make server API_SPEC=../content-store/openapi.yaml
```

You should now be able to view a live preview at http://localhost:4567.

## Publishing changes

The master branch of this repository is published every 30 minutes to the
`gh-pages` branch. It uses the `deployed-to-production` branch of
[Content Store][content-store]. Thus once a pull request is merged into master
changes will automatically display on the site within 30 minutes.

If for some reason the automatic deployment fails you can deploy with the
following command:

```
make publish API_SPEC=<path/to/openapi.yaml>
```

This will push to the `gh-pages` branch and therefore deploy to GitHub Pages.

## License

[MIT License](LICENSE)

[forked-widdershins]: https://github.com/alphagov/widdershins
[widdershins]: https://github.com/Mermade/widdershins
[content-store-openapi]: https://github.com/alphagov/content-store/blob/deployed-to-production/openapi.yaml
[content-store]: https://github.com/alphagov/content-store
[templates-dir]: https://github.com/alphagov/govuk-content-api-docs/tree/master/templates
[source-dir]: https://github.com/alphagov/govuk-content-api-docs/tree/master/source
[reference-page]: https://content-api.publishing.service.gov.uk/reference.html
[tech-docs-template]: https://github.com/alphagov/tech-docs-template
[rvm]: https://www.ruby-lang.org/en/documentation/installation/#managers
[bundler]: http://bundler.io/
