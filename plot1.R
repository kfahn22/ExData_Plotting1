#Load lubridate and dplyr
library(lubridate)
library(dplyr)

##Download file URL
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

##Create histogram of Global Active Power
     
hist(feb_data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

##Copy my plot to png file
png(file="plot1.png",  width = 480, height = 480)

## Close the PNG device
dev.off()
