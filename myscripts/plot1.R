data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
data$Date = as.Date(strptime(data$Date, format = "%d/%m/%Y"))
data2 <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
data2$Global_active_power[data2$Global_active_power == "?"] = NA
data3 <- data2[complete.cases(data2),]

f <- data3$Global_active_power
hist(as.numeric(levels(f))[f],  col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()