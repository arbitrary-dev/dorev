VERSION := 1.0
TARGET := $(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
BUILD_DIR ?= build

.PHONY: all

.INTERMEDIATE: back-cross-scaled.pdf

all: $(TARGET)

$(TARGET)-orig.pdf:
	ddjvu -format=pdf -page=293,288-292,295-298 \
		житiя-святыхъ-томъ-01__мѣсяцъ-сентябрь__свт-димитрій-ростовскій.djvu $@

back-cross-scaled.pdf: ../back-cross.pdf
	pdfjam --scale 0.3 $< --outfile $@

$(TARGET): %: %-orig.pdf back-cross-scaled.pdf
	@mkdir -p $(BUILD_DIR)
	pdfjam --landscape --booklet true \
		$< - \
		$(word 2, $^) {},1 \
		--outfile $(BUILD_DIR)/$@-$(VERSION).pdf
