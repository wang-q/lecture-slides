# Markdown to lecture slides

The `slides` directory contains slides for General Biology.

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

To make all slide and note PDFs at once, use `make` all by itself .

**Modified from [agoldst's lecture slides](https://github.com/agoldst/tex/tree/master/lecture-slides).**
