VERSION := 1.2
TARGET := $(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
BUILD_DIR ?= build

.PHONY: all

.INTERMEDIATE: cross-scaled.pdf icon-scaled.pdf

all: $(TARGET)

$(TARGET)-orig.pdf:
	ddjvu -format=pdf -page=293,288-292,295-298 \
		житiя-святыхъ-томъ-01__мѣсяцъ-сентябрь__свт-димитрій-ростовскій.djvu $@

cross-scaled.pdf: ../cross.pdf
	pdfjam --scale 0.3 $< --outfile $@

icon-scaled.pdf: icon-thin.jpg
	pdfjam --scale 0.7 $< --outfile $@

$(TARGET): %: %-orig.pdf icon-scaled.pdf cross-scaled.pdf
	@mkdir -p $(BUILD_DIR)
	pdfjam --landscape --booklet true $^ \
		--outfile $(BUILD_DIR)/$@-$(VERSION).pdf
