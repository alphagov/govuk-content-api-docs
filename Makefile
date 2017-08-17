requirements:
	npm install
	bundle install

clean:
	rm -rf build

api:
	$(if ${API_SPEC},,$(error Must specify path to the OpenAPI spec file in API_SPEC))
	./node_modules/widdershins/widdershins.js -r -c -u templates/ -y ${API_SPEC} -o source/reference.html.md.erb

html: requirements clean api
	bundle exec rake build

server: html
	bundle exec middleman server

publish: requirements clean api
	bundle exec rake publish

all: html

.PHONY: setup requirements clean api html server publish
