# Read in the data
setwd("E:/Dokumente/Projects/DataScience/Coursera Specialization/04 - Exploratory DA/Project 1/myscripts")
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# Format dates
data$Date = as.Date(strptime(data$Date, format = "%d/%m/%Y"))
data2 <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

# Take only complete cases into account
data2$Global_active_power[data2$Global_active_power == "?"] = NA
data3 <- data2[complete.cases(data2),]
f <- data3$Global_active_power

# Plot the histogram
hist(as.numeric(levels(f))[f],  col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Generate png
dev.copy(png, file = "plot1.png")
dev.off()