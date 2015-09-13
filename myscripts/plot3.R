data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
data$Date = as.Date(strptime(data$Date, format = "%d/%m/%Y"))
data2 <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
data2$Sub_metering_1[data2$Sub_metering_1 == "?"] = NA
data2$Sub_metering_2[data2$Sub_metering_2 == "?"] = NA
data2$Sub_metering_3[data2$Sub_metering_3 == "?"] = NA
data3 <- data2[complete.cases(data2),]
f <- data3$Sub_metering_1
f2 <- data3$Sub_metering_2
f3 <- data3$Sub_metering_3
png(file = "plot3.png", width = 480, height = 480)
plot(as.numeric(levels(f))[f], type = "l", xaxt="n", ylab = "Energy sub metering")
lines(as.numeric(levels(f2))[f2], col="red")
lines(f3, col="blue")
axis(1,at=c(0,1441,2881),labels=c("Thu","Fri", "Sat"), las=3)

legend(2200, 40, c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("black", "red", "blue"), pch = c("-", "-", "-"), merge = TRUE, bg = "gray90")



dev.off()
