DOCKER_USERNAME ?= fkatulsk
APPLICATION_NAME ?= makefile-tutor-go-hello-world
GIT_HASH ?= $(shell git log --format="%h" -n 1)

all: build push

build:
	docker build --tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH} .
 
push:
	docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH}

