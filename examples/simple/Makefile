.SILENT:
.PHONY: lint

DOCKER = docker run --rm --tty --interactive --volume `pwd`:`pwd` --workdir `pwd`

lint:
	${DOCKER} manala/lint-js eslint --cache example.js

lint@test:
	${DOCKER} manala/lint-js eslint --format junit --output-file build/lint/eslint.xml --cache example.js
