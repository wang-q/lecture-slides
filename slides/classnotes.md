---
title: "A Sample Set of Slides"
subtitle: "20 遗传的基本规律"
author: "Your Name Here"
date: \today{}

\note{
上面其实是YAML, 将由pandoc处理.

}

---

# 一级标题是独立的页面

## 二级标题是带内容的

我就是内容

### 三级标题本应是Beamer中的text block.

还可以接着写内容.

\note{
Here are my notes.
}

## Another slide

- With a
- list.

* 这是
    * 一个多级
        * 列表的例子.

* 这同样是
    + 多级
        - 列表.

\note{
A note on my list.
}

## Beamer

Beamer中的设置的页面大小比较小, 仅为128毫米乘以96毫米.

因此, 图片大小设置为8厘米就比较适宜. 150 dpi或是300 dpi都可以. 

## 从PowerPoint迁移

将.ppt另存为.pptx；
解压.pptx到一个新的文件夹, 所有的图片都以
ppt\\media\\imageNN.png或imageNN.jpeg
名字存在.

## 图像格式转换

使用imagemagick将.png转化为.jpg, 以节约空间.

    find . -type f -name "*.png" \
        | sort \
        | parallel basename {} .png \
        | parallel convert -units PixelsPerInch {}.png -density 300 {}.jpg

将所有图片统一dpi

```bash
find . -type f -name "*.jpeg" \
    | sort \
    | parallel basename {} .jpeg \
    | parallel convert -units PixelsPerInch {}.jpeg -density 300 {}.jpg
```

\note{
以大于或等于4个空格开始的行都是code block.
}

---

组合程序
```bash
cd ~/Documents/Course/lecture-slides/slides/ch-25.images
find . -type f -name "*.jpeg" -or -name "*.png" \
    | sort \
    | parallel sh ../mh.sh {}
```

手动调整
```bash
mogrify -resize "x945" image11.jpg
```

## 格式: latex

下面是\LaTeX 格式的例子.

这是\textit{italic}, 还有\textsuperscript{上标}, 以及\alert{强调}, 再加上脚注\footnotemark.

\footnotetext{不要对中文使用斜体}

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

