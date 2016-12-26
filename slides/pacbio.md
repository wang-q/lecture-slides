---
title: DNA 测序技术的发展
subtitle: 三代测序的原理与应用
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

足够在有几乎完美的参考基因组下, 拼装出人类个体基因组了.

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
    * 一般不超过 5 kbp, 但就是二代跨越不了的障碍

## 二代的对策

* Pair end (short jump)
* Mate pair (long jump)
* 10X Genomics

\note{

10 kbp, 复杂基因组拼接, 跨越重复区, 检出结构变异.

}

## 三代的优势

\center\Huge{读长 \alert{长!}}

## 三代的原理

几个名词

* \Large\alert{PacBio}: \normalsize\underline{Pac}ific \underline{Bio}sciences
* SMRT: \underline{S}ingle \underline{M}olecule \underline{R}eal \underline{T}ime Sequencing
* ZMW: \underline{Z}ero-\underline{m}ode \underline{w}aveguide, 20 zl (zeptoliters, $10^{-21}$)

\note{

只介绍最有希望的方法, PacBio

单分子实时测序

20 普托升, 反应体系

waveguide, 光 波导管

}

---

![建库与模板\footnote{\fullcite{rhoads2015}}](pacbio.images/SMRTbell-template.jpg)

\note{

SMRTbell template

Hairpin adaptors (green) are ligated to the end of a double-stranded DNA molecule (yellow and
purple), forming a closed circle. The polymerase (gray) is anchored to the bottom of a ZMW and
incorporates bases into the read strand (orange).

}

---

![单分子荧光测序](pacbio.images/Sequencing-via-light-pulses.jpg)

\note{

Sequencing via light pulses

A. A SMRTbell (gray) diffuses into a ZMW, and the adaptor binds to a polymerase immobilized at the
bottom.

B. Each of the four nucleotides is labeled with a different fluorescent dye (indicated in red,
yellow, green, and blue, respectively for G, C, T, and A) so that they have distinct emission
spectrums. As a nucleotide is held in the detection volume by the polymerase, a light pulse is
produced that identifies the base.

(1) A fluorescently-labeled nucleotide associates with the template in the active site of the
polymerase.

(2) The fluorescence output of the color corresponding to the incorporated base (yellow for base C
as an example here) is elevated.

(3) The dye-linker-pyrophosphate product is cleaved from the nucleotide and diffuses out of the ZMW,
ending the fluorescence pulse.

(4) The polymerase translocates to the next position.

(5) The next nucleotide associates with the template in the active site of the polymerase,
initiating the next fluorescence pulse, which corresponds to base A here.

}

---

![一个 SMRT cell](pacbio.images/SMRT-cell.jpg)

\note{

Each SMRT cell contains 150,000 ZMWs. Approximately 35,000–75,000 of these wells produce a read in a
run lasting 0.5–4 h, resulting in 0.5–1 Gb of sequence. The image is adapted with permission from
Pacific Biosciences . ZMW, zero-mode waveguide.

}

---

![读长分布](pacbio.images/read-length-distribution.jpg)

\note{

PacBio RS II read length distribution using P6-C4 chemistry

Data are based on a 20 kb size-selected E. coli library using a 4-h movie. Each SMRT cell produces
0.5–1 billion bases. The P6-C4 chemistry is currently the most advanced sequencing chemistry offered
by PacBio.

}

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

现在主流的两种 PacBio 平台. Sequel 是今年刚出来的.

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

Targeted 靶向, 如 HLA 分型 (人类白细胞抗原, Human Leukocyte Antigen)

RNA Profiling 表达谱

ChIP-Seq 染色质免疫沉淀接高通量测序

}

## 信息学的问题  {.shrink}

二代所用的算法和策略很多没法在三代上使用, 只能重新开发.

SMRT Analysis Software 包括了大量自有和第三方程序:

* 编程语言
    * C/C++
    * Bash
    * Java, Scala
    * Mono 3 (C#, VB.net)
    * Perl 5.8, Python 2.7
* 平台: Tomcat, MySQL
* 文件格式 HDF5 $\rightarrow$ BAM
* Celera Assembler, GMAP, HMMER, SAMtools 等

\note{

快速迭代

在版本更替过程中, 出现过多个程序, 有些已经死了, 有的正在死.

安装也比较麻烦.

}

## 商业化服务

* \small\url{http://allseq.com/providers/}
* \small\url{http://www.pacb.com/products-and-services/service-providers/}

---

![商业化服务列表](pacbio.images/provider-list.png)

---

![2015 年 全球装机约 160 台](pacbio.images/RSII-install-base.png)

\note{

Sequel 的全球预购已达 50 余台, 很多客户都在等

}

---

\begin{figure}
    \includegraphics{pacbio.images/frasergen.png}
\end{figure}

武汉菲沙基因信息有限公司联合美国 Pacific Biosciences 公司在武汉东湖综合保税区共建高通量测序中心, 引进了不少于 6 台
Sequel 三代测序系统, 将建成大规模的三代测序中心.

\note{

诺和致源好像也在买

5000 块 1 G

}

##  其它三代方法

* Helicos, 读长过短, 已经破产
* \alert{Oxford Nanopore}

\note{

Helicos, 也是基于单分子荧光技术

}

---

\begin{figure}
    \includegraphics{pacbio.images/github-wang-q.png}
    \caption{\small\url{https://github.com/wang-q/lecture-slides/blob/master/slides/pacbio.slides.pdf}}
\end{figure}

\note{

没有 .ppt. 从源码编译出来的 .pdf.

}
