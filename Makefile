.PHONY: clean

all: build

build:
	docker build . -t edwinlll/sentinel:1.7.0 --build-arg sentinel_version=1.7.0 --no-cache

push: build
	docker push edwinlll/sentinel:1.7.0
	docker tag edwinlll/sentinel:1.7.0 edwinlll/sentinel:latest
	docker push edwinlll/sentinel:latest
