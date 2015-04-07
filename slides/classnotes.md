---
title: A Sample Set of Slides

author: Your Name Here

date: Totally Not the Last Minute

---

## An ordinary slide

With some text.

### And a block

And some text underneath.

\note{
Here are my notes.
}

## Another slide

- With a
- list.

\note{
A note on my list.
}

## Beamer

Beamer中的设置的页面大小比较小, 仅为128毫米乘以96毫米.

因此, 图片大小设置为8厘米就比较适宜. 150 dpi或是300 dpi都可以.

## 引用管理

所有原始的文献库在zotero中, 子库名为course.

导出为bibtex(不要用biblatex), 再用Jabref(不用bibdesk)打开修改.

## A slide to show overlay tricks

This text appears on the first and third versions of the slide, but not the second.

This uses beamer's highlighting command to \alert{draw attention here}, but only on the second slide.

\note{
Notes can also have overlay specs. First slide version note.

Second.

}

\note{
And third. Use \LaTeX\ macros in notes, like \emph{emphasis}.

}

\note{
To get overlay effects with materials placed using \texttt{textpos}, you have to specify the overlay within the \texttt{textblock} environment.

}

---

## Going to sleep

- 上床
- 数羊
- count sheep

