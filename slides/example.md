---
title: "这是标题"
subtitle: "副标题"
author: "签下大名"
institute: "单位"
date: \today{}
toc: true

---

* 首页其实是多个参数, 用于设置的 `Beamer` 模板里的变量, 形成的 `\titlepage`.

* 用的是 `YAML` 的形式, 变量可以是 `string` 或 `boolean`.

# 标题与分页

---

* 一级标题, 为只含有标题的独立页面.

* 使用 `---` 分页, 或参考下一页使用二级标题.

* 在模板中设置了 `\tableofcontents[hideallsubsections]`, 所以只有一级标题会被纳入 `TOC`.

* 一级标题后如有内容, 需要在之前加入 `---` 来分页.

## 二级标题

二级标题会引起分页, 同时作为页面标题.

这是由 `Makefile` 里的 `pandoc --slide-level 2` 指定的.

---

### 三级标题

本应是 `Beamer` 中的 `text block`, 但 `mtheme` 的默认样式里不明显.

后面 LaTeX 部分 Blocks 一节有好看些的例子.

## 长页面的处理

* 这
* 是
* 一
* 个
* 非
* 常
* 非
* 常
* 非
* 常
* 非
* 常
* 非
* 常
* 长
* 的
* 列
* 表

## 自动分页 {.allowframebreaks}

* 这
* 是
* 一
* 个
* 非
* 常
* 非
* 常
* 非
* 常
* 非
* 常
* 非
* 常
* 长
* 的
* 列
* 表

## 自动压缩 {.shrink}

* 这
* 是
* 一
* 个
* 非
* 常
* 非
* 常
* 非
* 常
* 非
* 常
* 非
* 常
* 长
* 的
* 列
* 表

# Markdown 样式

---

