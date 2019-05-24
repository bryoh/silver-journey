.PHONY: all build push deploy run stop

all: build push deploy

build:
	docker build -t bryo/silver-journey -f Dockerfile.local .

push:
	docker push bryo/silver-journey:latest

deploy:
	eb deploy

run:
	docker-compose up -d

stop:
	docker-compose down
