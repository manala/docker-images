.SILENT:
.PHONY: build run test

# Docker
DOCKER_IMAGE = ansible
DOCKER_TAG  ?= edge

#########
# Build #
#########

## Build
build:
	docker build \
		--pull \
		--tag manala/${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG}) \
		.

#######
# Run #
#######

## Run
run:
	docker run \
		--rm \
		--tty --interactive \
		--name ${DOCKER_IMAGE}.$(if ${DOCKER_TAG},${DOCKER_TAG}) \
		manala/${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG})

########
# Test #
########

## Test
test:
	docker run \
		--rm \
		--volume $(PWD):/srv \
		manala/${DOCKER_IMAGE}:$(if ${DOCKER_TAG},${DOCKER_TAG}) \
		goss --gossfile /srv/goss.yaml validate
