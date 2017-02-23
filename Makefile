.SILENT:
.PHONY: help build test split

# Docker
DOCKER_IMAGES = ${wildcard */}

# Help
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

#########
# Build #
#########

## Build
build:
	EXIT=0 ; ${foreach \
		image,\
		${DOCKER_IMAGES},\
		${MAKE} --directory=${image} build || EXIT=$$? ;\
	} exit $$EXIT

#########
# Test #
#########

## Test
test:
	EXIT=0 ; ${foreach \
		image,\
		${DOCKER_IMAGES},\
		${MAKE} --directory=${image} test || EXIT=$$? ;\
	} exit $$EXIT

#########
# Split #
#########

## Split
split:
	docker run \
		--rm \
		--tty --interactive \
		--volume ${PWD}:/srv \
		--volume ${HOME}/.ssh:/root/.ssh \
		jderusse/gitsplit
