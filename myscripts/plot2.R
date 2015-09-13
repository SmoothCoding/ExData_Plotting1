data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
data$Date = as.Date(strptime(data$Date, format = "%d/%m/%Y"))
data2 <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
data2$Global_active_power[data2$Global_active_power == "?"] = NA
data3 <- data2[complete.cases(data2),]
f <- data3$Global_active_power
plot(as.numeric(levels(f))[f], type = "l", xaxt="n", xlab = "",ylab = "Global Active Power (kilowatts)")
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri", "Sat"), las=3)
#axis(1, at = seq_along(data3$weekday), labels = data3$weekday, las = 3)
dev.copy(png, file = "plot2.png")
dev.off()
