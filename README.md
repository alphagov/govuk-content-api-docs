# GOV.UK Content API Documentation

## Getting started

Setting up the documentation requires Ruby and Node. Run the following to
install the necessary dependencies:

```
make requirements
```

## Build

Type the following to build the HTML:

```
make html API_SPEC=<path/to/openapi.yaml>
```

This will create a `build` subfolder in the application folder which contains
the HTML and asset files ready to be published.

## Preview

Whilst writing documentation we can run a middleman server to preview how the
published version will look in the browser. After saving a change the preview in
the browser will automatically refresh.

The preview is only available on our own computer. Others won't be able to
access it if they are given the link.

Type the following to start the server:

```
make server API_SPEC=<path/to/openapi.yaml>
```

You should now be able to view a live preview at http://localhost:4567.

## Publish

To publish the latest documentation run the following:

```
make publish API_SPEC=<path/to/openapi.yaml>
```

This will push to the `gh-pages` branch and therefore deploy to GitHub Pages.

[rvm]: https://www.ruby-lang.org/en/documentation/installation/#managers
[bundler]: http://bundler.io/
