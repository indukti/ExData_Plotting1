## Set locale to en_US.UTF-8 in order to get correct x-axis values
Sys.setlocale("LC_TIME", "en_US.UTF-8")

## Load the input values
## Assumptions: the household_power_consumption.txt file is available in the current working directory and the whole file is loaded
filePath <- file.path(".", "household_power_consumption.txt")
powConsData <- read.table(filePath, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)
powConsData <- subset(powConsData, powConsData$Date == "2/2/2007" | powConsData$Date == "1/2/2007")
powConsData$DateTime <- strptime(paste(powConsData$Date, powConsData$Time), "%d/%m/%Y %H:%M:%S")
powConsData$Global_active_power <- as.numeric(powConsData$Global_active_power)

## Create the plot
png("plot2.png", width = 480, height = 480)
with(powConsData, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()