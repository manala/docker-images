.SILENT:
.PHONY: lint fix

DOCKER = DIR=`pwd`; docker run \
	--rm \
	--interactive \
	--volume $$DIR:$$DIR \
	--workdir $$DIR \
	manala/lint-php

##############
# Lint / Fix #
##############

## Lint
lint: lint-php

## Lint - Php
lint-php:
	-${DOCKER} php-cs-fixer --dry-run --ansi --diff --verbose --no-interaction fix

lint-php@test:
	mkdir -p build/lint
	${DOCKER} php-cs-fixer --dry-run --ansi --diff --verbose --no-interaction --format=junit fix > build/lint/php-cs-fixer.xml

## Fix
fix: fix-php

## Fix - Php
fix-php:
	-${DOCKER} php-cs-fixer --ansi --no-interaction fix
