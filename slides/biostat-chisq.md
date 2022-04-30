---
title: 生物统计原理
subtitle: 孟德尔, 卡方与频数统计
author: "王强"
institute: "南京大学生命科学学院"
date: \today{}
toc: true

---

# 孟德尔的生平

---

![Gregor Johann Mendel, 1822-1884](biostat-chisq.images/Gregor_Mendel_2.jpg)

\note{

格雷戈尔·约翰·孟德尔

现代遗传学的创始人

given name 约翰

}

---

\begin{figure}
    \begin{minipage}[b]{.48\linewidth}
        \begin{minipage}[b]{1\linewidth}
            \includegraphics{biostat-chisq.images/Hynčice.jpg}
            \subcaption{出生: 海因岑多夫 (亨奇采)}
        \end{minipage}\\
        \vfill
        \begin{minipage}[b]{1\linewidth}
            \includegraphics{biostat-chisq.images/Opava.jpg}
            \subcaption{中学: 特罗波 (奥帕瓦)}
        \end{minipage}
    \end{minipage}
    \hfill
    \begin{minipage}[b]{.48\linewidth}
        \begin{minipage}[b]{1\linewidth}
            \includegraphics{biostat-chisq.images/Olomouc.jpg}
            \subcaption{帕拉茨基大学: 奥洛穆茨}
        \end{minipage}\\
        \vfill
        \begin{minipage}[b]{1\linewidth}
            \includegraphics{biostat-chisq.images/Brno.jpg}
            \subcaption{教会工作: 布隆 (布尔诺)}
        \end{minipage}
    \end{minipage}
\end{figure}

\note{

维基上网页 300% 截图

除了 奥洛穆茨 外, 每个地名都有德语与捷克语两种名称, 中文文献中有些混乱, 括号中的是现在的捷克名字

出生: 奥地利帝国 西里西亚 海因岑多夫 Heinzendorf bei Odrau（今捷克 亨奇采 Hynčice), 农村环境

中学: 11岁时进入 特罗波 Troppau (今捷克 奥帕瓦 Opava) 的中学. 1840年, 他以优异的成绩毕业。

第一个大学: 毕业后, 孟德尔进入 奥洛穆茨 大学哲学研究所学习了两年的课程.
在业余时间做家教以维持生计, 尽管深受抑郁症的折磨, 不止一次导致他暂时放弃学业, 但孟德尔还是在1843年从该课程毕业。

同年, 孟德尔不顾父亲希望他接管家庭农场的意愿, 加入布隆城的圣奥古斯丁修会, 并被赐名为 Gregor.
他成为一名僧侣, 部分原因是这使他能够获得教育而不必自己支付学费.
作为一个挣扎的农民的儿子, 用他的话说, 僧侣生活使他免于 "永远为生计而焦虑".

逝世: 奥匈帝国 布隆 Brünn（今捷克 布尔诺 Brno）

}

---

\begin{columns}[onlytextwidth]
    \column{0.58\textwidth}
        \begin{itemize}
        \item 1851 年, 孟德尔前往 \alert{维也纳大学}
        \item 在多普勒的指导下学习数学和物理
        \item 在昂格尔的指导下学习植物学
        \item 昂格尔使用显微镜进行植物学研究; 假设植物细胞内简单元素的组合决定了 \alert{植物的遗传}; 1852 年的著作中讨论了植物的进化问题
        \item 1853 年, 孟德尔回到圣托马斯修道院
        \end{itemize}
    \column{0.38\textwidth}
    \begin{figure}
        \includegraphics{biostat-chisq.images/Franz_Unger.jpg}
        \caption{Franz Unger, 1800--1870}
    \end{figure}
\end{columns}

\note{

由修道院出资, 继续他的科学研究

在昂格尔的《植物世界史的尝试》（1852年）一书中, 他用了一章来讨论植物的进化问题

Attempt of a History of the Plant World

}

---

\begin{figure}
    \begin{minipage}[b]{.28\linewidth}
        \includegraphics{biostat-chisq.images/Gregor_Mendel_with_cross.jpg}
    \end{minipage}
    \hfill
    \begin{minipage}[b]{.68\linewidth}
        \includegraphics{biostat-chisq.images/Mendelovo_muzeum.jpg}
    \end{minipage}
    \caption{天主教 奥古斯丁会 圣托马斯修道院}
\end{figure}

\note{

修道院的院长, 同时也是气象学家、数学家、奥古斯丁修士. 

孟德尔博物馆是在一些组织的国际合作下于2002年建立的, 自2007年起是捷克共和国布尔诺的马萨里克大学的一个机构. 

从1856年到1863年, 他进行了8年的豌豆杂交实验, 这片绿地传说是孟德尔种豌豆的地方

略提下 自然神学

}

## 孟德尔的论文

## 颗粒遗传学家对孟德尔结果的评价

\note{

孟德尔的研究支持了遗传的颗粒说, 他并且把研究结果送给提出颗粒说的耐格里. 但是耐格里对孟德尔的发现不予重视,
因为他认为这些发现是 "依靠经验的而不是依靠理智的".

1867年, 他取代纳普成为修道院的院长. 

1868年他被提升为住持后, 他的科学工作基本结束, 因为孟德尔被行政责任压得喘不过气来, 
特别是与文官政府就其试图对宗教机构征收特别税而发生争执. 

他死后, 继任的修道院院长烧掉了孟德尔收藏的所有文件, 以标志着税收纠纷的结束. 

}

## 孟德尔结果的重新发现

## 对孟德尔结果的统计分析

## Fisher 的质疑

## 对统计结果的重新统计

# 频数统计

## 卡方分布

## Gamma 分布

## 超几何分布

## 泊松分布

## 分布与检验

* $\chi^2$ 分布, *t* 分布, *F* 分布
    * https://www.youtube.com/watch?v=oI3hZJqXJuc
* 抽样
    *  https://www.youtube.com/watch?v=XLCWeSVzHUU

* SD & SE
    *  https://www.youtube.com/watch?v=A82brFpdr9g
* $P$ 值
    * https://www.youtube.com/watch?v=5Z9OIYA8He8
    * https://www.youtube.com/watch?v=bsZGt-caXO4
* 置信区间 (Confidence Interval)
    * https://www.youtube.com/watch?v=TqOeMYtOc1w
* FDR
    * https://www.youtube.com/watch?v=K8LQSvtjcEo

## 统计方法

* 线性回归与最小二乘法
    *  https://www.youtube.com/watch?v=PaFPbb66DxQ
* $R^2$ 值
    * https://www.youtube.com/watch?v=2AQKmw14mHM
* 主成分分析
    * https://www.youtube.com/watch?v=_UVHneBUBW0
* 聚类


# 总结

---

* 孟德尔的生平

* 

* KM 曲线是最常用的对生存函数的估计
