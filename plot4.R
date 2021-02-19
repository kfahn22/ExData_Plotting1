#Load lubridate and dplyr
library(lubridate)
library(dplyr)

#Download Url
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "household_power_consumption.txt", method="curl")

##Read in power data
df2 <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", skipNul = TRUE,
                  header=TRUE)

#Combine date and time columns

df2$date_time <- paste(df2$Date, df2$Time, sep = " ")

#Convert date_time to date_time variable
df2$xtick <- dmy_hms(df1$date_time)

##Retrieve data for 2007-02-01 and 2007-02-02
feb_data <- df2[(df2$Date == "1/2/2007" | df2$Date 
                 == "2/2/2007"), ]

##Set par to vew 2 rows of 2 plots and set margins for plots
par(mfrow = c(2,2), oma = c(3,3,3,2), mai=c(.5, .5, .5, .5))

## Create plot of day of week versus Global Active Power
plot(feb_data$xtick, feb_data$Global_active_power, type="l",  xlab="",
     ylab="Global Active Power", cex.lab = .8, cex.axis=.6, font=2)

##Create plot of voltage vs. datetime
plot(feb_data$xtick, feb_data$Voltage, type="l",
     xlab= "datetime", ylab="Voltage", cex.lab = .8, cex.axis=.6, font=2)

##Determine the scale of the y axis
max <- max(feb_data$Sub_metering_1)

#Plot sub_metering data
plot(feb_data$xtick, feb_data$Sub_metering_1, type="l",  xlab="",
     ylab="Energy Sub Metering", cex.lab = .8, cex.axis=.6, font=2)
par(new=TRUE)
plot(feb_data$xtick, feb_data$Sub_metering_2, type="l",  xlab="",
     ylab="Energy Sub Metering", col="red",  ylim=c(0,38), cex.lab = .8, 
     cex.axis=.6, font=2)
par(new=TRUE)
plot(feb_data$xtick, feb_data$Sub_metering_3, type="l", xaxt="n", xlab="",
     ylab="Energy Sub Metering", col="blue", ylim=c(0,38), cex.lab = .8, 
     cex.axis=.6, font=2)

#Add legend
legend("topright", col=c("black", "red", "blue"), lty= 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .5)


#Create plot of global reactive power vs. datetime
plot(feb_data$xtick, feb_data$Global_reactive_power, type="l",  xlab="datetime",
     ylab="Global_Reactive_Power", cex.lab = .8, cex.axis=.6, font=2)

##Copy my plot to png file
png(file="plot4.png", width = 480, height = 480)

## Close the PNG device
dev.off()



