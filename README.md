# Markdown to lecture slides

## [`slides`](slides/)

The `slides` directory contains slides for my course "General Biology".

**Modified from [agoldst's repo](https://github.com/agoldst/tex/tree/master/lecture-slides).**

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

## [`tikz`](tikz/)

Graphics by tikz.

```bash
arara ch-21
```

## [`materials`](materials/)

Video materials.

See [`list.md`](materials/list.md) for details.

## [`articles`](articles/)

Markdown + Latex

## Others

[`resize.sh`](resize.sh) changes sizes and resolutions of pictures.

## Tools needed

* TeXLive
  * [here](https://github.com/wang-q/dotfiles/blob/master/tex/texlive.md)
  * Or [MacTex](https://tug.org/mactex/mactex-download.html)
* Fonts
  * [Fira](https://github.com/mozilla/Fira): `brew cask install font-fira-sans font-fira-mono`
  * Source Han Sans SC (思源黑体)/Hiragino Sans GB (冬青黑体简体中文)
  * LXGW WenKai (霞鹜文楷)

## Pandoc templates

[`slides/beamer.template.tex`](slides/beamer.template.tex) is a customized pandoc template for
[beamer](https://en.wikipedia.org/wiki/Beamer_(LaTeX)).

### Variables and control statements in pandoc templates

1. `$---$`: variables. Can be provided with YAML document or `pandoc -V key=value`.

   ```yaml
   ---
   title: "21 基因的分子生物学"
   author: "王强"
   institute: "南京大学生命科学学院"
   date: \today{}
   ...
   ```

   ```bash
   pandoc $< \
   		-t beamer \
   		--template beamer.template.tex \
   		--latex-engine xelatex \
   		--slide-level 2 \
   		-V fontsize=12pt \
   		-V bibliography=course.bib \
   		--toc \
   		-o $(basename $@).tex
   ```

2. `$if(---)$ --- $else$ --- $endif$`: conditional branch statements.

   Inline.

   ```
   $if(fontsize)$$fontsize$,$endif$
   ```

   Standalone.

   ```
   $if(listings)$
   \usepackage{listings}
   $endif$
   ```

3. `$for(---)$ --- $endfor$`: loop statements.

   ```
   $for(bibliography)$
   \addbibresource{$bibliography$}
   $endfor$
   ```

4. `$body$` contains all the contents of `input.md` file after processed by Pandoc converter.

