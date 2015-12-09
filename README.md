# Markdown to lecture slides

## [`slides`](slides/)

The `slides` directory contains slides for my course "General Biology".

**Modified from [agoldst's repo](https://github.com/agoldst/tex/tree/master/lecture-slides).**

Check [`example.md`](slides/example.md) for basic syntax. Then generate PDF slides with 

```bash
make example.slides.pdf
```

[`slides/example.slides.pdf`](slides/example.slides.pdf) is the result on my iMac.

To generate PDF handouts, with

```bash
make example.notes.pdf
```

[`slides/example.notes.pdf`](slides/example.notes.pdf) is the result on my iMac.

To force updating and make slide and note PDFs at once.

```bash
make example -B
```

`make clean` to delete all intermediate files.

## [`common`](common/)

Contains preambles for TeX.

[`mh.sh`](common/mh.sh) changes sizes and resolutions of pictures.

## [`materials`](materials/)

Video materials for students.

See [`list.md`](materials/list.md) for details.

## Tools needed

### Required

* General tools
    * pandoc: `brew install pandoc`
    * MacTex: `brew cask install mactex` or download from [TUG](https://tug.org/mactex/mactex-download.html)
    * Gnu make utitily
* Image converter
    * imagemagick: `brew install imagemagick`
* Template
    * my fork of [mtheme](https://github.com/wang-q/mtheme)
* Fonts
    * [Fira Sans](https://github.com/mozilla/Fira)
    * Hiragino Sans GB (冬青黑体简体中文)

### Optional

* References management
    * JabRef: `brew cask install jabref`
* Text editor
    * Webstorm with markdown and latex supports
    * Atom
