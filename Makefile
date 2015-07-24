RELATIVE_BUILDROOT = ../buildroot
PATH_TO_BUILDROOT := $(abspath $(RELATIVE_BUILDROOT))
BR2_CONFIG = $(CURDIR)/buildroot.config
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=$(CURDIR)/kernel.config
OUTPUT = $(CURDIR)/build

#test-paths:
#	@echo $(value PATH_TO_BUILDROOT)


lastword = $(word $(words $(1)),$(1))
makedir := $(dir $(call lastword,$(MAKEFILE_LIST)))

MAKEARGS := -C $(PATH_TO_BUILDROOT) O=$(OUTPUT) BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE) BR2_CONFIG=$(BR2_CONFIG)
MAKEFLAGS += --no-print-directory

.PHONY: _all $(MAKECMDGOALS)

all	:= $(filter-out Makefile,$(MAKECMDGOALS))

_all:
	umask 0022 && $(MAKE) $(MAKEARGS) $(all)

Makefile:;

$(all): _all
	@:

%/: _all
	@:


