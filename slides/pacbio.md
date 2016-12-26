---
title: DNA 测序技术的发展
subtitle: 三代测序的优势与应用
author: "王强"
institute: "南京大学生命科学学院"
date: \today{}
toc: true
...

# 一代: Sanger 法电泳测序

---

![Frederick Sanger](pacbio.images/Frederick_Sanger.jpg)

\note{

弗雷德里克·桑格

}

---

* 1955 年, 第一个蛋白质测序, 胰岛素
* 1958 年, 诺贝尔化学奖
* 1975 年, 双脱氧法, ddNTP
* 1977 年, 第一个基因组, $\phi$--X174 噬菌体
* 1980 年, 再度获得诺贝尔化学奖

\note{

我国人工合成牛胰岛素

70 年代早期, 基于双向层析的 DNA 测序

}

---

人类基因组计划

* 1985 年, 美国能源部正式提出人类基因组测序.
* 1990 年, 正式启动人类基因组测序.

---

![聚丙烯酰胺凝胶电泳](pacbio.images/Sanger-gel.jpg)

---

![毛细管电泳图谱](ch-24.images/image12.jpg)

---

![ABI 3730XL](pacbio.images/3730xl.jpg)

---

![模板与测序室](ch-24.images/image11.jpg)

---

![HGP sequencing strategy](ch-24.images/image101.jpg)

---

![贡献](ch-24.images/image14.jpg)

---

\begin{figure}
    \begin{minipage}[b]{.48\linewidth}
        \includegraphics{ch-24.images/image15.jpg}
    \end{minipage}
    \hfill
    \begin{minipage}[b]{.48\linewidth}
        \includegraphics{ch-24.images/image16.jpg}
    \end{minipage}
    \caption{J. Craig Venter (文特尔)}
\end{figure}

---

![Celera assembly strategy](ch-24.images/image102.jpg)

\note{

Then order scaffolds on the chromosomes using the HGP clone map and
other publicly available maps.

}

---

![Celera stocks](ch-24.images/image17.jpg)

---

\begin{figure}
    \begin{minipage}[b]{.48\linewidth}
        \includegraphics{ch-24.images/image18.jpg}
        \subcaption{Nature}
    \end{minipage}
    \hfill
    \begin{minipage}[b]{.48\linewidth}
        \includegraphics{ch-24.images/image19.jpg}
        \subcaption{Science}
    \end{minipage}
    \caption{基因组草图, 2001}
\end{figure}

# 二代: (短读长的) 高通量测序

## Personal Genomes

\begin{columns}[onlytextwidth]
    \column{0.5\textwidth}
        \begin{itemize}
            \item Craig Venter
            \item James Watson
            \item Stephen Quake
            \item George Church
            \item Marjolein Kriek
            \item Hermann Hauser
            \item Han Chinese
            \item Seong-Jin Kim
            \item Korean AK1
            \item Yoruban African NA18507
        \end{itemize}
    \column{0.5\textwidth}
        \begin{itemize}
            \item 14 others sequenced by Complete Genomics
            \item Unknown number sequenced by Knome
            \item 6 genomes sequenced at high depth by the 1000 Genomes Project
            \item 180 genomes sequenced at low coverage by the 1000 Genomes Project
            \item Two acute myeloid leukemia patients
        \end{itemize}
\end{columns}

\note{

三十亿美元

三千万美元

People Who’ve Had Their Genomes Sequenced

Stephen Quake, A Stanford engineer

Marjolein Kriek, a clinical geneticist at LUMC

Dr. Hauser, Partner, Amadeus Capital Partners Ltd, is the first consumer
to purchase Illumina's individual genome sequencing service.

}

---

![测序能力的增长](ch-24.images/image24.jpg)

---

![Illumina HiSeq](ch-24.images/image25.jpg)

---

![千个基因组计划](ch-24.images/image28.jpg)

\note{

http://www.ebiotrade.com/newsf/2010-3/2010315172205631.htm

}

---

![爆发性增长的数据量](ch-24.images/image32.jpg)

\note{

Remember when you used to think that GenBank was ‘big’? The NCBI
Sequence Read Archive (SRA) now dominates the NCBI FTP site and accounts
for 1.14 Petabytes of storage (perhaps explaining why it is to be phased
out). In comparison, the Genome and GenBank directories on the FTP site
account for less than a tenth of one percent of all sequences. Sequences
from ‘traditional’ sequencing methods now contribute less and less to
genome projects. The so called ‘short’ reads – which are getting longer
all the time –  dominate the scene.

}

---

![比摩尔定律更快](ch-24.images/image27.jpg)

\note{

Intel Core i7-2700K. 	October 23, 2011

}

---

![HiSeq X](pacbio.images/HiSeqX.png)

