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
changes on a branch in this project and then opening a pull request.

### Metadata

Markdown files may have frontmatter (metadata) added in a [standard format][front-matter]
at the top of the file.

Mandatory and optional [frontmatter fields][front-matter-template] are specified
from the [template][tech-docs-template]. In our documentation, we use the following
as a minimum:

- `title`
- `description`
- `weight`

In addition, the following frontmatter/metadata about the content itself has been
added to each file:

- `type`
- `audience`
- `product`

These fields and their purpose are described in the [analysis and planning][analysis-and-planning]
document, and as a minimum act as a reminder for anyone making future updates to
the file.

The content metadata may also be useful for future improvements to search (faceted
search), navigation, or page templates and layouts.

### Linting markdown

After updating content locally, you can run a linter on the Markdown files (with
both the `.md` and `.md.erb` file extensions):

```shell
make lint-md
```

This checks your Markdown against standards and best practices, and flags any
discrepancies.

## Running documentation locally

To run the documentation locally you should have this repository checked out
as well as the [Content Store][content-store].

### Installing dependencies

Setting up the documentation requires Ruby. Run the following to install the
necessary dependencies:

```shell
make ruby-requirements
```

Linting the documentation requires Node. Run the following to install the node
package and dependencies:

```shell
make node-requirements
```

### Preview changes

Whilst writing documentation you can run a middleman server to preview how the
published docs will look in the browser. When you save a change, the preview in
the browser will automatically refresh the HTML pages. However, for changes to
the [openapi.yaml][content-store-openapi] file, you will need to restart the preview.

This preview is only available on your own computer. Others won't be able to
access it if they are given the link.

Run the following command to start the middleman server:

```shell
make server
```

You should now be able to access the preview at [http://localhost:4567](http://localhost:4567).

## Publishing changes

Changes are deployed automatically after merging into the `main` branch.

To manually deploy a change, run the following command on your local machine:

```shell
make publish
```

This will push your change to the `gh-pages` branch and deploy to GitHub Pages.

## License

[MIT License](LICENCE)

[content-store-openapi]: https://github.com/alphagov/content-store/blob/main/openapi.yaml
[content-store]: https://github.com/alphagov/content-store
[OpenAPI]: https://github.com/OAI/OpenAPI-Specification
[reference-page]: https://content-api.publishing.service.gov.uk/reference.html
[source-dir]: https://github.com/alphagov/govuk-content-api-docs/tree/main/source
[tech-docs-template]: https://github.com/alphagov/tech-docs-template
[front-matter-template]: https://alphagov.github.io/tech-docs-gem/configure_project/frontmatter/index.html
[front-matter]: https://middlemanapp.com/basics/frontmatter/
[analysis-and-planning]: https://beisgov.sharepoint.com/:x:/r/sites/GOVUK-Pub/Shared%20Documents/Content%20APIs/Technical%20documentation/Technical%20documentation%20analysis%20and%20planning.xlsx?d=wed7ce3e4ef294e9c8a77c3183c640783&csf=1&web=1&e=RjQISn&nav=MTVfezE2OERFRTY2LTIzNzgtNEQ4MC05M0ZBLUM0MDZBNzU3MUQ5NX0
