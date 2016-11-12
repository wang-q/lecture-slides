---
title: "这是首页"
subtitle: "其实是YAML, 将由pandoc处理"
author: "签下大名"
institute: "单位"
date: \today{}

---

# 标题

---

前一页是一级标题, 为独立的页面

使用`---`或一个二级标题分页

由`Makefile`里的`pandoc --slide-level 2`指定

## 二级标题是页面标题

包括内容

### 三级标题

本应是Beamer中的text block, 还可以接着写内容.

\note{

注释中可以用latex的格式, 但不可以用markdown的.

Some \textit{italic} texts.

Not *italic*.

Not **bold**.

}

# Markdown

---

* 基本内容[这本书](https://www.gitbook.com/book/gitbookio/markdown/details)讲得足够了.

* Pandoc扩展部分[在此](http://pandoc.org/README.html#pandocs-markdown).

# 格式

## 字体样式

Regular 普通

*italic* *楷体*

**Bold** **加粗**

~~Strikethrough~~ ~~删除线~~

## Line blocks

| The limerick packs laughs anatomical
| In space that is quite economical.
|    But the good ones I've seen
|    So seldom are clean
| And the clean ones so seldom are comical

| 200 Main St.
| Berkeley, CA 94718

## 列表

* 普通
* 列表

* 这是
    * 一个多级
        * 列表的例子.

* 这同样是
    + 多级
        - 列表.

## 定义列表

Term 1

:   Definition 1

Term 2 with *inline markup*

:   Definition 2

        { some code, part of Definition 2 }

    Third paragraph of definition 2.

---

## 表格

: 标题

| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |
|    1  |    1 |     1   |     1  |


## 常用的符号

* Prime and arrow
    * $5^{\prime} \rightarrow 3^{\prime}$方向

* 乘号
    * $3.2\times10^9$ bp

* 人名中的点
    * 艾萨克·牛顿
    * 艾萨克$\cdot$牛顿

* 摄氏度
    + $90\,^{\circ}\mathrm{C}$
    + 3.98°C

# \LaTeX

## 格式

下面是\LaTeX 格式的例子\footnotemark.

* \textit{楷体} 
    * `\textit{}`
* \textbf{粗体} 
    * `\textbf{}`
* \underline{下划线} 
    * `\underline{}`

\footnotetext{注意latex的control sequence后不要紧接着写中文字符. 这也是通篇都用半角符号的原因之一.}

---

还有\textsuperscript{上标}\textsubscript{下标}, 以及\alert{强调}, 再加上脚注\footnotemark.

\footnotetext{中文使用楷体代替斜体}

## 字形

\begin{itemize}
    \item Regular
    \item \textit{Italic}
    \item \textsc{SmallCaps}
    \item \textbf{Bold}
    \item \textbf{\textit{Bold Italic}}
    \item \textbf{\textsc{Bold SmallCaps}}
    \item \texttt{Monospace}
    \item \texttt{\textit{Monospace Italic}}
    \item \texttt{\textbf{Monospace Bold}}
    \item \texttt{\textbf{\textit{Monospace Bold Italic}}}
\end{itemize}

## 列表

\begin{columns}[T,onlytextwidth]
    \column{0.33\textwidth}
        Items
        \begin{itemize}
            \item Milk \item Eggs \item Potatos
        \end{itemize}
    
    \column{0.33\textwidth}
        Enumerations
        \begin{enumerate}
            \item First, \item Second and \item Last.
        \end{enumerate}
    
    \column{0.33\textwidth}
        Descriptions
        \begin{description}
            \item[PowerPoint] Meeh. \item[Beamer] Yeeeha.
        \end{description}
\end{columns}

## Blocks

Three different block environments are pre-defined and may be styled with an
optional background color.

\begin{columns}[T,onlytextwidth]
    \column{0.5\textwidth}

        \metroset{block=transparent}
    
        \begin{block}{Default}
            Block content.
        \end{block}
        
        \begin{alertblock}{Alert}
            Block content.
        \end{alertblock}
        
        \begin{exampleblock}{Example}
            Block content.
        \end{exampleblock}

    \column{0.5\textwidth}

        \metroset{block=fill}
        
        \begin{block}{Default}
            Block content.
        \end{block}
        
        \begin{alertblock}{Alert}
            Block content.
        \end{alertblock}
        
        \begin{exampleblock}{Example}
            Block content.
        \end{exampleblock}

\end{columns}

## Math

\begin{equation*}
    e = \lim_{n\to \infty} \left(1 + \frac{1}{n}\right)^n
\end{equation*}

## Quotes

\begin{exampleblock}{}
  {\large ``To be, or not to be: that is the question.''}
  \vskip5mm
  \hspace*\fill{\small--- William Shakespeare, Hamlet}
\end{exampleblock}

---

\includegraphics{example.images/feynman_blackboard5.jpg}

\begin{exampleblock}{}
  {\large ``What I cannot create, I do not understand.''}
  \vskip5mm
  \hspace*\fill{\small--- Richard Feynman}
\end{exampleblock}

---

Markdown有自己的引用格式.

> Markdown

> Quote

## 引用管理

所有原始的文献库在zotero中.

导出为bibtex\footnotemark, 再用Jabref\footnotemark 打开修改.

下面的脚注编号是错误的, 但我现在不知道是什么引起了这个BUG, 所以一页上不要出现两个脚注.

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

* 代码格式, 还可以有语法高亮

    由`pandoc`自动生成, 默认的样式是`pygments`. `行内代码`

```bash
find . -type f -name "*.jpeg" \
    | parallel \
    convert -units PixelsPerInch -density 300 \
    {.}.jpeg {.}.jpg
```

\note{
统一为300 dpi

}

---

* 组合程序

可以为程序添加行号

```{.bash .numberLines}
cd ~/Documents/Course/lecture-slides/slides/ch-25.images
find . -type f -name "*.jpeg" -or -name "*.png" \
    | parallel sh ../../common/mh.sh {}
```

---

* 手动调整

```bash
mogrify -resize "x945" image11.jpg # Fill page

mogrify -resize "x709" image11.jpg # Normal size
```

## 动画

可以使用`media9`来向pdf中嵌入视频(mp4), 它使用了Flash插件, 所以只能在Adobe Reader中查看.

因此使用`animate`包.

下面的命令将gif转换成一系列的png文件

```bash
cd ch-28.images
convert -coalesce image14.gif endospore.png
```

---

\begin{figure}
    \animategraphics[loop,controls,width=\linewidth]{1}{ch-28.images/endospore-}{0}{39}
    \caption{芽孢}
\end{figure}

# 结束
