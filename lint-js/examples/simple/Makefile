.SILENT:
.PHONY: lint fix

DOCKER = DIR=`pwd`; docker run \
	--rm \
	--interactive --tty \
	--volume $$DIR:$$DIR \
	--workdir $$DIR \
	manala/lint-js

##############
# Lint / Fix #
##############

## Lint
lint: lint-js

## Lint - Js
lint-js:
	-${DOCKER} eslint --cache src

lint-js@test:
	${DOCKER} eslint --format /usr/local/lib/node_modules/eslint-formatter-relative-junit/formatter --output-file build/lint/eslint.xml --cache src

## Fix
fix: fix-js

## Fix - Js
fix-js:
	-${DOCKER} eslint --cache --fix src

