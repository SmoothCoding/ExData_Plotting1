# Read in the data
setwd("E:/Dokumente/Projects/DataScience/Coursera Specialization/04 - Exploratory DA/Project 1/myscripts")
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# Convert the data column to a Date format
data$Date = as.Date(strptime(data$Date, format = "%d/%m/%Y"))

# Select relevant dates and add the weekday
data2 <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
data2$wday <- wday(data2$Date, label = TRUE)

# Substitute ? by NA and take only complete cases into account
data2$Sub_metering_1[data2$Sub_metering_1 == "?"] = NA
data2$Sub_metering_2[data2$Sub_metering_2 == "?"] = NA
data2$Sub_metering_3[data2$Sub_metering_3 == "?"] = NA
data3 <- data2[complete.cases(data2),]
f <- data3$Sub_metering_1
f2 <- data3$Sub_metering_2
f3 <- data3$Sub_metering_3

# Plot the data
png(file = "plot3.png", width = 480, height = 480)
plot(as.numeric(levels(f))[f], type = "l", xaxt="n", ylab = "Energy sub metering")
lines(as.numeric(levels(f2))[f2], col="red")
lines(f3, col="blue")

firstThursPos <- which(data3$wday == "Thurs")[1]
firstFriPos <- which(data3$wday == "Fri")[1]
firstSatPos <- length(data3$wday) + 1
axis(1,at=c(firstThursPos, firstFriPos, firstSatPos),labels=c("Thu","Fri", "Sat"), las=1)


legend(2100, 40, c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("black", "red", "blue"), pch = c("-", "-", "-"), merge = TRUE, bg = "gray90")

dev.off()

