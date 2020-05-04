#Getting to the correct directory with the dataset
getwd()
setwd("./dataset")

#read in the data
plotdata <- read.table("household_power_consumption.txt", header=TRUE,  sep=";", na.strings = "?", stringsAsFactors = FALSE, 
                       dec=".")
plotdatasub <- plotdata[plotdata$Date %in% c("1/2/2007", "2/2/2007"),]
time_date <- paste(plotdatasub$Date, plotdatasub$Time, sep="")
time <- strptime(time_date, "%d/%m/%Y%H:%M:%S")
GAP <- as.numeric(plotdatasub$Global_active_power)
png("plot2.png", height=480, width=480)
plot(time, GAP, type = "l", xlab="", ylab = "Global Active Power(kws)")
dev.off()
