worktree:
	git worktree add build gh-pages

requirements:
	npm install
	bundle install

clean:
	rm -rf build
	git worktree prune

api:
	$(if ${API_SPEC},,$(error Must specify path to the OpenAPI spec file in API_SPEC))
	./node_modules/widdershins/widdershins.js -r -c -u templates/ -y ${API_SPEC} -o source/documentation/index.html.erb

html: requirements clean worktree api
	bundle exec middleman build --verbose

server: requirements api
	bundle exec middleman server

publish: html
	$(eval export LATEST_TAG=$(shell git describe --always))
	cd build && git add . && git commit --allow-empty -m "Publish documentation from ${LATEST_TAG}"
	cd build && git push origin gh-pages

all: html

.PHONY: setup requirements clean api html server publish
