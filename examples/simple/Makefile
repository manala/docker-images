.SILENT:
.PHONY: lint fix

DOCKER = docker run \
	--rm \
	--interactive \
	--volume `pwd`:`pwd` \
	--workdir `pwd` \
	manala/lint-php

##############
# Lint / Fix #
##############

# Lint
lint: lint-php

## Lint - Php
lint-php:
	-${DOCKER} php-cs-fixer --dry-run --ansi --diff --verbose fix

lint-php@test:
	mkdir -p build/lint
	${DOCKER} php-cs-fixer --dry-run --ansi --diff --verbose --format=junit fix > build/lint/php-cs-fixer.xml

## Fix
fix: fix-php

## Fix - Php
fix-php:
	-${DOCKER} php-cs-fixer --ansi fix
