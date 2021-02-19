library(lubridate)
library(dplyr)

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

##Determine the scale of the y axis
max <- max(feb_data$Sub_metering_1)
max

#Plot sub_metering data
plot(feb_data$xtick, feb_data$Sub_metering_1, type="l",  xlab="",
     ylab="Energy Sub Metering")
par(new=TRUE)
plot(feb_data$Sub_metering_2, type="l", xaxt="n", xlab="",
     ylab="Energy Sub Metering", col="red",  ylim=c(0,38))
par(new=TRUE)
plot(feb_data$Sub_metering_3, type="l", xaxt="n", xlab="",
     ylab="Energy Sub Metering", col="blue", ylim=c(0,38))

#Add legend
legend("topright", col=c("black", "red", "blue"), lty= 1, seg.len=2, legend = c("Sub_metering_1",
                 "Sub_metering_2", "Sub_metering_3"), pt.cex = .8)

##Copy my plot to png file
png(file="plot3.png", width = 480, height = 480)

## Close the PNG device
dev.off()



