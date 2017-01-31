.SILENT:
.PHONY: lint

DOCKER = docker run --rm --tty --interactive --volume `pwd`:`pwd` --workdir `pwd`

##############
# Lint / Fix #
##############

APP_SRC_JS = example.js

lint:
	-${MAKE} lint-js

lint-js:
ifdef APP_SRC_JS
	$(info Lint Js)
	${DOCKER} manala/lint-js eslint --cache ${APP_SRC_JS}
else
	$(info Lint Js (Skipping…))
endif

lint-js@test:
	${DOCKER} manala/lint-js eslint --format junit --output-file build/lint/eslint.xml --cache ${APP_SRC_JS}

fix:
	-${MAKE} fix-js

fix-js:
ifdef APP_SRC_JS
	$(info Fix Js…)
	${DOCKER} manala/lint-js eslint --fix ${APP_SRC_JS}
else
	$(info Fix Js (Skipping…))
endif
