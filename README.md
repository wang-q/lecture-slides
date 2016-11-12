# Markdown to lecture slides

## [`slides`](slides/)

The `slides` directory contains slides for my course "General Biology".

**Modified from
[agoldst's repo](https://github.com/agoldst/tex/tree/master/lecture-slides).**

Check [`example.md`](slides/example.md) for basic syntax. Then generate
[PDF slides](slides/example.slides.pdf) with

```bash
make example.slides.pdf
```

To generate [PDF handouts](slides/example.notes.pdf), with

```bash
make example.notes.pdf
```

To force updating and make slide and note PDFs at once.

```bash
make example -B
```

`make clean` to delete all intermediate files.

## [`common`](common/)

[`beamer.template.tex`](common/beamer.template.tex) contains customized
beamer templates.

[`mh.sh`](common/mh.sh) changes sizes and resolutions of pictures.

## [`materials`](materials/)

Video materials for students.

See [`list.md`](materials/list.md) for details.

## Tools needed

### Required

* TeXLive 2016: `brew cask install mactex` or download from
  [TUG](https://tug.org/mactex/mactex-download.html)
    * Update TeX packages
        * `sudo tlmgr update --self`
        * `sudo tlmgr update --all`
    * Template: `sudo tlmgr install beamertheme-metropolis`
    * TeX utils
        * XeLaTeX
        * latexmk
        * pdfjam
    * Other TeX packages that should come with MacTeX.
        * xeCJK
        * TikZ
        * graphicx
        * caption
        * subcaption
        * animate
        * mhchem
        * biblatex
        * hyperref
        * pgfpages
        * calc
* General tools
    * pandoc: `brew install pandoc`
    * Gnu make utitily
* Fonts
    * [Fira](https://github.com/mozilla/Fira)
    * Hiragino Sans GB (冬青黑体简体中文)
    * Kaiti SC (常州华文 楷体-简)

### Optional

* Image converter
    * imagemagick: `brew install imagemagick`
* References management
    * JabRef: `brew cask install jabref`
* Text editor
    * IntelliJ with markdown and latex supports
