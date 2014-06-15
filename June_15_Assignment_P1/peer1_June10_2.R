# loading downloaded file
Nwds <- read.csv("~/activity.csv")
View(Nwds)

# Total number of NA
NAs <- length(Nwds$step[Nwds$step =="NA"])
y <- NAs

#Nwds <- subset(Nwds, select=c(steps, date, interval))
#View(Nwds)


Nwds[is.na(Nwds)] <- 0
View(Nwds)


Newds <- read.csv("~/activity.csv")
View(Newds)

remv <- na.omit(Newds)
View(remv)

perdayavg_mean_noNA <- aggregate(list(steps = remv$steps), list(interval = remv$interval), mean)
perdayavg_median_noNA <- aggregate(list(steps = remv$steps), list(interval = remv$interval), median)

hist(perdayavg_mean_noNA$steps, breaks=100, main="Histogram Graph After NA removal- Steps", ylab="Interval", xlab="steps")
hist(perdayavg_median_noNA$steps, breaks=10, main="Histogram Graph After NA removal- Steps", ylab="Interval", xlab="steps")
