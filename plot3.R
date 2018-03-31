
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

## Plotting Sub_metering_1
par(col = "Black")
plot(data_subset$Time, as.numeric(as.character(data_subset$Sub_metering_1)), xlab = "",ylab = "Energy sub metering", col = "Black", type = "s",cex.lab = 0.8, cex.axis = 0.80)

## Adding Sub_metering_2 and Sub_metering_3 to plot
points(data_subset$Time, as.numeric(as.character(data_subset$Sub_metering_2)), col = "Red", type = "s")
points(data_subset$Time, as.numeric(as.character(data_subset$Sub_metering_3)), col = "Blue", type = "s")

## Adding an Legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, col = c("Black", "Red", "Blue"), cex = 0.8)

## Copying plot to a PNG File
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()