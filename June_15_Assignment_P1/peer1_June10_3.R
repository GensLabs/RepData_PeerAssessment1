# loading downloaded file
lastpart <- read.csv("~/activity.csv")
View(lastpart)

# Total number of NA
NAs <- length(lastpart$step[lastpart$step =="NA"])
shwval <- NAs

lastpart[is.na(lastpart)] <- 0
View(lastpart)


lastpart$weekday = weekdays(as.Date(lastpart$date, format = "%Y-%m-%d"))
lastpart$weekday.type = factor(ifelse(lastpart$weekday == "Sunday" | lastpart$weekday == 
                                             "Saturday", "weekend", "weekday"), levels = c("weekday", "weekend"))


lastpart.weekdays = lastpart[lastpart$weekday.type == "weekday", ]
lastpart.weekend = lastpart[lastpart$weekday.type == "weekend", ]
avg.steps.per.interval.weekdays = sapply(split(lastpart.weekdays$steps, lastpart.weekdays$interval), mean)
avg.steps.per.interval.weekend = sapply(split(lastpart.weekend$steps, lastpart.weekend$interval), mean)


DoPlot = function() {
    par(mfrow = c(2, 1), mar = c(4, 5, 2, 2))
    plot(avg.steps.per.interval.weekend, type = "l", yaxt = "n", ylim = c(0, 250), xlim = c(0, 300), main = "weekend", ylab = "", xlab = "Interval")
    axis(side = 4, at = seq(0, 250, 50), labels = seq(0, 250, 50))
    plot(avg.steps.per.interval.weekdays, type = "l", ylim = c(0, 250), xlim = c(0, 300), main = "weekday", ylab = "", xlab = "Interval")
    par(mfrow = c(1, 1), mar = c(3, 2, 2, 2))
    mtext(text = "Number of steps", side = 2)
    par(mar = c(5, 5, 5, 2))
}

DoPlot()
