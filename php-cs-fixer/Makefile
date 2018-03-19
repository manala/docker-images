.SILENT:
.PHONY: help dev build test

# Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m
COLOR_ERROR   = \033[31m

# Docker
DOCKER_IMAGE = manala/php-cs-fixer
DOCKER_TAG  ?= edge

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

######
# Sh #
######

## Sh
sh:
	docker run \
		--rm \
		--volume `pwd`:/srv \
		--workdir /srv \
		--tty --interactive \
		${DOCKER_IMAGE}:${DOCKER_TAG} \
		sh

#########
# Build #
#########

## Build
build:
	docker build \
		--pull \
		--tag ${DOCKER_IMAGE}:${DOCKER_TAG} \
		.

#########
# Test #
#########

## Test [EDIT=1]
test:
	dgoss $(if $(EDIT),edit,run) \
		--interactive \
		${DOCKER_IMAGE}:${DOCKER_TAG} \
		cat
