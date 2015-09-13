data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
data$Date = as.Date(strptime(data$Date, format = "%d/%m/%Y"))
data2 <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
data2$Sub_metering_1[data2$Sub_metering_1 == "?"] = NA
data2$Sub_metering_2[data2$Sub_metering_2 == "?"] = NA
data2$Sub_metering_3[data2$Sub_metering_3 == "?"] = NA
data2$Global_active_power[data2$Global_active_power == "?"] = NA
data3 <- data2[complete.cases(data2),]
f <- data3$Global_active_power
volt <- data3$Voltage
globreact <- data3$Global_reactive_power
f1 <- data3$Sub_metering_1
f2 <- data3$Sub_metering_2
f3 <- data3$Sub_metering_3
par(mfrow = c(2,2))

#hist(as.numeric(levels(f))[f],  col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
plot(as.numeric(levels(f))[f], type = "l", xaxt="nd", xlab = "",ylab = "Global Active Power")
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri", "Sat"), las=1)
plot(as.numeric(levels(volt))[volt], type = "l", xaxt="n", xlab = "",ylab = "Global Active Power")
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri", "Sat"), las=1)
plot(as.numeric(levels(f1))[f1], type = "l", xaxt="n", ylab = "Energy sub metering")
lines(as.numeric(levels(f2))[f2], col="red")
lines(f3, col="blue")
axis(1,at=c(0,1441,2881),labels=c("Thu","Fri", "Sat"), las=1)
legend(1300, 40, c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("black", "red", "blue"), pch = c("-", "-", "-"), merge = TRUE, bg = "transparent")
plot(as.numeric(levels(globreact))[globreact], type = "l", xaxt="n", xlab = "",ylab = "Global Active Power")
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri", "Sat"), las=1)

dev.copy(png, file = "plot4.png")
dev.off()