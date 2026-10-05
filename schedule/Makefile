TARGET  := $(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
TARGETS := ilukste-2026-10 pokrov-2026-10
TARGETSS := $(patsubst %.tex,%,$(wildcard *.tex))

BUILD_DIR ?= build

.PHONY: all

$(TARGET): all
all: $(TARGETS)

.SECONDEXPANSION:

$(TARGETSS): $$(filter $$@-%,$$(TARGETS))

$(TARGETS): $$(firstword $$(subst -, ,$$@)).tex
	@mkdir -p $(BUILD_DIR) \
	&& lualatex -output-directory=$(BUILD_DIR) -jobname=$(TARGET)-$@ $< \
	&& rm -f $(BUILD_DIR)/$(TARGET)-$@.{aux,log,out}
