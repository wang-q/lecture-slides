---
title: $\text{e}$ 是什么?
author: "王强"
institute: "南京大学生命科学学院"
date: \today{}
toc: false

---

# 书上说的

---

$\text{e}$
:   自然对数的底

自然对数
:   以 $\text{e}$ 为底的对数

---

\begin{equation*}
    \text{e} = \lim_{n\to \infty} \left(1 + \frac{1}{n}\right)^n
\end{equation*}

\pause{
定义 $\text{e}$ 为唯一的实数 $x$, 使得
\begin{equation*}
    \lim_{h\to 0}\frac{x^h-1}{h}=1
\end{equation*}
}

\pause{
\begin{equation*}
     \text{e} = \sum_{n=0}^\infty {1 \over n!} = {1 \over 0!} + {1 \over 1!} + {1 \over 2!} + {1 \over 3!} + {1 \over 4!} + \cdots
\end{equation*}
}

\pause{
定义 $\text{e}$ 为唯一的正数 $x$, 使得
\begin{equation*}
    \int_{1}^{x} \frac{1}{t} \, dt = {1}
\end{equation*}
}

\note{

数学家说, 想要详细的定义? 没问题, 想要多少种? 都给你.

这样一个极限是从什么地方冒出来的?

对于纯粹数学家来说, 严密的推理与证明就够了, 数学是他们的智力游戏, 是一定规则下的相容体系.

但对普通人来说, 动机非常重要, 为什么要这样做? 这样做有什么用处?

}

---

\begin{exampleblock}{}
    {\large ``美是第一位的, 在这个世界上\alert{丑陋的数学}没有永久存在的位置.''}
    \vskip5mm
    \hspace*\fill{\small--- 戈弗雷 $\cdot$ 哈罗德 $\cdot$ 哈代, 一个数学家的辩白}
\end{exampleblock}

\pause{
\begin{exampleblock}{}
    {\large ``在二十世纪中叶, 人们试图将数学与物理分割开来. 其结果是\alert{灾难性的}.''}
    \vskip5mm
    \hspace*\fill{\small--- 弗拉基米尔 $\cdot$ 阿诺尔德}
\end{exampleblock}
}

