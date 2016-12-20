#----------------------------#
# Defined individual targets
#----------------------------#
%.pdf: %.md
	pandoc $< \
	    --standalone \
		-t latex \
		--template article.template.tex \
		--latex-engine xelatex \
		-V fontsize=12pt \
		-V papersize=A4 \
		-o $(basename $@).tex
	latexmk -xelatex $(basename $@)

#----------------------------#
# Defined dual targets
#----------------------------#
# Just create basename targets here

basenames := $(basename $(wildcard *.md))

define DUAL
$(1): $(1).pdf
endef

$(foreach i, $(basenames), $(eval $(call DUAL, $(i))))

#----------------------------#
# Defined phony targets
#----------------------------#
markdowns  := $(wildcard *.md)
pdfs  := $(patsubst %.md, %.pdf, $(markdowns))

all: $(pdfs)

texs  := $(patsubst %.md, %.tex, $(markdowns))

# clean up everything except pdfs
clean:
	latexmk -c
	rm -rf $(texs)
	rm -rf *.nav *.snm *.vrb *.bbl *.run.xml *-blx.bib

.DEFAULT_GOAL := all

.PHONY: all clean
