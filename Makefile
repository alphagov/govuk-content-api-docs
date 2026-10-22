requirements:
	bundle install
	npm install

lint-md: requirements
	npx markdownlint-cli2 "**/*.{md,md.erb}" "#node_modules"

clean:
	rm -rf build

html: requirements clean
	bundle exec rake build

server: html
	bundle exec middleman server

publish: requirements clean
	bundle exec rake publish

all: html

.PHONY: setup requirements clean html server publish
