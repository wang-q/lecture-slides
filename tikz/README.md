# tikz figures

## Compiling

`arara -v circle` or `arara -v circle.tex`

## Animated gif

* 将 `\documentclass{standalone}` 的属性改成 `\documentclass[export]{standalone}`
* `pdfcrop circle.pdf`
* `convert -delay 5 -loop 0 -density 400 -alpha remove circle-crop.pdf circle.gif`

