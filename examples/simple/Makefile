.SILENT:
.PHONY: lint

DOCKER = docker run --rm --tty --interactive --volume `pwd`:`pwd` --workdir `pwd`

lint:
	${DOCKER} manala/lint-php php-cs-fixer --dry-run --diff --verbose fix example.php

lint@test:
	mkdir -p build/lint
	${DOCKER} manala/lint-php php-cs-fixer --dry-run --diff --verbose --format=junit fix example.php > build/lint/php-cs-fixer.xml

lint-fix:
	${DOCKER} manala/lint-php php-cs-fixer fix example.php
