# Ron Mashrouteh - June 2014
# Reproducible Research - Peer assignment 1

# loading downloaded file
ds <- read.csv("~/activity.csv")

# creating my dataset (myds) to get setps and dates without NA
myds <- subset(ds, na.rm=TRUE, steps!=0, select=c(steps, date, interval))
# globally declare myds so I don't have to keep typing myds$....
attach(myds)


# mean total number of steps taken
mean(steps, na.rm=TRUE)

# mean and median total number of steps per day
perdaymean <- aggregate(list(steps=steps), na.rm=TRUE , list(dates = date), mean)
perdaymedian <- aggregate(list(steps=steps), na.rm=TRUE , list(date = date), median)

#histogram graph - steps taken per dat
hist(steps, breaks=100, main="Histogram Graph - Steps", ylab="Date", xlab="steps")

# Start preparing for histogram graph of 5 minute interval
# minimum number of steps
mi <- min(interval)
# maximum number of steps
mx <- max(interval)


#selecting number of bins or columns in Histogram graph defininf size of each bins / column in the graph

perdayavg <- aggregate(list(steps = steps), na.rm=TRUE , list(interval = interval), mean)


plot(perdayavg, type = "l", xlim=c(mi, mx), lwd = 2, main="Time Interval", ylab="Avg. steps all day",
     xlab="5-minute interval", col="blue")


MaxVal_avgsteps <- max(perdayavg$steps)
InterVal <- subset(perdayavg$interval, perdayavg$steps == MaxVal_avgsteps)



summary(ds)


gd <- levels(factor(ds$step))


M1<-length(ds$step[ds$step =="NA"])

sum(ds$steps, na.rm=TRUE)


Steps <- c(ds$steps, na.rm=TRUE)


max(ds$steps, na.rm=TRUE)
mean(ds$steps, na.rm=TRUE)
median(ds$steps, na.rm=TRUE)

summary(ds$steps, na.rm=TRUE)
