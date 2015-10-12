BIN_PATH := ./node/bin:./node_modules/bower/bin:./node_modules/ember-cli/bin:${PATH}

node:
	curl --silent 'https://nodejs.org/dist/v0.12.7/node-v0.12.7-darwin-x64.tar.gz' | tar xz
	mv node-v0.12.7-darwin-x64 node

node_modules: node
	PATH=${BIN_PATH} npm install

bower_components: node_modules
	PATH=${BIN_PATH} bower install

run: bower_components
	PATH=${BIN_PATH} ember server

test: bower_components
	PATH=${BIN_PATH} ember test

test-in-browser: bower_components
	PATH=${BIN_PATH} ember test --launch=safari,firefox
