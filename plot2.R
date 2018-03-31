library(lubridate)

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

## Plotting
par(col = "Black")
plot(data_subset$Time, as.numeric(as.character(data_subset$Global_active_power)), xlab = "",ylab = "Global Active Power (Kilowatts)", col = "Black", type = "l", cex.lab = 0.8, cex.axis = 0.8)

## Copying plot to a PNG File
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()