* 基本内容[这本书](https://www.gitbook.com/book/gitbookio/markdown/details)讲得足够了, 正文仅十页.

* Pandoc扩展部分[在此](http://pandoc.org/README.html#pandocs-markdown).

## 文字样式

Regular 普通

*italic* *楷体*[^note]

**Bold** **加粗**

~~Strikethrough~~ ~~删除线~~

[^note]: 中文用 *楷体* 来代替 *italic*, 但是水平线并不一致, 慎用

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
        * 列表的例子

* 这同样是
    + 多级
        - 列表

## 定义列表

Term 1

:   Definition 1

Term 2 with *inline markup*

:   Definition 2

        { some code, part of Definition 2 }

    Third paragraph of definition 2.

---

## 表格

| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |
|    1  |    1 |     1   |     1  |
: 表格说明

## 引用格式

> Markdown quotes.

> 吾爱吾师, 吾更爱真理.

# \LaTeX 样式

## 常用的符号

* Prime and arrow
    * $5^{\prime} \rightarrow 3^{\prime}$方向

* 乘号
    * $3.2 \times 10^9$ bp

* 人名中的点
    * 艾萨克 $\cdot$ 牛顿
    * 艾萨克·牛顿

* 摄氏度
    + $90\,^{\circ}\text{C}$
    + 3.98°C

* 引号
    * \texttt{``} 和 \texttt{''} 会被转换成 ``双引号''

## 文字样式

下面是\LaTeX 文字样式的例子\footnote{注意latex的control sequence后不要紧接着写中文字符. 这也是通篇都用半角符号的原因之一.}.

* \textit{楷体} 
    * `\textit{}`
* \textbf{粗体} 
    * `\textbf{}`
* \underline{下划线} 
    * `\underline{}`

\note{

注释中可以用latex的格式, 但不可以用markdown的.

Some \textit{italic} texts.

Not *italic*.

Not **bold**.

}

---

还有\textsuperscript{上标}\textsubscript{下标}, 以及\alert{强调}, 再加上脚注\footnote{中文使用楷体代替斜体}.

## 更多文字样式

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

## \LaTeX 颜色 {.shrink}

* \textcolor{black}{black}
* \textcolor{blue}{blue}
* \textcolor{brown}{brown}
* \textcolor{cyan}{cyan}
* \textcolor{darkgray}{darkgray}
* \textcolor{gray}{gray}
* \textcolor{green}{green}
* \textcolor{lightgray}{lightgray}
* \textcolor{lime}{lime}
* \textcolor{magenta}{magenta}
* \textcolor{olive}{olive}
* \textcolor{orange}{orange}
* \textcolor{pink}{pink}
* \textcolor{purple}{purple}
* \textcolor{red}{red}
* \textcolor{teal}{teal}
* \textcolor{violet}{violet}
* \textcolor{white}{white}
* \textcolor{yellow}{yellow}

## `metropolis` 颜色

* \textcolor{TolDarkRed}{TolDarkRed}
* \textcolor{TolLightRed}{TolLightRed}
* \textcolor{TolDarkPink}{TolDarkPink}
* \textcolor{TolLightPink}{TolLightPink}
* \textcolor{TolDarkGreen}{TolDarkGreen}
* \textcolor{TolLightGreen}{TolLightGreen}
* \textcolor{TolDarkBrown}{TolDarkBrown}
* \textcolor{TolLightBrown}{TolLightBrown}
* \textcolor{TolDarkBlue}{TolDarkBlue}
* \textcolor{TolLightBlue}{TolLightBlue}
* \textcolor{TolDarkPurple}{TolDarkPurple}
* \textcolor{TolLightPurple}{TolLightPurple}

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

## 引用管理

所有原始的文献库在 zotero 中. 导出为 bibtex\footnote{不用 biblatex}, 再用 Jabref\footnote{不用 bibdesk}
打开修改.

一页里出现两个 `\footnotemark` 会导致脚注编号出错错误.

文件里如果只用 `\footnotemark`, 会让脚注始编号始终为 `1`. 若一页上有两个脚注, 则都为 `2`.

所以尽量用 `\footnote` 来引用.\footnotemark

\footnotetext{\fullcite{meselson1958}}

# 图

---

![无标题页面的图, Markdown](ch-24.images/image39.jpg)

---

\begin{figure}
    \includegraphics{ch-24.images/image39.jpg}
    \caption{无标题页面的图, LaTeX}
\end{figure}

## 有标题页面的图

\begin{figure}
    \includegraphics[height=0.75\textheight, keepaspectratio]{ch-24.images/image39.jpg}
    \caption{果蝇的多线染色体}
\end{figure}

## 不加 `\caption` 不会记入图的编号序列

\begin{figure}
    \includegraphics[height=0.75\textheight, keepaspectratio]{ch-24.images/image39.jpg}
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

---

\begin{figure}
    \includegraphics{../tikz/ExponentialGrowth.pdf}
    \caption{外源 pdf}
\end{figure}

\note{

不支持外源动画 pdf

}

# Beamer

## 页面尺寸

Beamer 中的设置的页面尺寸比较小, 为 ``128 mm $\times$ 96 mm''.

因此, 图片大小设置为 ``8 cm $\times$ 300 dpi'' 就比较适宜.

纵向尺寸:

* $8 \div 2.54 \times 300 \approx 945$
* $6 \div 2.54 \times 300 \approx 709$
* $4 \div 2.54 \times 300 \approx 472$

横向尺寸:

* $11 \div 2.54 \times 300 \approx 1299$

## 从PowerPoint迁移

将`.ppt`另存为`.pptx`; 解压`.pptx`到一个新的文件夹, 所有的图片都以 `ppt/media/imageNN.png` 或 `imageNN.jpeg` 
名字存在.

## 图像格式转换

* 代码格式, 还可以有语法高亮

    由 `pandoc` 自动生成, 默认的样式是 `pygments`. `行内代码`

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
    | parallel sh ../../resize.sh {}
```

---

* 手动调整

```bash
mogrify -resize "x945" image11.jpg # Fill page

mogrify -resize "x709" image11.jpg # Normal size
```

## 动画

可以使用 `media9` 来向pdf中嵌入视频 (mp4), 它使用了 Flash 插件, 所以只能在 Adobe Reader 中查看.

这里使用 `animate` 包.

下面的命令将 gif 转换成一系列的 png 文件

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
