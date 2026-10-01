VERSION := 1.1
TARGET := $(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
BUILD_DIR ?= build

.PHONY: all

.INTERMEDIATE: icon-scaled.pdf

all: $(TARGET)

$(TARGET)-orig.pdf:
	ddjvu -format=pdf -page=325-339 \
		житiя-святыхъ-томъ-01__мѣсяцъ-сентябрь__свт-димитрій-ростовскій.djvu \
		$@

icon-scaled.pdf: icon-outline.jpg
	pdfjam --scale 0.7 $< --outfile $@

$(TARGET): %: %-orig.pdf icon-scaled.pdf
	@mkdir -p $(BUILD_DIR)
	pdfjam --landscape --a4paper --delta "1.5cm 0cm" --booklet true $^ \
		--outfile $(BUILD_DIR)/$@-$(VERSION).pdf
