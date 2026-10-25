VERSION := 1.0
TARGET := $(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
BUILD_DIR ?= build


.PHONY: all

.INTERMEDIATE: first-page.pdf second-page.pdf last-page.pdf \
	$(TARGET)-crop.pdf


all: $(TARGET)

$(TARGET)-orig.pdf:
	ddjvu -format=pdf -page=240,241,243,245,248-257,259,277 \
		житiя-святыхъ-томъ-02__мѣсяцъ-октябрь__свт-димитрій-ростовскій.djvu \
		$@

first-page.pdf: images/collage_grok.png
	pdfjam $< --outfile $@

second-page.pdf: $(TARGET)-orig.pdf
	./compile-second-page.py $< $@

$(TARGET)-crop.pdf: $(TARGET)-orig.pdf
	pdfjam $< 6-14 --outfile $@

last-page.pdf: ../cross.pdf
	pdfjam --scale 0.3 $< --outfile $@ \
		--latex /usr/bin/lualatex \
		--preamble "\usepackage{fontspec}\setmainfont{Old Standard}" \
		--picturecommand "\put(298,64){\makebox(0,0)[b]{\Large \
			Господи Іисусе Христе, Сыне Божiй, помилуй мя, грѣшнаго.}}"

$(TARGET): %: first-page.pdf second-page.pdf $(TARGET)-crop.pdf last-page.pdf
	@mkdir -p $(BUILD_DIR)
	pdfjam --landscape --a4paper --delta "1.5cm 0cm" --booklet true \
		$^ --outfile $(BUILD_DIR)/$@-$(VERSION).pdf
