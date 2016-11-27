---
title: $e$ 是什么?
author: "王强"
institute: "南京大学生命科学学院"
date: \today{}
toc: false

---

$e$
:   自然对数的底

自然对数
:   以 $e$ 为底的对数

---

\begin{equation*}
    e = \lim_{n\to \infty} \left(1 + \frac{1}{n}\right)^n
\end{equation*}

\note{

这样一个极限是从什么地方冒出来的?

对于纯粹数学家来说, 严密的推理与认证就够了, 数学是他们的智力游戏.

但对普通人来说, 动机非常重要, 为什么要这样做? 这样做有什么用处?

放高利贷的.

}

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
    F = P + P \cdot r \cdot n
\end{equation*}

复利

\begin{equation*}
    F = P \cdot (1+r)^{n}
\end{equation*}

\note{

P 也可以指 principal, 本金.

}

---

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

UNDETERMINED

http://www.snopes.com/quotes/einstein/interest.asp

}
