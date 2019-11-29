.SILENT:
.PHONY: help run sh build test

## Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m
COLOR_ERROR   = \033[31m

# Docker
DOCKER_IMAGE = debian-test
DOCKER_TAG  ?= edge

# Releases
RELEASES ?= jessie stretch buster

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
			printf " ${COLOR_INFO}%-20s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' ${MAKEFILE_LIST}

#######
# Run #
#######

## Run
run:
	docker run \
		--rm \
		--tty --interactive \
		--privileged \
		--volume `pwd`:/srv \
		--volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
		--env RELEASE=${RELEASE} \
		--name ${DOCKER_IMAGE}.$(if ${DOCKER_TAG},${DOCKER_TAG}-)${RELEASE} \
		manala/${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG}-)${RELEASE}

## Run - Jessie
run.jessie: RELEASE = jessie
run.jessie: run

## Run - Stretch
run.stretch: RELEASE = stretch
run.stretch: run

## Run - Buster
run.buster: RELEASE = buster
run.buster: run

######
# Sh #
######

## Sh
sh:
	docker exec \
		--tty --interactive \
		${DOCKER_IMAGE}.$(if ${DOCKER_TAG},${DOCKER_TAG}-)${RELEASE} \
		bash

## Sh - Jessie
sh.jessie: RELEASE = jessie
sh.jessie: sh

## Sh - Stretch
sh.stretch: RELEASE = stretch
sh.stretch: sh

## Sh - Buster
sh.buster: RELEASE = buster
sh.buster: sh

#########
# Build #
#########

## Build
build:
	EXIT=0 ; ${foreach \
		RELEASE,\
		${RELEASES},\
		printf "\n${COLOR_INFO}Build ${COLOR_COMMENT}${RELEASE}${COLOR_RESET}\n\n" && \
			docker build \
				--pull \
				--tag manala/${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG}-)${RELEASE} \
				--file Dockerfile.${RELEASE} \
				. \
		|| EXIT=$$? ;\
	} exit $$EXIT

## Build - Jessie
build.jessie: RELEASES = jessie
build.jessie: build

## Build - Stretch
build.stretch: RELEASES = stretch
build.stretch: build

## Build - Buster
build.buster: RELEASES = buster
build.buster: build

#########
# Test #
#########

## Test
test:
	EXIT=0 ; ${foreach \
		RELEASE,\
		${RELEASES},\
		printf "\n${COLOR_INFO}Test ${COLOR_COMMENT}${RELEASE}${COLOR_RESET}\n\n" && \
			docker run \
				--rm \
				--volume `pwd`:/srv \
				--tty \
				--env RELEASE=${RELEASE} \
				manala/${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG}-)${RELEASE} \
				goss --gossfile /srv/goss.yaml validate \
		|| EXIT=$$? ;\
	} exit $$EXIT

## Test - Jessie
test.jessie: RELEASES = jessie
test.jessie: test

## Test - Stretch
test.stretch: RELEASES = stretch
test.stretch: test

## Test - Buster
test.buster: RELEASES = buster
test.buster: test
