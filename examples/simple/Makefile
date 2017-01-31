.SILENT:
.PHONY: lint fix

DOCKER = docker run --rm --interactive --volume `pwd`:`pwd` --workdir `pwd`

##############
# Lint / Fix #
##############

APP_SRC_CSS = example.css

lint:
	-${MAKE} lint-css

lint-css:
ifdef APP_SRC_CSS
	$(info Lint Css)
	${DOCKER} manala/lint-css stylelint --color ${APP_SRC_CSS}
else
	$(info Lint Css (Skipping…))
endif

lint-js@test:
	mkdir -p build/lint
	${DOCKER} manala/lint-css stylelint --custom-formatter /usr/local/lib/node_modules/stylelint-junit-formatter/index.js ${APP_SRC_CSS} > build/lint/stylelint.xml

fix:
	-${MAKE} fix-css

fix-css:
ifdef APP_SRC_CSS
	$(info Fix Css…)
	${DOCKER} manala/lint-css stylefmt ${APP_SRC_CSS}
else
	$(info Fix Css (Skipping…))
endif
