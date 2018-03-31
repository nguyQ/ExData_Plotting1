
## Downloading and unzipping Text File
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "./Electric_Power_Consumption.zip")
unzip("./Electric_Power_Consumption.zip")

## Reading the table
raw_data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

## Converting date column
raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")

## Subsetting dates for plot
data_subset <- subset(raw_data, Date >= "2007/02/01" & Date <= "2007/02/02")

## Combine Date and Time Columns
data_subset$Time <- as.POSIXct(paste(data_subset$Date, data_subset$Time))

## Preparing for Multiple Plots
par(mfrow = c(2, 2), mar = c(4,4,4,1))

## Plotting Global Active Power
par(col = "Black")
plot(data_subset$Time, as.numeric(as.character(data_subset$Global_active_power)), xlab = "",ylab = "Global Active Power", col = "Black", type = "l", cex.lab = 0.8, cex.axis = 0.8)

## Plotting Voltage
plot(data_subset$Time, as.numeric(as.character(data_subset$Voltage)), xlab = "datetime",ylab = "Voltage", col = "Black", type = "l", cex.lab = 0.8, cex.axis = 0.8)

## Plotting Sub Metering
plot(data_subset$Time, as.numeric(as.character(data_subset$Sub_metering_1)), xlab = "",ylab = "Energy sub metering", col = "Black", type = "s", cex.lab = 0.8, cex.axis = 0.8)
points(data_subset$Time, as.numeric(as.character(data_subset$Sub_metering_2)), col = "Red", type = "s")
points(data_subset$Time, as.numeric(as.character(data_subset$Sub_metering_3)), col = "Blue", type = "s")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, col = c("Black", "Red", "Blue"), bty = "n", cex = 0.8)

## Plotting Global Reactive Power
plot(data_subset$Time, as.numeric(as.character(data_subset$Global_reactive_power)), xlab = "",ylab = "Global_rective_power", col = "Black", type = "l", cex.lab = 0.8, cex.axis = 0.8, lwd = 0.1)

## Copying plot to a PNG File
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()