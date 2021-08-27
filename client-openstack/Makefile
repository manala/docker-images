.SILENT:
.PHONY: dev build tag test

include Makefile.mk

# Docker
DOCKER_IMAGE = manala/client-openstack
DOCKER_TAG  ?= edge
VERSION		 = 0.3.4

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
		--tag ${DOCKER_IMAGE} \
		.

#######
# Tag #
#######

## Tag image (VERSION)
tag:
	$(call message, Tag image ${COLOR_COMMENT}${DOCKER_IMAGE}:${VERSION})
	docker tag \
		${DOCKER_IMAGE} \
		${DOCKER_IMAGE}:${VERSION}
	$(call message, Tag image ${COLOR_COMMENT}${DOCKER_IMAGE}:$(call semver_major_minor,${VERSION}))
	docker tag \
		${DOCKER_IMAGE} \
		${DOCKER_IMAGE}:$(call semver_major_minor,${VERSION})
	$(call message, Tag image ${COLOR_COMMENT}${DOCKER_IMAGE}:$(call semver_major,${VERSION}))
	docker tag \
		${DOCKER_IMAGE} \
		${DOCKER_IMAGE}:$(call semver_major,${VERSION})
	$(call message, Tag image ${COLOR_COMMENT}${DOCKER_IMAGE}:${DOCKER_TAG})
	docker tag \
		${DOCKER_IMAGE} \
		${DOCKER_IMAGE}:${DOCKER_TAG}
	$(call message, Tag image ${COLOR_COMMENT}${DOCKER_IMAGE}:latest)
	docker tag \
		${DOCKER_IMAGE} \
		${DOCKER_IMAGE}:${DOCKER_TAG}

########
# Push #
########

## Publish ansible image(s)
push:
	$(call confirm, Confirm pushing of image $(COLOR_COMMENT)${DOCKER_IMAGE}:${VERSION})
	docker push \
		${DOCKER_IMAGE}:${VERSION}
	docker push \
		${DOCKER_IMAGE}:$(call semver_major_minor,${VERSION})
	docker push \
		${DOCKER_IMAGE}:$(call semver_major,${VERSION})
	docker push \
		${DOCKER_IMAGE}:${DOCKER_TAG}
	docker push \
		${DOCKER_IMAGE}:latest

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
