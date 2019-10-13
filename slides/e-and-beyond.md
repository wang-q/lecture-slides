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
    A = \frac{x_1 + x_2 + x_3 + \cdots + x_n}{n} = \frac{1}{n} \sum_{i=1}^{n} {x_i}
\end{equation*}

* Arithmetic mean

* 最常见的平均数, 平均身高, 平均面积等等 

* 在统计学中, 对样本的平均值用 $\bar{x}$ 表示, 对母体数据的平均值用 $\mu$ 表示

## 几何平均数

\begin{equation*}
    G = \sqrt[{n}]{x_1 x_2 \cdots x_n} = \left(\prod _{i=1}^{n}x_{i}\right)^{\frac {1}{n}}
\end{equation*}

* Geometric mean

* 使用一组数的值的\alert{积}, 算术平均数使用一组数的的\alert{和}

* 例如第一年利率 0.0%, 第二年利率 20.0%, 第三年利率 20.0%, 第四年利率 14.4%, 平均利率就是
    $\sqrt[{4}]{1.0 \times 1.2 \times 1.2 \times 1.44} = 1.2$, 即 20%

## 调和平均数

\begin{equation*}
    H = \frac {n}{{\frac {1}{x_{1}}} + {\frac {1}{x_{2}}} + \cdots + {\frac {1}{x_{n}}}}
          = \frac {n}{\sum _{i=1}^{n}{\frac {1}{x_{i}}} }
\end{equation*}

* Harmonic mean

* 使用一组数的值的\alert{倒数}

* 平均速度的计算: 如一段路程, 前半段时速 60 千米, 后半段时速 30 千米, 则其平均速度为两者的调和平均数 40 千米

