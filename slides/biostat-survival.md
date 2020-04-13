---
title: 生物统计原理
author: "王强"
institute: "南京大学生命科学学院"
date: \today{}
toc: true

---






# 生存分析

## 生存数据

对于癌症

* Overall survival (OS)
  * Time from surgery to death
* Progression-free survival (PFS)
  * Time from start of treatment to progression, Time to progression (TTP)
  * Time from response to recurrence

# Kaplan--Meier plot

## Basic Kaplan--Meier plot

Let's start by creating some basic data. We have 10 patients "at risk", with a follow-up of 10
months. Every participant gets an identical treatment.



|PatientID | Followup| Eventtype|Scenario |
|:---------|--------:|---------:|:--------|
|John      |        1|         1|A        |
|Jess      |        2|         1|A        |
|Ann       |        3|         1|A        |
|Mary      |        4|         1|A        |
|Frank     |        5|         1|A        |
|Steven    |        6|         1|A        |
|Andy      |        7|         1|A        |
|Elizabeth |        8|         1|A        |
|Joe       |        9|         1|A        |
|Kate      |       10|         1|A        |

\note{

If we take a closer look at the 'Follow-up' and 'Eventtype' columns:

* Follow-up time can be any time-interval: days, months, years.
* Event type of 1 equals an event (for example death in an overall survival study)
* Event type of 0 equals a right-censored event.

}

In this first example, there are no censored events.

---

Every month, 1 participant has an event (in an overall survival study this would be death). Every
time an event occurs, the survival probability drops by 0.1 of the remaining curve (= #events / #at
risk = $\frac{1}{10}$ of the remaining curve at month 1, $\frac{1}{9}$ of the remaining curve at
month 2 and so on):

![plot of chunk basicplot](figure/basicplot-1.png)

## Kaplan Meier plot with censored data


|PatientID | Followup| Eventtype|Scenario |
|:---------|--------:|---------:|:--------|
|John      |      1.0|         1|A        |
|Jess      |      2.0|         1|A        |
|Ann       |      3.0|         0|A        |
|Mary      |      4.0|         0|A        |
|Frank     |      5.0|         1|A        |
|Steven    |      6.0|         1|A        |
|Andy      |      6.2|         1|A        |
|Elizabeth |      8.0|         0|A        |
|Joe       |      9.0|         1|A        |
|Kate      |     10.0|         0|A        |

---

![plot of chunk basicplot2](figure/basicplot2-1.png)


## Importance of confidence intervals

Especially when there are very few patients at risk, the impact of a censored event can have a big
impact on the appearance of the KM curve.

In the previous plot, it seems that the survival curve reaches a plateau at 0.2 surival probability
(curve A). If we would swap the censored status between Joe and Kate (participants 9 and 10), the KM
curve changes drastically and drops to 0 at the end of the study period. In this scenario (curve B),
all participants either had an event or were censored.



```
   PatientID Followup Eventtype Scenario
9        Joe        9         1        A
10      Kate       10         0        A
   PatientID Followup Eventtype Scenario
19       Joe        9         0        B
20      Kate       10         1        B
```

---

![plot of chunk basicplot3](figure/basicplot3-1.png)
