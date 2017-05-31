.SILENT:
.PHONY: phpmetrics --help

DOCKER = DIR=`pwd`; docker run \
	--rm \
	--tty \
	--volume $$DIR:$$DIR \
	--workdir $$DIR \
	manala/phpmetrics

##############
# Phpmetrics #
##############

## Phpmetrics
phpmetrics:
	-${DOCKER} phpmetrics --report-html=build/myreport src/
