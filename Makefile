SUBDIRS := $(patsubst %/,%,$(dir $(wildcard */Makefile)))
SUBDIRS += $(basename $(wildcard */*.tex))

BUILD_DIR := $(abspath build)

.PHONY: all $(SUBDIRS)

all: $(SUBDIRS)

$(SUBDIRS):
	@mkdir -p $(BUILD_DIR)
	@if [ -f "$@.tex" ]; then \
		$(MAKE) $(word 2,$(subst /, ,$@)) -C $(dir $@) BUILD_DIR=$(BUILD_DIR); \
	else \
		$(MAKE) -C $@ BUILD_DIR=$(BUILD_DIR); \
	fi
