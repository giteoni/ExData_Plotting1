#####################################################################################################
#Exploratory Data Analysis (Coursera)
#Course Project 1
#Plot 3
#Mykhal Gideoni Mangada
#####################################################################################################

#clear contents 
rm(list = ls())

#Specify file name
fname <- "household_power_consumption.txt"

if (!file.exists(fname)){
 #specify URL and download file
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dl_file <- download.file(file_url,destfile = "tmp")
unzip("tmp")    #extract files
unlink("tmp")   #delete file
}

#Read and store in a variable
data <- read.table(fname, header = TRUE, sep = ";", na.strings = "?")

#concatenate date and time, 
#then convert to representable date and time
sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Plot 3
#Save plot to PNG file
png("plot3.png", width=480, height=480)
data1 <- as.numeric(sub$Sub_metering_1)
plot(datetime, data1, type="l", ylab="Energy Submetering", xlab="")
data2 <- as.numeric(sub$Sub_metering_2)
lines(datetime, data2,  col="red")
data3 <- as.numeric(sub$Sub_metering_3)
lines(datetime, data3,  col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
	col=c("black", "red", "blue"),  lty=1, lwd=1)
dev.off()
