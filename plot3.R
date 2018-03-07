#####################################################################################################
#Exploratory Data Analysis (Coursera)
#Course Project 1
#Plot 3
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
sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dt <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

data3 <- as.numeric(sub$Sub_metering_3)
data2 <- as.numeric(sub$Sub_metering_2)
data1 <- as.numeric(sub$Sub_metering_1)

#Plot 3
plot(dt, data1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, data2, type="l", col="red")
lines(dt, data3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
	col=c("black", "red", "blue"),  lty=1, lwd=2)
#Save plot to PNG file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()