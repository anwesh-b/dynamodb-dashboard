YARN=yarn
NODE=node

all: install clean
	cd ./app && $(YARN) build-only
	cd ./server && $(YARN) build
	cp -r ./app/dist ./server/build/public

install:
	cd ./app && $(YARN)
	cd ./server && $(YARN)

clean:
	rm -rf ./app/dist
	rm -rf ./server/build

start: all
	$(NODE) ./server/build/bin/cli.js start -o