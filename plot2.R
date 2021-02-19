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


## Create plot of day of week versus Global Active Power
plot(feb_data$xtick, feb_data$Global_active_power, type="l",  xlab="",
     ylab="Global Active Power (kilowatts)", cex.lab = .8, cex.axis=.8, font=2)

##Copy my plot to png file
dev.copy(png, file="plot2.png")

## Close the PNG device
dev.off()
