ruby-requirements:
	bundle install

node-requirements:
	npm install

lint-md: node-requirements
	npx markdownlint-cli2 "**/*.{md,md.erb}" "#node_modules"

clean:
	rm -rf build

html: ruby-requirements clean
	bundle exec rake build

server: html
	bundle exec middleman server

publish: ruby-requirements clean
	bundle exec rake publish

all: html

.PHONY: setup ruby-requirements node-requirements lint-md clean html server publish
