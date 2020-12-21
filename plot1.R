##Exploratory Data Analysis Week1 plot1 2020/12
##Load packages
library(dplyr)
library(data.table)

##Set the working directory
setwd("C:/Users/to10678/Desktop/R learning/ExData_Plotting1")

##Read the raw data
data1 <- read.table("./household_power_consumption.txt",
                    header=T, sep=";", na.strings="?",
                    stringsAsFactors=FALSE)

##create the 2007-02-01 and 2007-02-02 data
data1 %>%
mutate(date=as.Date(Date, format="%d/%m/%Y")) %>%
subset(date >= "2007-02-01" & date <= "2007-02-02")%>%
select(Global_active_power) -> plot1_data

##draw the plot and Output Plot to 480 x 480 png
png("plot1.png", height = 480, width = 480)
hist(plot1_data$Global_active_power, col="red", 
     xlab="Global_active_power(kilowatts)", ylab="Frequency",
     main="Global_active_power")
dev.off()   





