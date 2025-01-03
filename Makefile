requirements:
	bundle install

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
