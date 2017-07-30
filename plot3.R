## Set locale to en_US.UTF-8 in order to get correct x-axis values
Sys.setlocale("LC_TIME", "en_US.UTF-8")

## Load the input values
## Assumptions: the household_power_consumption.txt file is available in the current working directory and the whole file is loaded
filePath <- file.path(".", "household_power_consumption.txt")
powConsData <- read.table(filePath, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)
powConsData <- subset(powConsData, powConsData$Date == "2/2/2007" | powConsData$Date == "1/2/2007")
powConsData$DateTime <- strptime(paste(powConsData$Date, powConsData$Time), "%d/%m/%Y %H:%M:%S")
powConsData$Sub_metering_1 <- as.numeric(powConsData$Sub_metering_1)
powConsData$Sub_metering_2 <- as.numeric(powConsData$Sub_metering_2)
powConsData$Sub_metering_3 <- as.numeric(powConsData$Sub_metering_3)

## Create the plot
png("plot3.png", width = 480, height = 480)
with(powConsData, plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(powConsData, lines(DateTime, Sub_metering_1, col = "black"))
with(powConsData, lines(DateTime, Sub_metering_2, col = "red"))
with(powConsData, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()