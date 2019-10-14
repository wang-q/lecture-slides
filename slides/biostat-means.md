---
title: "e and beyond"
author: "王强"
institute: "南京大学生命科学学院"
date: \today{}
toc: false

---

# 几种平均数

## 算术平均数

\begin{equation*}
    A_n = \frac{x_1 + x_2 + \cdots + x_n}{n} = \frac{1}{n} \sum_{i=1}^{n} {x_i}
\end{equation*}

* Arithmetic mean

* 最常见的平均数, 平均身高, 平均面积等等 

* 在统计学中, 对样本的平均值用 $\bar{x}$ 表示, 对母体数据的平均值用 $\mu$ 表示

## 几何平均数

\begin{equation*}
    G_n=\sqrt[n]{x_1x_2\cdots x_n} =\sqrt[n]{\prod_{i=1}^nx_i}
\end{equation*}

* Geometric mean

* 使用一组数的\alert{积}, 算术平均数使用一组数的\alert{和}

* 例如第一年利率 0.0%, 第二年利率 20.0%, 第三年利率 20.0%, 第四年利率 14.4%, 平均利率就是
    $\sqrt[{4}]{1.0 \times 1.2 \times 1.2 \times 1.44} = 1.2$, 即 20%

## 调和平均数

\begin{equation*}
    H_n = \frac {n}{\frac{1}{x_1} + \frac{1}{x_2} + \cdots + \frac{1}{x_n}}
        = \frac {n}{\sum _{i=1}^{n}{\frac {1}{x_i}} }
\end{equation*}

* Harmonic mean

* 使用一组数的\alert{倒数}

* 平均速度的计算: 如一段路程, 前半段时速 60 千米, 后半段时速 30 千米, 则其平均速度为两者的调和平均数 40 千米

## 平方平均数

\begin{equation*}
    Q_n = \sqrt{\frac{\sum_{i=1}^{n} x_i^2}{n}} 
        = \sqrt{\frac{x^2_1 + x^2_2 + \cdots + x^2_n}{n}}
\end{equation*}

* Quadratic mean

* 方均根, Root Mean Square, RMS

* 使用一组数的\alert{平方}

* 标准差 $SD$, 就是所有 $N$ 个数据和平均值 $\mu$ 之差的方均根

\begin{equation*}
    SD= \sqrt{\frac{1}{N} \sum_{i=1}^N (x_i - \mu)^2}
\end{equation*}
