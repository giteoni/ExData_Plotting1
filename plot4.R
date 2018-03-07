#####################################################################################################
#Exploratory Data Analysis (Coursera)
#Course Project 1
#Plot 4
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
dt <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Plot 4
#Make a 2x2 plot area to accommodate 4 plots
par(mfrow = c(2, 2)) 

#Upper left panel
gap <- as.numeric(sub$Global_active_power)
plot(dt, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Upper right panel
volt<- as.numeric(sub$Voltage)
plot(dt, volt, type="l", xlab="dt", ylab="Voltage")

#Lower left panel
meter3 <- as.numeric(sub$Sub_metering_3)
meter2 <- as.numeric(sub$Sub_metering_2)
meter1 <- as.numeric(sub$Sub_metering_1)
plot(dt, meter1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, meter2, type="l", col="red")
lines(dt, meter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#Lower right panel
grp <- as.numeric(sub$Global_reactive_power)
plot(dt, grp, type="l", xlab="dt", ylab="Global_reactive_power")

#Save plot to PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()