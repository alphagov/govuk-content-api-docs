#!/usr/bin/env node

var fs = require('fs');
var yaml = require('js-yaml');
var converter = require('widdershins');

var input_file = fs.readFileSync(process.argv[2], 'utf8');
var api = yaml.safeLoad(input_file, { json: true });

var options = {
  codeSamples: true,
  language_tabs: [
    { 'http': 'HTTP' }, { 'python': 'Python' }, { 'ruby': 'Ruby' }
  ],
  user_templates: 'templates',
  sample: true,
}

converter.convert(api, options, function(err, output) {
	fs.writeFileSync(process.argv[3], output, 'utf8');
});
