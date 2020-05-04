#Getting to the correct directory with the dataset
getwd()
setwd("./dataset")

#read in the data
plotdata <- read.table("household_power_consumption.txt", header=TRUE,  sep=";", na.strings = "?", stringsAsFactors = FALSE, 
                       dec=".")
plotdatasub <- plotdata[plotdata$Date %in% c("1/2/2007", "2/2/2007"),]

png("plot1.png", height = 480, width = 480)
hist(plotdatasub$Global_active_power, xlab = "Global Active Power(kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()
