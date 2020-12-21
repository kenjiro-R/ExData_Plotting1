##Exploratory Data Analysis Week1 plot2 2020/12
##Load packages
library(dplyr)
library(lubridate)
library(data.table)

##Set the working directory
setwd("C:/Users/to10678/Desktop/R learning/ExData_Plotting1")

##Read the raw data
data3 <- read.table("./household_power_consumption.txt",
                    header=T, sep=";", na.strings="?",
                    stringsAsFactors=FALSE)

##create the 2007-02-01 and 2007-02-02 data
data3 %>%
    mutate(date_time = dmy_hms(paste(Date, Time))) %>%
    subset(date(date_time) >= "2007-02-01" & date(date_time) <= "2007-02-02") %>%
    select(Sub_metering_1,
           Sub_metering_2,
           Sub_metering_3,
           date_time) -> plot3_data

##draw the plot and Output Plot to 480 x 480 png
png("plot3.png", height = 480, width = 480)
plot(plot3_data$date_time,
     plot3_data$Sub_metering_1,
     type="n",
     xlab="",
     ylab="Energy sub metering")
with(plot3_data,lines(date_time,Sub_metering_1))
with(plot3_data,lines(date_time,Sub_metering_2,col="red"))
with(plot3_data,lines(date_time,Sub_metering_3,col="blue"))
legend("topright", lty=1, 
       col=c("black","red","blue"),
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"))
dev.off()   
