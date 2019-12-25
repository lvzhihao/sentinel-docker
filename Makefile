.PHONY: clean
OS := $(shell uname)
VERSION := 1.7.0 

all: build

build:
	docker build . -t edwinlll/sentinel:${VERSION} --build-arg sentinel_version=${VERSION} --no-cache

push: build
	docker push edwinlll/sentinel:${VERSION}
	docker tag edwinlll/sentinel:${VERSION} edwinlll/sentinel:latest
	docker push edwinlll/sentinel:latest
