## Set locale to en_US.UTF-8 in order to get correct x-axis values
Sys.setlocale("LC_TIME", "en_US.UTF-8")

## Load the input values
## Assumptions: the household_power_consumption.txt file is available in the current working directory and the whole file is loaded
filePath <- file.path(".", "household_power_consumption.txt")
powConsData <- read.table(filePath, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)
powConsData <- subset(powConsData, powConsData$Date == "2/2/2007" | powConsData$Date == "1/2/2007")
powConsData$DateTime <- strptime(paste(powConsData$Date, powConsData$Time), "%d/%m/%Y %H:%M:%S")
powConsData$Global_active_power <- as.numeric(powConsData$Global_active_power)
powConsData$Global_reactive_power <- as.numeric(powConsData$Global_reactive_power)
powConsData$Voltage <- as.numeric(powConsData$Voltage)
powConsData$Sub_metering_1 <- as.numeric(powConsData$Sub_metering_1)
powConsData$Sub_metering_2 <- as.numeric(powConsData$Sub_metering_2)
powConsData$Sub_metering_3 <- as.numeric(powConsData$Sub_metering_3)

## Create the plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

## 1st plot (1 row, 1 column)
with(powConsData, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l"))

## 2nd plot (1 row, 2 column)
with(powConsData, plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))

## 3rd plot (2 row, 1 column)
with(powConsData, plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(powConsData, lines(DateTime, Sub_metering_1, col = "black"))
with(powConsData, lines(DateTime, Sub_metering_2, col = "red"))
with(powConsData, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lwd = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## 4th plot (2 row, 2 column)
with(powConsData, plot(DateTime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l"))

dev.off()