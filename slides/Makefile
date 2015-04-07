notes := $(wildcard *.md)

notes_tex := $(patsubst %.md,%.notes.tex,$(notes))
notes_pdf := $(patsubst %.tex,%.pdf,$(notes_tex))

%.notes.tex: %.md preamble-notes.tex
	pandoc $< \
	    -t beamer \
	    -H preamble-notes.tex \
	    --latex-engine xelatex \
	    -V theme:Pittsburgh \
	    --slide-level 2 \
	    -o $@

$(notes_pdf): %.pdf: %.tex
	latexmk -xelatex $(basename $<)
	pdfjam $*.pdf \
		--no-landscape \
		--frame true \
		--nup 2x4 \
		--suffix nup
	mv $*-nup.pdf $@

slides_tex := $(patsubst %.md,%.slides.tex,$(notes))
slides_pdf := $(patsubst %.tex,%.pdf,$(slides_tex))

%.slides.tex: %.md preamble-slides.tex
	pandoc $< \
	    -t beamer \
	    -H preamble-slides.tex \
	    --latex-engine xelatex \
	    --slide-level 2 \
	    -V fontsize=12pt \
	    -o $@

$(slides_pdf): %.pdf: %.tex
	latexmk -xelatex $(basename $<)

slides: $(slides_pdf)

notes: $(notes_pdf)

all: $(slides_pdf) $(notes_pdf)

# clean up everything except pdfs
clean:
	latexmk -c
	rm -rf *.nav *.snm *.vrb *.bbl *.run.xml *.slides-blx.bib
	rm -rf $(slides_tex) $(notes_tex)

# clean up everything including pdfs
realclean:
	latexmk -C
	rm -rf $(slides_tex) $(notes_tex)
	rm -rf *.nav *.snm *.vrb *.bbl *.run.xml

.DEFAULT_GOAL := all

.PHONY: all clean realclean
