##Exploratory Data Analysis Week1 plot4 2020/12
##Load packages
library(dplyr)
library(lubridate)
library(data.table)

##Set the working directory
setwd("C:/Users/to10678/Desktop/R learning/ExData_Plotting1")

##Read the raw data
data4 <- read.table("./household_power_consumption.txt",
                    header=T, sep=";", na.strings="?",
                    stringsAsFactors=FALSE)

##create the 2007-02-01 and 2007-02-02 data
data4 %>%
    mutate(date_time = dmy_hms(paste(Date, Time))) %>%
    subset(date(date_time) >= "2007-02-01" & date(date_time) <= "2007-02-02") %>%
    select(Global_active_power,
           Global_reactive_power,
           Voltage,
           Sub_metering_1,
           Sub_metering_2,
           Sub_metering_3,
           date_time) -> plot4_data



##draw the plot and Output Plot to 480 x 480 png
png("plot4.png", height = 480, width = 480)

#setting 2 by 2 graph area
par(mfrow=c(2,2))

##plot1
plot(plot4_data$date_time,
     plot4_data$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global_active_power")

##plot2
plot(plot4_data$date_time,
     plot4_data$Voltage,
     col="black",
     type="l",
     xlab="datetime",
     ylab="Voltage")

##plot3

plot(plot4_data$date_time,
     plot4_data$Sub_metering_1,
     type="n",
     xlab="",
     ylab="Energy sub metering")
with(plot4_data,lines(date_time,Sub_metering_1))
with(plot4_data,lines(date_time,Sub_metering_2,col="red"))
with(plot4_data,lines(date_time,Sub_metering_3,col="blue"))
legend("topright", lty=1, 
       col=c("black","red","blue"),
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"))

#plot4
plot(plot4_data$date_time,
     plot4_data$Global_reactive_power,
     col="black",
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()   
