##########
# Colors #
##########

COLOR_RESET   := \033[0m
COLOR_ERROR   := \033[31m
COLOR_INFO    := \033[32m
COLOR_WARNING := \033[33m
COLOR_COMMENT := \033[36m

########
# Help #
########

HELP_INDENT ?= 20

HELP = \
	\nUsage: make [$(MANALA_COLOR_INFO)target$(MANALA_COLOR_RESET)]\n \
	$(call help_section,Help) \
	$(call help,help,This help) \
	\n

define help_section
	\n$(COLOR_COMMENT)$(1):$(COLOR_RESET)
endef

define help
  \n  $(COLOR_INFO)$(1)$(COLOR_RESET) $(2)
endef

help:
	@printf "$(HELP)"
	awk '/^[a-zA-Z\-\_0-9\.@%\/]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "\n  $(COLOR_INFO)%-$(HELP_INDENT)s$(COLOR_RESET) %s", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
	@printf "\n\n"

.PHONY: help

######################
# Special Characters #
######################

# Usage:
#   $(call message, Foo$(,) bar) = Foo, bar

, := ,

########
# Time #
########

# Usage:
#   $(call time) = 11:06:20

define time
`date -u +%T`
endef

###########
# Message #
###########

# Usage:
#   $(call message, Foo bar)         = Foo bar
#   $(call message_success, Foo bar) = (っ◕‿◕)っ Foo bar
#   $(call message_warning, Foo bar) = ¯\_(ツ)_/¯ Foo bar
#   $(call message_error, Foo bar)   = (╯°□°)╯︵ ┻━┻ Foo bar

define message
	printf "$(COLOR_INFO)$(strip $(1))$(COLOR_RESET)\n"
endef

define message_success
	printf "$(COLOR_INFO)(っ◕‿◕)っ $(strip $(1))$(COLOR_RESET)\n"
endef

define message_warning
	printf "$(COLOR_WARNING)¯\_(ツ)_/¯ $(strip $(1))$(COLOR_RESET)\n"
endef

define message_error
	printf "$(COLOR_ERROR)(╯°□°)╯︵ ┻━┻ $(strip $(1))$(COLOR_RESET)\n"
endef

#######
# Log #
#######

# Usage:
#   $(call log, Foo bar)         = [11:06:20] [target] Foo bar
#   $(call log_warning, Foo bar) = [11:06:20] [target] ¯\_(ツ)_/¯ Foo bar
#   $(call log_error, Foo bar)   = [11:06:20] [target] (╯°□°)╯︵ ┻━┻ Foo bar

define log
	printf "[$(COLOR_COMMENT)$(call time)$(COLOR_RESET)] [$(COLOR_COMMENT)$(@)$(COLOR_RESET)] " ; $(call message, $(1))
endef

define log_warning
	printf "[$(COLOR_COMMENT)$(call time)$(COLOR_RESET)] [$(COLOR_COMMENT)$(@)$(COLOR_RESET)] "  ; $(call message_warning, $(1))
endef

define log_error
	printf "[$(COLOR_COMMENT)$(call time)$(COLOR_RESET)] [$(COLOR_COMMENT)$(@)$(COLOR_RESET)] " ;  $(call message_error, $(1))
endef

###########
# Confirm #
###########

# Usage:
#   $(call confirm, Foo bar) = ༼ つ ◕_◕ ༽つ Foo bar (y/N):

define confirm
	printf "$(COLOR_INFO) ༼ つ ◕_◕ ༽つ $(COLOR_WARNING)$(strip $(1)) $(COLOR_RESET)$(COLOR_WARNING)(y/N)$(COLOR_RESET): "; \
	read CONFIRM ; if [ "$$CONFIRM" != "y" ]; then printf "\n"; exit 1; fi
endef

########
# List #
########

# Splits a string into a list separated by spaces at the split character in the first argument
# Usage:
#   $(call list_split,:,foo:bar) = foo bar

define list_split
$(strip $(subst $(1), ,$(2)))
endef

# Returns the first element of a list
# Usage:
#   $(call list_first,foo bar) = foo

define list_first
$(firstword $(1))
endef

# Returns the last element of a list
# Usage:
#   $(call list_last,foo bar) = bar

define list_last
$(lastword $(1))
endef

# Returns the list with the first element removed
# Usage:
#   $(call list_rest,foo bar baz) = bar baz

define list_rest
$(wordlist 2,$(words $(1)),$(1))
endef

##########
# Semver #
##########

# Usage:
#   $(call semver_major,3.2.1) = 3

define semver_major
$(call list_first,$(call list_split,.,$(1)))
endef

# Usage:
#   $(call semver_minor,3.2.1) = 2

define semver_minor
$(call list_first,$(call list_rest,$(call list_split,.,$(1))))
endef

# Usage:
#   $(call semver_major_minor,3.2.1) = 3.2

define semver_major_minor
$(call semver_major,$(1)).$(call semver_minor,$(1))
endef

# Usage:
#   $(call semver_patch,3.2.1) = 1

define semver_patch
$(call list_last,$(call list_split,.,$(1)))
endef

########
# Exit #
########

# Usage:
#   $(call exit_if_not, $(FOO), FOO has not been specified) = (╯°□°)╯︵ ┻━┻ FOO has not been specified

define exit_if_not
	$(if $(strip $(1)),, \
		$(call message_error, $(strip $(2))) ; exit 1 \
	)
endef
