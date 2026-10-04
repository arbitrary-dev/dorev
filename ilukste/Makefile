VERSION := 2026-10
TARGET := $(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
BUILD_DIR ?= build

.PHONY: all

all: $(TARGET)

$(TARGET): %: %.tex
	@mkdir -p $(BUILD_DIR) \
	&& lualatex -output-directory=$(BUILD_DIR) -jobname=$@-$(VERSION) $< \
	&& rm -f $(BUILD_DIR)/$@-$(VERSION).{aux,log,out}
