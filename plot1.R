## Load the input values
## Assumptions: the household_power_consumption.txt file is available in the current working directory and the whole file is loaded
filePath <- file.path(".", "household_power_consumption.txt")
powConsData <- read.table(filePath, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)
powConsData <- subset(powConsData, powConsData$Date == "2/2/2007" | powConsData$Date == "1/2/2007")
powConsData$Global_active_power <- as.numeric(powConsData$Global_active_power)

## Create the plot
png("plot1.png", width = 480, height = 480)
with(powConsData, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()