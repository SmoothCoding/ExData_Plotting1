library(lubridate)

# Read in the data
setwd("E:/Dokumente/Projects/DataScience/Coursera Specialization/04 - Exploratory DA/Project 1/myscripts")
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# Convert the data column to a Date format
data$Date = as.Date(strptime(data$Date, format = "%d/%m/%Y"))

# Select relevant dates and add the weekday
data2 <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
data2$wday <- wday(data2$Date, label = TRUE)
head(data2)

# Substitute ? by NA and take only complete cases into account
data2$Global_active_power[data2$Global_active_power == "?"] = NA
data3 <- data2[complete.cases(data2),]
f <- as.numeric(levels(data3$Global_active_power))[data3$Global_active_power]

# Plot the data
plot(f, type = "l", xaxt="n", xlab = "",ylab = "Global Active Power (kilowatts)")
firstThursPos <- which(data3$wday == "Thurs")[1]
firstFriPos <- which(data3$wday == "Fri")[1]
firstSatPos <- length(data3$wday) + 1
axis(1,at=c(firstThursPos, firstFriPos, firstSatPos),labels=c("Thu","Fri", "Sat"), las=1)

# Generate png file
dev.copy(png, file = "plot2.png")
dev.off()
