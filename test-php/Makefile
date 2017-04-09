.SILENT:
.PHONY: help dev build test

# Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m
COLOR_ERROR   = \033[31m

# Docker
DOCKER_IMAGE = manala/test-php
DOCKER_TAG  ?= dev

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
	{ lastLine = $$0 }' ${MAKEFILE_LIST}

#######
# Dev #
#######

## Dev
dev:
	docker run \
		--rm \
		--volume `pwd`:/srv \
		--tty --interactive \
		--env USER_ID=`id -u` \
		--env GROUP_ID=`id -g` \
		${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG},latest)

#########
# Build #
#########

## Build
build:
	docker build \
		--pull \
		--tag ${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG},latest) \
		.

#########
# Test #
#########

## Test
test:
	docker run \
		--rm \
		--volume `pwd`:/srv \
		${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG},latest) \
		goss --gossfile /srv/goss.yaml validate
