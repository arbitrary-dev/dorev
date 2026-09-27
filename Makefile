SUBDIRS := $(patsubst %/,%,$(dir $(wildcard */Makefile)))
BUILD_DIR := $(abspath build)

.PHONY: all $(SUBDIRS)

all: $(SUBDIRS)

$(SUBDIRS):
	@mkdir -p $(BUILD_DIR)
	$(MAKE) -C $@ BUILD_DIR=$(BUILD_DIR)
