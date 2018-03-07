#####################################################################################################
#Exploratory Data Analysis (Coursera)
#Course Project 1
#Plot 2
#Mykhal Gideoni Mangada
#####################################################################################################
#clear contents 
rm(list = ls())

#specify URL and download file
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dl_file <- download.file(file_url,destfile = "tmp")

unzip("tmp")    #extract files
unlink("tmp")   #delete file

#Specify file name to be accessed, 
#then read and store in a variable
file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", na.strings = "?")

#concatenate date and time, 
#then convert to representable date and time
data$dt <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Convert to class Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Store subset of data meeting the specified condition
sub <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot 2
plot(hpc_sub$dt, hpc_sub$Global_active_power, type = "l", 
	xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()