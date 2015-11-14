# Markdown to lecture slides

The `slides` directory contains slides for my course "General Biology".

Check [example.md](slides/example.md) for basic syntax. Then generate PDF slides with 

```bash
cd slides && make example.slides.pdf
```

[slides/example.slides.pdf](slides/example.slides.pdf) is the result on my iMac.

To generate PDF handouts, with

```bash
cd slides && make example.notes.pdf
```

[slides/example.notes.pdf](slides/example.notes.pdf) is the result on my iMac.

To make slide and note PDFs at once.

```bash
cd slides && make example.slides.pdf example.notes.pdf
```

`make clean` to delete all intermediate files.

**Modified from [agoldst's lecture slides](https://github.com/agoldst/tex/tree/master/lecture-slides).**