\note{

哈代, 1877--1947. 对于纯粹数学和应用数学的看法

\url{https://en.wikiquote.org/wiki/G._H._Hardy}

Vladimir Arnold, 1937--2010.

\url{https://en.wikiquote.org/wiki/Vladimir_Arnold}

下面来还原我们人类历史上对这个数的发现过程.

放高利贷的人意识到了有个数存在.

第一次把 $\text{e}$ 看为常数的是雅各布·伯努利, 他尝试计算下式的值.

}

# 真实的历史

## 利息

利息
: 指负债方为借债向债权人所付的补偿性费用, interest.

计算利息的方法:

* 单利
: 按照固定的本金计算的利息, simple interest.

* 复利
: 利息除了会根据本金计算外, 新得到的利息同样可以生息. compound interest.

\note{

对于借债方来说, 利息是借钱的代价; 对于提供贷款或购买债券的投资者来说, 利息可以部分抵消债务投资的信用风险和机会成本.

收到利息之后, 可以将利息继续放贷给别人. 如果这个别人是同一个借贷人, 即是复利.

}

## 利息的计算公式

$F$
: 财富在未来的价值, \underline{F}uture value.

$P$
: 现值，即本金, \underline{P}resent value.

$r$
: 周期内的利息率, interest \underline{r}ate.

$n$
: 累计的周期数.

单利

\begin{equation*}
    F_\text{S} = P + P \cdot r \cdot n
\end{equation*}

复利

\begin{equation*}
    F_\text{C} = P \cdot (1+r)^{n}
\end{equation*}

\note{

P 也可以指 principal, 本金.

Save Exponential-growth.pptx as Exponential-growth.pdf

Don't use pdfcrop. Quality of pdfcrop product is very poor.

}

---

\begin{figure}
    \includegraphics{the-number-e/Exponential-growth-2.jpg}
    \caption{简化条件: 令 $P = 1$, $r = 1$, 则 $F_\text{C} = (1+1)^{n}$}
\end{figure}

\note{

\scriptsize\texttt{

cd the-number-e

mkdir -p temp \string&\string& cd temp

pdftoppm -rx 300 -ry 300 -png ../Exponential-growth.pdf Exponential-growth

cd ..

find temp -maxdepth 1 -name "Exponential*.png" | parallel -j 1 "convert {} -trim {}"

find temp -maxdepth 1 -name "Exponential*.png" | parallel -j 1 "bash ~/Scripts/lecture-slides/resize.sh {}"

rm -fr temp

}

}

---

\begin{figure}
    \includegraphics{the-number-e/Exponential-growth-3.jpg}
\end{figure}

\note{

上的的周期是一年. 现在来观察一年内的情况.

利息学随着时间的推移, 慢慢地出现的.

}

---

\begin{figure}
    \includegraphics{the-number-e/Exponential-growth-4.jpg}
\end{figure}

---

\begin{figure}
    \includegraphics{the-number-e/Exponential-growth-5.jpg}
\end{figure}

\note{

实际上, 银行里的存款提前支取是要受到利率惩罚的.

}

---

\begin{figure}
    \includegraphics{the-number-e/Exponential-growth-6.jpg}
\end{figure}

---

\begin{figure}
    \includegraphics{the-number-e/Exponential-growth-7.jpg}
\end{figure}

---

$m$
: 一个周期内, 计复利的次数.

前面的简化公式

\begin{equation*}
    F_\text{C} = (1+1)^1
\end{equation*}

利率 $r=1/m$, 累计的周期数 $n=m$, 上式变成了

\begin{equation*}
    F_\text{C} = (1 + {1 \over m})^m
\end{equation*}

\note{

半年复利, 季度复利, 月复利等的通用公式

}

---

| $m$ | $(a+b)^m$                       | $(1+1/m)^m$                                                                                   | $F_\text{C}$ |
|:----|:--------------------------------|:----------------------------------------------------------------------------------------------|:-------------|
| 1   | $a+b$                           | 1 + 1                                                                                         | 2            |
| 2   | $a^2 + 2ab + b^2$               | $1^2 + 2 \cdot 1 \cdot 1/2 + (1/2)^2 = 1 + 1 + 0.25$                                          | 2.25         |
| 3   | $a^3 + 3 a^2 b + 3 a b^2 + b^3$ | $1^3 + 3 \cdot 1^2 \cdot 1/3 + 3 \cdot 1 \cdot (1/3)^2 + (1/3)^3 \approx 1 + 1 + 0.33 + 0.04$ | 2.37         |

\note{

和前面的图里完全一致, 连数字出现的顺序都一样.

}

---

| $m$                     | $F_\text{C} = (1+1/m)^m$ |
|:------------------------|:-------------------------|
| 1                       | 2                        |
| 2                       | 2.25                     |
| 3                       | 2.37                     |
| 12                      | 2.613                    |
| 365                     | 2.714567                 |
| $365 \cdot 24 \cdot 60$ | 2.718279                 |

\pause{
\begin{equation*}
    \text{e} = \lim_{n\to \infty} \left(1 + \frac{1}{n}\right)^n
\end{equation*}
}

\note{

$365 \cdot 24 \cdot 60 = 525600$

}

---

\begin{figure}
    \includegraphics{the-number-e/E_with_colors.jpg}
\end{figure}

\note{

有了颜色的帮助, 我们理解起来是不是更容易些了?

}

## Bonus slides

1626 年, 荷兰人以 60 荷兰盾 (NLG) 从当地印地安酋长那里买下整个曼哈顿岛.

印地安酋长将钱存放到荷兰银行, 收取每年 6.5% 的复利利率, 并承受通货膨胀带来的贬值.

\begin{equation*}
    \begin{split}
        F &= 60 \text{ NLG} \times ( 1 + 6.5 \div 100)^{2016 - 1626} \\
          &= 60 \text{ NLG} \times 1.065^{390} \\
          &\approx 2782904368555 \text{ NLG} \\
          &= 2782904368555 \div 2.20371 \times 1.0595 \text{ USD} \\
          &\approx 1.338 \text{ Trillion USD}
    \end{split}
\end{equation*}

\note{

2002 年变成欧元 \url{https://en.wikipedia.org/wiki/Dutch_guilder}

EUR/USD

Trillion 万亿

纽约市物业总值2017年将超过1万亿美元 \url{http://www1.hkej.com/dailynews/articlePrint/id/1224348}

}

---

\begin{exampleblock}{}
    {\large ``Compound interest is the most powerful force in the universe.''}
    \vskip5mm
    \hspace*\fill{\small--- Albert Einstein}
\end{exampleblock}

\note{

现在通常使用不同年限的不同单利利率, 来避免复利.

UNDETERMINED

http://www.snopes.com/quotes/einstein/interest.asp

}

# 另一条路径

---

\begin{equation*}
    \begin{split}
        f(x)  &= R^{x} \\
        f'(x) &= \lim_{h\to0} \frac{f(x+h) - f(x)}{h} \\
        f'(x) &= \lim_{h\to0} \frac{R^{x+h} - R^x}{h} \\
              &= \lim_{h\to0} \left(R^x \cdot \frac{R^h - 1}{h} \right) \\
              &= R^x  \cdot \lim_{h\to0} \frac{R^h - 1}{h}
    \end{split}
\end{equation*}

\pause{
\begin{equation*}
    R^x = \frac{d}{dx} R^x \rightarrow \lim_{h\to 0}\frac{R^h-1}{h}=1
\end{equation*}
}

\note{

\url{http://math.stackexchange.com/questions/190773/proof-of-fracddxex-ex}

This can be done because $R^{x}$ is "constant" and "constant" means "not depending on $h$".

But this is equal to $(R^x \cdot \text{constant})$. But in this case "constant" means "not depending
on $x$". "Constant" always means "not depending on something", but "something" varies with the
context.

}

---

数学家们应用 l'Hôpital's rule, 可以求出

\begin{equation*}
    \lim_{h\to0} \frac{R^h - 1}{h} = \ln(R)
\end{equation*}

这里用土一点的办法.

\note{

洛必达法则什么的我已经忘记了, 问你们的数学老师.

}

---

\begin{figure}

    \centering

    \begin{tikzpicture}
        \begin{axis}[
            grid=major,
            xmin=-2,
            xmax=2,
            ymax=4,
            ymin=0,
            axis x line=bottom,
            axis y line=middle,
        ]
            \addplot[
                color=TolDarkBlue,
                ultra thick,
                mark=none,
                samples=37,
                domain=-2:1.5,
            ]{(2^(x) - 1 ) / x } node[above,pos=1] {R=2};
            \addplot[
                color=TolDarkBrown,
                ultra thick,
                mark=none,
                samples=37,
                domain=-2:1.5,
            ]{(3^(x) - 1 ) / x } node[above,pos=1] {R=3};
            \addplot[
                color=TolDarkPurple,
                ultra thick,
                mark=none,
                samples=37,
                domain=-2:1.2,
            ]{(4^(x) - 1 ) / x } node[above,pos=1] {R=4};
        \end{axis}
    \end{tikzpicture}

    \caption{$\lim_{h\to0} \frac{R^h - 1}{h}$, $R = 2 \rightarrow 4$}
\end{figure}

---

\begin{figure}

    \centering

    \begin{tikzpicture}
        \begin{axis}[
            grid=major,
            xmin=-1,
            xmax=1,
            ymax=1.6,
            ymin=0.6,
            axis x line=bottom,
            axis y line=middle,
        ]
            \addplot[
                color=TolDarkBlue,
                ultra thick,
                mark=none,
                samples=37,
                domain=-1:0.6,
            ]{(2.6^(x) - 1 ) / x } node[right,pos=1] {R=2.6};
            \addplot[
                color=TolDarkBrown,
                ultra thick,
                mark=none,
                samples=37,
                domain=-1:0.6,
            ]{(2.7^(x) - 1 ) / x } node[right,pos=1] {R=2.7};
            \addplot[
                color=TolDarkPurple,
                ultra thick,
                mark=none,
                samples=37,
                domain=-1:0.6,
            ]{(2.8^(x) - 1 ) / x } node[right,pos=1] {R=2.8};
            \addplot[
                color=TolDarkGreen,
                ultra thick,
                mark=none,
                samples=37,
                domain=-1:0.6,
            ]{(2.9^(x) - 1 ) / x } node[right,pos=1] {R=2.9};
        \end{axis}
    \end{tikzpicture}

    \caption{$\lim_{h\to0} \frac{R^h - 1}{h}$, $R = 2.6 \rightarrow 2.9$}
\end{figure}

---

\begin{figure}

    \centering
    \pgfplotsset{xticklabel style={
                         /pgf/number format/fixed,
                         /pgf/number format/precision=5
                 },
                 scaled x ticks=false}
    \begin{tikzpicture}
        \begin{axis}[
            grid=major,
            xmin=0,
            xmax=0.08,
            ymax=1.04,
            ymin=0.98,
            axis x line=bottom,
            axis y line=left,
        ]
            \addplot[
                color=TolDarkBlue,
                ultra thick,
                mark=none,
                samples=37,
                domain=0.005:0.06,
            ]{(2.70^(x) - 1 ) / x } node[right,pos=1] {R=2.70};
            \addplot[
                color=TolDarkBrown,
                ultra thick,
                mark=none,
                samples=37,
                domain=0.005:0.06,
            ]{(2.71^(x) - 1 ) / x } node[right,pos=1] {R=2.71};
            \addplot[
                color=TolDarkPurple,
                ultra thick,
                mark=none,
                samples=37,
                domain=0.005:0.06,
            ]{(2.72^(x) - 1 ) / x } node[right,pos=1] {R=2.72};
            \addplot[
                color=TolDarkGreen,
                ultra thick,
                mark=none,
                samples=37,
                domain=0.005:0.06,
            ]{(2.73^(x) - 1 ) / x } node[right,pos=1] {R=2.73};
        \end{axis}
    \end{tikzpicture}

    \caption{$\lim_{h\to0} \frac{R^h - 1}{h}$, $R = 2.70 \rightarrow 2.73$}
\end{figure}

#  剩下的两个

##  第三种定义

\begin{equation*}
     \text{e} = \sum_{n=0}^\infty {1 \over n!} = {1 \over 0!} + {1 \over 1!} + {1 \over 2!} + {1 \over 3!} + {1 \over 4!} + \cdots
\end{equation*}

$\text{e}^x$ 的泰勒展式, 令 $x = 1$
\begin{equation*}
    \text{Series}\left[\text{e}^x,\{x,0,4\}\right]
    = 1+x+\frac{x^2}{2}+\frac{x^3}{6}+\frac{x^4}{24}+O\left(x^5\right)
\end{equation*}

\note{

具体的泰勒展式, 我也记不清了, 问数学老师.

}

##  第四种定义

定义 $\text{e}$ 为唯一的正数 $x$, 使得
\begin{equation*}
    \int_{1}^{x} \frac{1}{t} \, dt = {1}
\end{equation*}

看下这个不定积分
\begin{equation*}
    \int \frac{1}{t} \, dt = \ln (t)
\end{equation*}

\note{

当然, 为了避免循环定义, 我们要用最原始的方法来算积分, ``数柱子''.

这里牵扯到了更深层次的数学问题, 不多说了

这就是我们人类科学发展的历史

}

---

* 人类科学发展的历史, 先有猜想和算法, 而后严格地形式化证明.
* 每次进一步地形式化, 都提高了门槛, 降低了人们的学习兴趣.
* 没有新人进入, 就减慢了学科的发展, (降低了杂志的影响因子 \Simley{-1},) 被动地毁灭了学科\footnote{\fullcite{watterson1975}}.
* 形式化的学科内容, 决不能在一开始就灌输给初学者.

\note{

Theoretical Population Biology, 不乏被引上千次的经典论文, 现在影响因子只有 1.452.

和大多数数学杂志影响因子一样.

Watterson's $\theta$, 3005 次, 世界上最难的一篇论文.

教小学生自然数的时候, 先给他们讲皮亚诺公理体系, 会不会被打死?

等人入坑了, 秋后算帐倒是没问题.

}