100 GB $\approx$ 33X Human genome $\approx$ 10,000 CNY

\note{

足够拼装出人类个体基因组了

刚推出时有限制, 只能用于人类基因组测序. 现在已经取消.

}

---

> 别再升级通量了, 测序仪卖不出去了.

> CEO, 侬脑子哇特了?


\note{

也有不高兴的

}

## 其它二代方法

* Ion Torrent
* 454
* SOLiD

\note{

边合成边测序, Illumina

焦磷酸测序

边连接边测序, SOLiD

}

---

在最近与彭博社的一次采访中, 奥巴马透露了自己想要进入科技风投界的想法.

> 我与硅谷以及风投的交流, 极大地满足了我对科学和组织的兴趣...
> 你可以只花几千美元, 而不是十万美元, 就可以把个人的基因绘制出来.
> 你可以有能力辨识自己的 (基因) 倾向, 去生产对你这个个体而言最有效的药物.
> 这只是可以让我坐下来, 与别人谈几个小时的科技创业的例子之一.

\note{

乐观派

感觉要进入共产主义社会了

}

# 三代: (长读长的) 单分子测序

## 二代的缺点

* 建库过程中扩增带来的偏性
* 高 GC 区域的覆盖度与准确性
* \alert{读长短}
    * 转座子 (transposons and retrotransposons)
    * 片段重复 (tandom or segment duplications)
    * 一般不超过 5 kbp

## 商业化服务

* \small\url{http://allseq.com/providers/}
* \small\url{http://www.pacb.com/products-and-services/service-providers/}

---

![商业化服务列表](pacbio.images/provider-list.png)

---

![2015 年 全球装机约 160 台](pacbio.images/RSII-install-base.png)

\note{

Sequel 的全球预购已达50余台

}

---

\begin{figure}
    \includegraphics{pacbio.images/frasergen.png}
\end{figure}

武汉菲沙基因信息有限公司联合美国 Pacific Biosciences 公司在武汉东湖综合保税区共建高通量测序中心, 引进了不少于 6 台
Sequel 三代测序系统, 将建成大规模的三代测序中心.

##  RS II 与 Sequel 对比

|           | RS II (P6-C4) |  Sequel  |
|:----------|:-------------:|:--------:|
| 运行时间   |    240 min    | 240 min  |
| 输出量     |   0.5-1 Gb    | 5-10 Gb  |
| 每日输出量  |     2 Gb      |  20 Gb   |
| 平均读长   |   10-15 kb    | 10-15 kb |
| 单程准确率  |     ~86%      |   ~86%   |
| 30X 准确率 |   >99.999%    | >99.999% |
| Reads 数  |      50k      |   500k   |
| 平台价格   |     $700k     |  $350k   |
| 运行成本   |     $400      |   $850   |

\note{

现在主流的两种 PacBio 平台

P 指得是聚合酶, C 是化学试剂.

\url{http://allseq.com/knowledge-bank/sequencing-platforms/pacific-biosciences/}

}

## 适用范围

|            |    Sequel     |          原因          |
|:-----------|:-------------:|:---------------------:|
| 人类全基因组 |  Ok/**Good**  | 贵; 利于鉴定结构变异及组装 |
| 小基因组    |   **Good**    |  长读长, 只需要较低的通量  |
| 靶向测序    |   **Good**    |  长读长, 只需要较低的通量  |
| 转录组      | Poor/**Good** |  贵; 可得到全长的转录本   |
| 宏基因组    |    Poor/Ok    |  贵; 利于 de novo 组装  |
| 外显子组    |     Poor      | 贵; 长读长对外显子没有用处 |
| 表达谱      |     Poor      |           贵           |
| ChIP-Seq   |     Poor      |           贵           |

\note{

人类全基因组: 低偏向, 长读长,

Targeted 靶向

RNA Profiling 表达谱

ChIP-Seq 染色质免疫沉淀接高通量测序

}

## 信息学的问题

SMRT Analysis Software 包括了一些第三方程序:

* 编程语言
    * Java 7
    * Mono 3
    * Perl 5.8
    * Python 2.7
    * Scala 2.9
* 平台
    * Tomcat 7.0.23
    * MySQL 5.1.73
    * Docutils
* 生物信息学工具
    * Celera Assembler 8.1
    * GMAP
    * HMMER 3.1
    * SAMtools

\note{

在版本更替过程中, 出现过多个程序, 有些已经死了, 有的正在死.

}


##  其它三代方法

* Helicos, 读长过短, 已经破产
* \alert{Oxford Nanopore}

---

\begin{figure}
    \includegraphics{pacbio.images/github-wang-q.png}
    \caption{\small\url{https://github.com/wang-q}}
\end{figure}
