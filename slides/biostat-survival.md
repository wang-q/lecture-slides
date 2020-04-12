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

Let's start by creating some basic data. We have 10 patients "at risk", with a follow-up of 10 months. Every participant gets an identical treatment.




```r
patientID <- c("John", "Jess", "Ann", "Mary", "Frank", "Steven", "Andy", "Elizabeth", "Joe", "Kate")
followup <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
eventtype <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
scenario <- c("A", "A", "A", "A", "A", "A", "A", "A", "A", "A")
toy_dataset <- data.frame(patientID, followup, eventtype, scenario)
colnames(toy_dataset) <- c("PatientID", "Followup", "Eventtype", "Scenario")
```

If we take a closer look at the 'Follow-up' and 'Eventtype' columns:

* Follow-up time can be any time-interval: days, months, years.
* Event type of 1 equals an event (for example death in an overall survival study)
* Event type of 0 equals a right-censored event.

In this first example, there are no censored events.


```r
toy_dataset <- data.frame(patientID, followup, eventtype, scenario)
colnames(toy_dataset) <- colnames
toy_dataset
```

```
   PatientID Followup Eventtype Scenario
1       John        1         1        A
2       Jess        2         1        A
3        Ann        3         1        A
4       Mary        4         1        A
5      Frank        5         1        A
6     Steven        6         1        A
7       Andy        7         1        A
8  Elizabeth        8         1        A
9        Joe        9         1        A
10      Kate       10         1        A
```


```r
# We can plot this table with the `survival` and `survminer` packages. First, we define what the time column is (`toy_dataset$Followup`) and the event column is (`toy_dataset$Eventtype`). Afterwards, we can fit the Kaplan Meier curve to this data (`survfit(surv_object ~ Scenario)`). Note that in this simulation we are showing multiple scenarios, so we are fitting to `toy_dataset$Scenario`, but this can also be for example a treatment column.
surv_object <- Surv(time = toy_dataset$Followup , event = toy_dataset$Eventtype)
fit1 <- survfit(surv_object ~ Scenario, data = toy_dataset)
j <- ggsurvplot(fit1, data = toy_dataset, xlim = c(0,11), conf.int = FALSE,  risk.table = "nrisk_cumcensor", legend.title = " ", tables.theme = theme_cleantable(), break.time.by = 2,risk.table.fontsize = 4 ,risk.table.height = 0.20, censor.shape = c("|"), censor.size = 6)
```

Every month, 1 participant has an event (in an overall survival study this would be death). Every time an event occurs, the survival probability drops by 0.1 of the remaining curve (= #events / #at risk = $\frac{1}{10}$ of the remaining curve at month 1, $\frac{1}{9}$ of the remaining curve at month 2 and so on):


```r
j$plot <- j$plot +
  scale_x_continuous(breaks = sort(c(seq(0, 10, 1)))) +
  scale_y_continuous(breaks = sort(c(seq(0, 1, 0.1))))
j
```

![plot of chunk basicplot](figure/basicplot-1.png)



