---
title: "这是首页"
subtitle: "其实是YAML, 将由pandoc处理"
author: "签下大名"
date: \today{}

---

# 标题

---

前一页是一级标题, 为独立的页面

使用`---`或一个二级标题分页

由`Makefile`里的`pandoc --slide-level 2`指定

## 二级标题是页面标题

包括内容

### 三级标题本应是Beamer中的text block.

还可以接着写内容.

\note{
Here are my notes.
}

# Markdown

---

* 基本内容[这本书](https://www.gitbook.com/book/gitbookio/markdown/details)讲得足够了.

* Pandoc扩展部分[在此](https://www.gitbook.com/book/gitbookio/markdown/details).

# 格式

## 列表

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

## 定义列表

Term 1

:   Definition 1

Term 2 with *inline markup*

:   Definition 2

        { some code, part of Definition 2 }

    Third paragraph of definition 2.

## 表格

: 标题

| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |
|    1  |    1 |     1   |     1  |


## 常用的符号

* Prime and arrow
    + 5’ → 3’方向

* Cross

* 人名中的点
    + ·

* 摄氏度
    + $90\,^{\circ}\mathrm{C}$
    + 3.98°C

## latex

下面是\LaTeX 格式的例子\footnotemark.

这是\textit{italic}, 还有\textsuperscript{上标}, 以及\alert{强调}, 再加上脚注\footnotemark.

\footnotetext{注意latex的control sequence后不要紧接着写中文字符. 这也是通篇都用半角符号的原因之一.}

\footnotetext{不要对中文使用斜体}

## 引用管理

所有原始的文献库在zotero中, 子库名为course.

导出为bibtex\footnotemark, 再用Jabref\footnotemark 打开修改.

\footnotetext{不要用biblatex}

\footnotetext{不用bibdesk}

# 图

---

![无标题页面的图, Markdown](ch-24.images/image39.jpg)

---

\begin{figure}
    \includegraphics{ch-24.images/image39.jpg}
    \caption{无标题页面的图, Latex}
\end{figure}

## 有标题页面的图

\begin{figure}
    \includegraphics[height=0.75\textheight, keepaspectratio]{ch-24.images/image39.jpg}
    \caption{果蝇的多线染色体}
\end{figure}

---

\begin{figure}
    \begin{minipage}[b]{.48\linewidth}
        \includegraphics{ch-24.images/image18.jpg}
        \subcaption{有自己独--}
    \end{minipage}
    \hfill
    \begin{minipage}[b]{.48\linewidth}
        \includegraphics{ch-24.images/image19.jpg}
        \subcaption{--立的图例}
    \end{minipage}
    \caption{两栏样式的图}
\end{figure}

# Beamer

## 页面尺寸

Beamer中的设置的页面尺寸比较小, 为128毫米乘以96毫米.

因此, 图片大小设置为``8 cm $\times$ 300 dpi''就比较适宜.

纵向尺寸:
* 8 cm / 2.54 * 300 = 945
* 6 cm / 2.54 * 300 = 709
* 4 cm / 2.54 * 300 = 472

横向尺寸:
* 11 cm / 2.54 * 300 = 1299

## 从PowerPoint迁移

将.ppt另存为.pptx；
解压.pptx到一个新的文件夹, 所有的图片都以
ppt\\media\\imageNN.png或imageNN.jpeg
名字存在.

## 图像格式转换

* 4个空格开始的行都视为代码

    find . -type f -name "*.png" \
        | parallel convert -units PixelsPerInch {.}.png -density 300 {.}.jpg

* 这也是代码的格式, 还可以有语法高亮

```bash
find . -type f -name "*.jpeg" \
    | parallel convert -units PixelsPerInch {.}.jpeg -density 300 {.}.jpg
```

\note{
统一为300 dpi

}

---

* 组合程序

```bash
cd ~/Documents/Course/lecture-slides/slides/ch-25.images
find . -type f -name "*.jpeg" -or -name "*.png" \
    | parallel sh ../mh.sh {}
```

* 手动调整

```bash
mogrify -resize "x945" image11.jpg # Fill page

mogrify -resize "x709" image11.jpg # Normal size
```

# 结束
