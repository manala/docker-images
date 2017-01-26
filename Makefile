.SILENT:
.PHONY: help dev build

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

## Dev
dev:
	docker run \
		--rm \
		--volume `pwd`:/srv \
		--tty --interactive \
		manala/lint-js \
		/bin/sh

#########
# Build #
#########

## Build
build:
	docker build \
		--pull \
		--rm \
		--force-rm \
		--no-cache \
		--tag manala/lint-js \
		.

#########
# Test #
#########

## Test
test:
	docker run \
		--rm \
		--volume `pwd`:/srv \
		manala/lint-js \
		goss --gossfile /srv/goss.yaml validate
