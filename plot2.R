##Exploratory Data Analysis Week1 plot2 2020/12
##Load packages
library(dplyr)
library(lubridate)
library(data.table)

##Set the working directory
setwd("C:/Users/to10678/Desktop/R learning/ExData_Plotting1")

##Read the raw data
data2 <- read.table("./household_power_consumption.txt",
                    header=T, sep=";", na.strings="?",
                    stringsAsFactors=FALSE)

##create the 2007-02-01 and 2007-02-02 data
data2 %>%
    mutate(date_time = dmy_hms(paste(Date, Time))) %>%
    subset(date(date_time) >= "2007-02-01" & date(date_time) <= "2007-02-02") %>%
    select(Global_active_power,date_time) -> plot2_data

##draw the plot and Output Plot to 480 x 480 png
png("plot2.png", height = 480, width = 480)
plot(plot2_data$date_time,
     plot2_data$Global_active_power,
     col="black",
     type="l",
     xlab="",
     ylab="Global_active_power(kilowatts)",
     main="Global_active_power")
dev.off()   

