.PHONY: build

##########
# Debian #
##########

DEBIAN_DISTRIBUTIONS = wheezy jessie stretch

%.wheezy: DEBIAN_DISTRIBUTION = wheezy
%.jessie: DEBIAN_DISTRIBUTION = jessie
%.stretch: DEBIAN_DISTRIBUTION = stretch

##########
# Docker #
##########

MANALA_DOCKER_IMAGE     = manala/$(IMAGE)
MANALA_DOCKER_IMAGE_TAG = $(if $(IMAGE_TAG),$(IMAGE_TAG)-)$(DEBIAN_DISTRIBUTION)
MANALA_DOCKER_DIR       = /srv
MANALA_DOCKER_HOST      = $(IMAGE).$(DEBIAN_DISTRIBUTION).test
MANALA_DOCKER_RUN_OPTIONS = \
	--env MANALA_ENV=test \
	--env DEBIAN_DISTRIBUTION=$(DEBIAN_DISTRIBUTION)
MANALA_DOCKER_BUILD_OPTIONS = \
	--pull \
	--file Dockerfile.$(DEBIAN_DISTRIBUTION)

##########
# Manala #
##########

MANALA_DIR = $(abspath $(patsubst %/make/Makefile,%,$(firstword $(filter %manala/make/Makefile,$(MAKEFILE_LIST)))))

include \
	$(MANALA_DIR)/make/Makefile.manala \
	$(MANALA_DIR)/make/Makefile.docker \
	$(MANALA_DIR)/make/Makefile.environment

-include $(MANALA_DIR)/../Makefile.local

###############
# Environment #
###############

ifeq ($(MANALA_ENV),local)

MANALA_HELP += $(call help_section,Environment)

ifneq ($(filter wheezy,$(DEBIAN_DISTRIBUTIONS)),)
MANALA_HELP += $(call help,sh.wheezy,     Shell to environment - Wheezy)
sh.wheezy:
	@$(MANALA_DOCKER_RUN)
endif

ifneq ($(filter jessie,$(DEBIAN_DISTRIBUTIONS)),)
MANALA_HELP += $(call help,sh.jessie,     Shell to environment - Jessie)
sh.jessie:
	@$(MANALA_DOCKER_RUN)
endif

ifneq ($(filter stretch,$(DEBIAN_DISTRIBUTIONS)),)
MANALA_HELP += $(call help,sh.stretch,    Shell to environment - Stretch)
sh.stretch:
	@$(MANALA_DOCKER_RUN)
endif

MANALA_HELP += $(call help,update-all,    Update all environments)

update-all:
	EXIT=0 ; $(foreach \
		DEBIAN_DISTRIBUTION,\
		$(DEBIAN_DISTRIBUTIONS),\
		$(call log,Update $(DEBIAN_DISTRIBUTION)) \
			&& $(MAKE) update.$(DEBIAN_DISTRIBUTION) \
		|| EXIT=$$? ;\
	) exit $$EXIT

ifneq ($(filter wheezy,$(DEBIAN_DISTRIBUTIONS)),)
MANALA_HELP += $(call help,update.wheezy, Update environment - Wheezy)
update.wheezy:
	@$(MANALA_DOCKER_PULL)
endif

ifneq ($(filter jessie,$(DEBIAN_DISTRIBUTIONS)),)
MANALA_HELP += $(call help,update.jessie, Update environment - Jessie)
update.jessie:
	@$(MANALA_DOCKER_PULL)
endif

ifneq ($(filter stretch,$(DEBIAN_DISTRIBUTIONS)),)
MANALA_HELP += $(call help,update.stretch,Update environment - Jessie)
update.stretch:
	@$(MANALA_DOCKER_PULL)
endif

MANALA_HELP += \n

endif

#########
# Proxy #
#########

%@proxy:
	@$(MANALA_DOCKER_RUN) sh -c "make --silent --directory=$(MANALA_DOCKER_DIR) $(*)"

#########
# Image #
#########

MANALA_HELP += $(call help_section,Image)

#################
# Image - Build #
#################

ifeq ($(MANALA_ENV),local)

MANALA_HELP += $(call help,build-all,    Build all images)

build-all:
	EXIT=0 ; $(foreach \
		DEBIAN_DISTRIBUTION,\
		$(DEBIAN_DISTRIBUTIONS),\
		$(call log,Build $(DEBIAN_DISTRIBUTION)) \
			&& $(MAKE) build.$(DEBIAN_DISTRIBUTION) \
		|| EXIT=$$? ;\
	) exit $$EXIT

ifneq ($(filter wheezy,$(DEBIAN_DISTRIBUTIONS)),)
MANALA_HELP += $(call help,build.wheezy, Build image - Wheezy)
build.wheezy:
	@$(MANALA_DOCKER_BUILD) .
endif

ifneq ($(filter jessie,$(DEBIAN_DISTRIBUTIONS)),)
MANALA_HELP += $(call help,build.jessie, Build image - Jessie)
build.jessie:
	@$(MANALA_DOCKER_BUILD) .
endif

ifneq ($(filter stretch,$(DEBIAN_DISTRIBUTIONS)),)
MANALA_HELP += $(call help,build.stretch,Build image - Stretch)
build.stretch:
	@$(MANALA_DOCKER_BUILD) .
endif

endif

################
# Image - Test #
################

ifeq ($(MANALA_ENV),local)

MANALA_HELP += $(call help,test-all,     Test all images)

test-all:
	EXIT=0 ; $(foreach \
		DEBIAN_DISTRIBUTION,\
		$(DEBIAN_DISTRIBUTIONS),\
		$(call log,Test $(DEBIAN_DISTRIBUTION)) \
			&& $(MAKE) test.$(DEBIAN_DISTRIBUTION) \
		|| EXIT=$$? ;\
	) exit $$EXIT

ifneq ($(filter wheezy,$(DEBIAN_DISTRIBUTIONS)),)
MANALA_HELP += $(call help,test.wheezy,  Test image - Wheezy)
test.wheezy: $(call proxy,test)
endif

ifneq ($(filter jessie,$(DEBIAN_DISTRIBUTIONS)),)
MANALA_HELP += $(call help,test.jessie,  Test image - Jessie)
test.jessie: $(call proxy,test)
endif

ifneq ($(filter stretch,$(DEBIAN_DISTRIBUTIONS)),)
MANALA_HELP += $(call help,test.stretch, Test image - Stretch)
test.stretch: $(call proxy,test)
endif

endif

ifeq ($(MANALA_ENV),test)

MANALA_HELP += $(call help,test,Test image)
test: $(call proxy,test)

endif

test@test:
	@goss --gossfile $(MANALA_DOCKER_DIR)/tests/goss.yaml validate
