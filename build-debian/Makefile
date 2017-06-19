.SILENT:
.PHONY: help dev build test

## Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m
COLOR_ERROR   = \033[31m

# Docker
DOCKER_IMAGE = manala/build-debian
DOCKER_TAG  ?= dev

# Debian
DEBIAN_DISTRIBUTION ?= wheezy jessie stretch

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
		${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG}-)$(lastword ${DEBIAN_DISTRIBUTION})

## Dev - Wheezy
dev@wheezy: DEBIAN_DISTRIBUTION = wheezy
dev@wheezy: dev

## Dev - Jessie
dev@jessie: DEBIAN_DISTRIBUTION = jessie
dev@jessie: dev

## Dev - Stretch
dev@stretch: DEBIAN_DISTRIBUTION = stretch
dev@stretch: dev

#########
# Build #
#########

## Build
build:
	EXIT=0 ; ${foreach \
		distribution,\
		${DEBIAN_DISTRIBUTION},\
		printf "\n${COLOR_INFO}Build ${COLOR_COMMENT}${distribution}${COLOR_RESET}\n\n" && \
			docker build \
				--pull \
				--tag ${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG}-)${distribution} \
				--file Dockerfile.${distribution} \
				. \
		|| EXIT=$$? ;\
	} exit $$EXIT

## Build - Wheezy
build@wheezy: DEBIAN_DISTRIBUTION = wheezy
build@wheezy: build

## Build - Jessie
build@jessie: DEBIAN_DISTRIBUTION = jessie
build@jessie: build

## Build - Stretch
build@stretch: DEBIAN_DISTRIBUTION = stretch
build@stretch: build

#########
# Test #
#########

## Test
test:
	EXIT=0 ; ${foreach \
		distribution,\
		${DEBIAN_DISTRIBUTION},\
		printf "\n${COLOR_INFO}Test ${COLOR_COMMENT}${distribution}${COLOR_RESET}\n\n" && \
			docker run \
				--rm \
				--volume `pwd`:/srv \
				${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG}-)${distribution} \
				goss --gossfile /srv/goss.yaml validate \
		|| EXIT=$$? ;\
	} exit $$EXIT

## Test - Wheezy
test@wheezy: DEBIAN_DISTRIBUTION = wheezy
test@wheezy: test

## Test - Jessie
test@jessie: DEBIAN_DISTRIBUTION = jessie
test@jessie: test

## Test - Stretch
test@stretch: DEBIAN_DISTRIBUTION = stretch
test@stretch: test
