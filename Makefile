.SILENT:
.PHONY: help

## Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m
COLOR_ERROR   = \033[31m

## Help
help:
	printf "${COLOR_COMMENT}Usage:${COLOR_RESET}\n"
	printf " make [target]\n\n"
	printf "${COLOR_COMMENT}Available targets:${COLOR_RESET}\n"
	awk '/^[a-zA-Z\-\_0-9\.@]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf " ${COLOR_INFO}%-16s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

#######
# Dev #
#######

## Dev - Wheezy
dev@wheezy:
	docker run \
		--rm \
		--volume `pwd`:/srv \
		--tty --interactive \
		manala/build-debian:wheezy \
		/bin/bash

## Dev - Jessie
dev@jessie:
	docker run \
		--rm \
		--volume `pwd`:/srv \
		--tty --interactive \
		manala/build-debian:jessie \
		/bin/bash

#########
# Build #
#########

## Build
build: build@wheezy build@jessie

## Build - Wheezy
build@wheezy:
	docker build \
		--pull \
		--rm \
		--force-rm \
		--no-cache \
		--tag manala/build-debian:wheezy \
		--file Dockerfile.wheezy \
		.

## Build - Jessie
build@jessie:
	docker build \
		--pull \
		--rm \
		--force-rm \
		--no-cache \
		--tag manala/build-debian:jessie \
		--file Dockerfile.jessie \
		.

########
# Push #
########

## Push
push: push@wheezy push@jessie

## Push - Wheezy
push@wheezy:
	docker push manala/build-debian:wheezy

## Push - Jessie
push@jessie:
	docker push manala/build-debian:jessie
