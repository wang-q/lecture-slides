---
title: 生物统计原理
subtitle: 孟德尔, 卡方与频数统计
author: "王强"
institute: "南京大学生命科学学院"
date: \today{}
toc: true

---

# 孟德尔的早年生平

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
        \item 昂格尔假设植物细胞内简单元素的组合决定了 \alert{植物的遗传}; 1852 年的著作中讨论了植物的进化问题
        \item 1853 年, 孟德尔完成学业, 回到圣托马斯修道院
        \end{itemize}
    \column{0.38\textwidth}
    \begin{figure}
        \includegraphics{biostat-chisq.images/Franz_Unger.jpg}
        \caption{Franz Unger, 1800--1870}
    \end{figure}
\end{columns}

\note{

由修道院出资, 继续他的科学研究

昂格尔使用显微镜进行植物学研究

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

1853年, 在完成维也纳大学的学业后, 回到了布尔诺的修道院, 并在一所中学得到了一个教职, 他在那里呆了十多年

1867年, 他取代纳普成为修道院的院长.

修道院的院长, 同时也是气象学家、数学家、奥古斯丁修士. 

略提下 自然神学

从1856年到1863年, 他进行了8年的豌豆杂交实验, 这片绿地传说是孟德尔种豌豆的地方

孟德尔博物馆是在一些组织的国际合作下于2002年建立的, 自2007年起是捷克共和国布尔诺的马萨里克大学的一个机构.

}

# 孟德尔的研究

---

* 分离定律
* 自由组合定律

\note{

遗传的第一, 第二定律, 为人所熟知

但孟德尔的研究被世界忽略了三十多年, 这是个悲哀的事实, 可为什么会这样?

}

## 孟德尔的论文

![植物杂交的实验, 1866](biostat-chisq.images/paper_cover.jpg)

\note{


原文是德语的, 我看的是英译本

\url{http://www.bshs.org.uk/bshs-translations/mendel/2016?page=1}

对这篇 45 页的论文, 进行简要的介绍, 整理其中的逻辑路线.

另一个全文翻译, 16 页

\url{https://academic.oup.com/genetics/article/204/2/407/6072056}

}

## 1. Introductory remarks

* 在观赏植物上进行的人工受精时, 同样的杂交形式总是重复出现
* _The Production of Hybrids in the Plant Kingdom_ 记录了很可观的观察结果
* 没有人为杂交体的形成和发展建立一个普遍有效的法则
* 没有实验能够确定, 在杂交后代中, 出现的不同形式的数量
* 本论文回顾了一个为期 8 年的实验

\note{

这里的小节用的都是孟德尔的原文

Introductions

}

## 2. Selection of experimental plants

实验植物必须是

1. 有恒定的差异性状 (traits, characters)
2. 杂交体必须不受外来花粉的影响
3. 杂交体及其后代的生育能力不应有明显地变化

豌豆属充分地满足了这些要求

* 恒定的、容易和明确区分的性状
* 自花受粉
* 开花前受粉
* 容易栽培, 繁殖期相对较短

---

* 从种子商店采购了 34 个豌豆品种, 进行了两年的试验
* 基于性状的稳定性, 去除了一些品种
* 选取 22 个品种, 整个试验期间每年进行栽培

\note{

可能是种子来源地的错误混合

Joy 发表过一篇 PP, 说明了 拟南芥 1001 基因组项目中的种子采样与保存问题

}

## 3. Arrangement and order of the trials

两个植物通过受精结合在一起时:

* 相同的性状会毫无变化地转移到杂交体及其后代身上
* 不同的性状会在杂交体上结合起来, 形成一种新的性状, 通常会在其后代身上发生变化

前者已经被当时的很多实验所证实; 后者是本实验的研究对象

实验总体可以分成与新的杂合性状数量一样多的单项实验

---

豌豆形态:

* 茎的长度和颜色
* 叶子的大小和形状
* 花的位置、颜色和大小
* 花梗的长度
* 豆荚的颜色、形状和大小
* 种子的形状和大小
* 种皮和胚乳的颜色

部分性状不允许进行一定的、明确的区分, 因为区别往往在于 "更多或更少", 而这很难确定, 这样的性状不适合个体试验

\note{

胚乳 并不十分明确, 他用的是蛋白一词, 应该指的是子叶

孟德尔已经察觉到了数量性状与孟德尔性状的区别

}

---

七对性状:

1. 成熟种子的形状. 球形, 圆形, 浅凹陷; 不规则的角, 深皱纹
2. 种子胚乳的颜色. 淡黄色、浅黄色和橙色; 或多或少的浓绿色
3. 种皮颜色. 白色, 花一般为白色; 灰色、灰褐色、皮褐色, 花紫色
4. 成熟豆荚的形状. 简单的拱形; 在种子之间深深收缩
5. 未成熟豆荚的颜色.  浅绿色到深绿色; 鲜艳的黄色
6. 花的位置. 腋生, 即沿茎分布; 顶生, 积聚在茎的末端, 形成一个短的假伞形花序
7. 茎的长度. 6--7 英尺的长茎; 0.75--1.5英尺的短茎

\note{

这些试验必须局限于那些在植物中明确和决定性地出现的性状

2 种皮半透明, 可以识别出胚乳的颜色

5 茎杆、叶脉和花萼的颜色也是对应的.

7 选取了极端差异的

}

---


## 颗粒遗传学家对孟德尔结果的评价

\note{

孟德尔的研究支持了遗传的颗粒说, 他并且把研究结果送给提出颗粒说的耐格里. 但是耐格里对孟德尔的发现不予重视,
因为他认为这些发现是 "依靠经验的而不是依靠理智的".

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
