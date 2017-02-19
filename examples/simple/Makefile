.SILENT:
.PHONY: lint fix

DOCKER = DIR=`pwd`; docker run \
	--rm \
	--interactive --tty \
	--volume $$DIR:$$DIR \
	--workdir $$DIR \
	manala/lint-css

##############
# Lint / Fix #
##############

## Lint
lint: lint-css

## Lint - Css
lint-css:
	-${DOCKER} stylelint src/**/*

lint-css@test:
	mkdir -p build/lint
	${DOCKER} stylelint --custom-formatter /usr/local/lib/node_modules/stylelint-junit-formatter/index src/**/* > build/lint/stylelint.xml

## Fix
fix: fix-css

## Fix - Css
fix-css:
	-${DOCKER} stylefmt --recursive src/**/*
