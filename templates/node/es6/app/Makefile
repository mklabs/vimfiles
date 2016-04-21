test:
	mocha test/

babel:
	babel lib/ -d src/

lint:
	eslint .
	jscs .

watch:
	watchd lib/**/* test/**/* bin/* -c 'bake'

all: watch
