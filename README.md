# Markdown to lecture slides

** Modified from [agoldst's lecture slides](https://github.com/agoldst/tex/tree/master/lecture-slides). **

Create notes in the `notes/` directory, on the model of [classnotes.md](notes/classnotes.md). Then generate a PDF of slides with

```
make -C slides classnotes.pdf
```

[slides/classnotes.pdf](slides/classnotes.pdf) is the result on my system.
(Of course you can also `cd slides; make classnotes.pdf`, but I feel more like a command-line master if I use `make -C` from the top-level directory.)

To generate notes (note pages interleaved with slide pages):

```
make -C notes classnotes.pdf
```

[notes/classnotes.pdf](notes/classnotes.pdf) is the result on my system.

I like to print these 8-up in portrait. To generate this format:

```
make -C notes classnotes-8up.pdf
```

To make all slide and note PDFs at once, use `make` all by itself from the top-level directory. (One feels even more of a command-line master when one uses `$(MAKE)` in a Makefile).

I discuss how the bits and pieces work together, and the rationale for doing this, in a blog post: ["Easy Lecture Slides Made Difficult with Pandoc and Beamer."](http://andrewgoldstone.com/blog/2014/12/24/slides/)

