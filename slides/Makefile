
notedir := ../notes

notes := $(wildcard $(notedir)/*.md)
slides_tex := $(patsubst $(notedir)/%.md,%.tex,$(notes))
slides_pdf := $(patsubst %.tex,%.pdf,$(slides_tex))

$(slides_tex): %.tex: $(notedir)/%.md preamble-slides.tex
	pandoc $< \
	    -t beamer \
	    --slide-level 1 \
	    -H preamble-slides.tex \
	    --latex-engine xelatex \
	    -o $@

$(slides_pdf): %.pdf: %.tex
	latexmk -xelatex $(basename $<)

all: $(slides_pdf)

# clean up everything except pdfs
clean:
	latexmk -c
	rm -rf *.nav *.snm
	rm -rf $(slides_tex)

# clean up everything including pdfs
realclean:
	latexmk -C
	rm -rf $(slides_tex)
	rm -rf *.nav *.snm

.DEFAULT_GOAL := all

.PHONY: all clean realclean
