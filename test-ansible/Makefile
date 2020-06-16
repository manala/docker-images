.SILENT:
.PHONY: help dev build test

## Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m
COLOR_ERROR   = \033[31m

# Docker
DOCKER_IMAGE = manala/test-ansible
DOCKER_TAG  ?= edge

# Distributions
DISTRIBUTIONS ?= debian.jessie debian.stretch debian.buster

DISTRIBUTION_FAMILY  = $(firstword $(subst ., ,$(DISTRIBUTION)))
DISTRIBUTION_RELEASE = $(lastword $(subst ., ,$(DISTRIBUTION)))

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
		--env DISTRIBUTION=${DISTRIBUTION} \
		--env DISTRIBUTION_FAMILY=${DISTRIBUTION_FAMILY} \
		--env DISTRIBUTION_RELEASE=${DISTRIBUTION_RELEASE} \
		${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG}-)${DISTRIBUTION}

## Dev - Debian Jessie
dev@debian.jessie: DISTRIBUTION = debian.jessie
dev@debian.jessie: dev

## Dev - Debian Stretch
dev@debian.stretch: DISTRIBUTION = debian.stretch
dev@debian.stretch: dev

## Dev - Debian Buster
dev@debian.buster: DISTRIBUTION = debian.buster
dev@debian.buster: dev

#########
# Build #
#########

## Build
build:
	EXIT=0 ; ${foreach \
		DISTRIBUTION,\
		${DISTRIBUTIONS},\
		printf "\n${COLOR_INFO}Build ${COLOR_COMMENT}${DISTRIBUTION}${COLOR_RESET}\n\n" && \
			docker build \
				--pull \
				--tag ${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG}-)${DISTRIBUTION} \
				--file Dockerfile.${DISTRIBUTION} \
				. \
		|| EXIT=$$? ;\
	} exit $$EXIT

## Build - Debian Jessie
build@debian.jessie: DISTRIBUTIONS = debian.jessie
build@debian.jessie: build

## Build - Debian Stretch
build@debian.stretch: DISTRIBUTIONS = debian.stretch
build@debian.stretch: build

## Build - Debian Buster
build@debian.buster: DISTRIBUTIONS = debian.buster
build@debian.buster: build

#########
# Test #
#########

## Test
test:
	EXIT=0 ; ${foreach \
		DISTRIBUTION,\
		${DISTRIBUTIONS},\
		printf "\n${COLOR_INFO}Test ${COLOR_COMMENT}${DISTRIBUTION}${COLOR_RESET}\n\n" && \
			docker run \
				--rm \
				--volume `pwd`:/srv \
				--tty \
				--env DISTRIBUTION=${DISTRIBUTION} \
				--env DISTRIBUTION_FAMILY=${DISTRIBUTION_FAMILY} \
				--env DISTRIBUTION_RELEASE=${DISTRIBUTION_RELEASE} \
				${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG}-)${DISTRIBUTION} \
				goss --gossfile /srv/goss.yaml validate \
		|| EXIT=$$? ;\
	} exit $$EXIT

## Test - Debian Jessie
test@debian.jessie: DISTRIBUTIONS = debian.jessie
test@debian.jessie: test

## Test - Debian Stretch
test@debian.stretch: DISTRIBUTIONS = debian.stretch
test@debian.stretch: test

## Test - Debian Buster
test@debian.buster: DISTRIBUTIONS = debian.buster
test@debian.buster: test
