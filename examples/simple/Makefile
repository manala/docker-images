.SILENT:
.PHONY: lint fix

DOCKER = docker run --rm --interactive --volume `pwd`:`pwd` --workdir `pwd`

##############
# Lint / Fix #
##############

APP_SRC_PHP = .

lint:
	-${MAKE} lint-php

lint-php:
ifdef APP_SRC_PHP
	$(info Lint Php)
	${DOCKER} manala/lint-php php-cs-fixer --ansi --dry-run --diff --verbose fix ${APP_SRC_PHP}
else
	$(info Lint Php (Skipping…))
endif

lint-php@test:
	mkdir -p build/lint
	${DOCKER} manala/lint-php php-cs-fixer --dry-run --diff --verbose --format=junit fix ${APP_SRC_PHP} > build/lint/php-cs-fixer.xml

fix:
	-${MAKE} fix-php

fix-php:
ifdef APP_SRC_PHP
	$(info Fix Php…)
	${DOCKER} manala/lint-php php-cs-fixer --ansi fix ${APP_SRC_PHP}
else
	$(info Fix Php (Skipping…))
endif
