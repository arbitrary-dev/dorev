VERSION := 1.1
TARGET := $(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
BUILD_DIR ?= build

.PHONY: all

.INTERMEDIATE: back-cross-scaled.pdf icon-scaled.pdf

all: $(TARGET)

$(TARGET)-orig.pdf:
	ddjvu -format=pdf -page=293,288-292,295-298 \
		житiя-святыхъ-томъ-01__мѣсяцъ-сентябрь__свт-димитрій-ростовскій.djvu $@

back-cross-scaled.pdf: ../back-cross.pdf
	pdfjam --scale 0.3 $< --outfile $@

icon-scaled.pdf: icon-thin.jpg
	pdfjam --scale 0.7 $< --outfile $@

$(TARGET): %: %-orig.pdf icon-scaled.pdf back-cross-scaled.pdf
	@mkdir -p $(BUILD_DIR)
	pdfjam --landscape --booklet true $^ \
		--outfile $(BUILD_DIR)/$@-$(VERSION).pdf
