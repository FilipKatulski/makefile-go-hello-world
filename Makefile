DOCKER_USERNAME ?= fkatulsk
GITHUB_USERNAME ?= filipkatulski
APPLICATION_NAME ?= makefile-tutor-go-hello-world
GIT_HASH ?= $(shell git log --format="%h" -n 1)

all: build push

build: build-dockerhub build-github

build-dockerhub:
	docker build --tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH} .

build-github:
	docker build --tag ghcr.io/${GITHUB_USERNAME}/${APPLICATION_NAME}:${GIT_HASH} . 

push: push-dockerhub push-github

push-dockerhub:
	docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH}

push-github:
	docker push ghcr.io/${GITHUB_USERNAME}/${APPLICATION_NAME}:${GIT_HASH} 
