ruby-requirements:
	bundle install

node-requirements:
	npm install

vale-rules:
	vale sync

lint-md: node-requirements
	npx markdownlint-cli2 "**/*.{md,md.erb}" "#node_modules"

lint-prose: vale-rules
	vale source

clean:
	rm -rf build

html: ruby-requirements clean
	bundle exec rake build

server: html
	bundle exec middleman server

publish: ruby-requirements clean
	bundle exec rake publish

all: html

.PHONY: setup ruby-requirements node-requirements vale-rules lint-md lint-prose clean html server publish
