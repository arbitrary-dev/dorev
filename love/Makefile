VERSION := 0.1
TARGET := $(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
BUILD_DIR ?= build


.PHONY: all

.INTERMEDIATE: cross-scaled.pdf


all: $(TARGET)

cross-scaled.pdf: ../cross.pdf
	pdfjam --scale 0.3 $< --outfile $@

%: %.tex cross-scaled.pdf
	@mkdir -p $(BUILD_DIR)
	pdfjam --landscape --a4paper --delta "1.5cm 0cm" --booklet true \
		$^ --outfile $(BUILD_DIR)/$@-$(VERSION).pdf
