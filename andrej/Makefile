VERSION := 1.0
TARGET := $(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
BUILD_DIR ?= build


.PHONY: all

.INTERMEDIATE: $(TARGET)-crop.pdf cross-scaled.pdf


all: $(TARGET)

$(TARGET)-orig.pdf:
	ddjvu -format=pdf -page=35,50-72 \
		житiя-святыхъ-томъ-02__мѣсяцъ-октябрь__свт-димитрій-ростовскій.djvu \
		$@

$(TARGET)-crop.pdf: $(TARGET)-orig.pdf
	./crop-n-merge.py $< $@

cross-scaled.pdf: ../cross.pdf
	pdfjam --scale 0.3 $< --outfile $@

$(TARGET): %: %-crop.pdf cross-scaled.pdf
	@mkdir -p $(BUILD_DIR)
	pdfjam --landscape --a4paper --delta "1.5cm 0cm" --booklet true \
		$^ --outfile $(BUILD_DIR)/$@-$(VERSION).pdf
