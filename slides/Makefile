#----------------------------#
# Defined individual targets
#----------------------------#
%.notes.pdf: %.md
	pandoc $< \
		-t beamer \
		--template ../common/beamer.template.tex \
		--latex-engine xelatex \
		--slide-level 2 \
		-V beamer-notes=true \
		-V fontsize=12pt \
		-o $(basename $@).tex
	latexmk -xelatex $(basename $@)
	pdfjam $@ \
		--no-landscape \
		--frame true \
		--nup 2x4 \
		--a4paper \
		--scale 0.95 \
		--suffix nup
	mv $*.notes-nup.pdf $@

%.slides.pdf: %.md
	pandoc $< \
		-t beamer \
		--template ../common/beamer.template.tex \
		--latex-engine xelatex \
		--slide-level 2 \
		-V fontsize=12pt \
		-o $(basename $@).tex
	latexmk -xelatex $(basename $@)

#----------------------------#
# Defined dual targets
#----------------------------#
# from http://stackoverflow.com/questions/9691508/how-can-i-use-macros-to-generate-multiple-makefile-targets-rules-inside-foreach

basenames := $(basename $(wildcard *.md))

define DUAL
$(1): $(1).slides.pdf $(1).notes.pdf
endef

$(foreach i, $(basenames), $(eval $(call DUAL, $(i))))

#----------------------------#
# Defined phony targets
#----------------------------#
markdowns  := $(wildcard *.md)
notes_pdf  := $(patsubst %.md, %.notes.pdf, $(markdowns))
slides_pdf := $(patsubst %.md, %.slides.pdf, $(markdowns))

slides: $(slides_pdf)

notes: $(notes_pdf)

all: $(slides_pdf) $(notes_pdf)

notes_tex  := $(patsubst %.md, %.notes.tex, $(markdowns))
slides_tex := $(patsubst %.md, %.slides.tex, $(markdowns))

# clean up everything except pdfs
clean:
	latexmk -c
	rm -rf $(slides_tex) $(notes_tex)
	rm -rf *.nav *.snm *.vrb *.bbl *.run.xml *-blx.bib

# clean up everything including pdfs
realclean:
	latexmk -C
	rm -rf $(slides_tex) $(notes_tex)
	rm -rf *.nav *.snm *.vrb *.bbl *.run.xml

.DEFAULT_GOAL := all

.PHONY: slides notes all clean realclean
