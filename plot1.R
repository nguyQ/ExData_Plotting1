## Downloading and unzipping Text File
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "./Electric_Power_Consumption.zip")
unzip("./Electric_Power_Consumption.zip")

## Reading the table
raw_data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

## Converting the time and date columns to respective data types
raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")
raw_data$Time <- strptime(raw_data$Time,format = "%H:%M:%S", tz = "GMT")

## Subsetting dates for plot
data_subset <- subset(raw_data, Date >= "2007/02/01" & Date <= "2007/02/02")

## Plotting Histogram
hist(as.numeric(as.character(data_subset$Global_active_power)), freq = TRUE, main = paste("Global Active Power"), col = "Red",xlab = "Global Active Power (Kilowatts)", cex.lab = 0.8, cex.axis = 0.80)

## Copying plot to a PNG File
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()