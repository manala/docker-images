.SILENT:
.PHONY: trans-pull

DOCKER = DIR=`pwd`; docker run \
	--rm \
	--interactive \
	--volume $$DIR:$$DIR \
	--workdir $$DIR \
	manala/openl10n-cli

########
# Push #
########

trans-push: trans-openl10n-push

trans-openl10n-push:
    -${DOCKER} openl10n push --locale=all

########
# Pull #
########

trans-pull: trans-openl10n-pull

trans-openl10n-pull:
    -${DOCKER} openl10n pull --locale=all
