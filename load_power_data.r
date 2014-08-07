#################
#loadpowerdata.r
#################

##########################################################
#Author: David Schonberger
#Created: 8/7/2014
#Loads and formats the power data used for project 1
#Sourced by each of plot1.r, plot2.r, plot3.r and plot4.r
##########################################################

#read in data; assumes household_power_consumption.txt is in working dir
power_data <- read.csv("household_power_consumption.txt", sep = ";", 
colClasses = c("character","character", "character","character","character","character","character","character","character" ))

#Massage date and time data, merge into one col in data frame
dates <- power_data$Date
times <- power_data$Time
dates_times <- paste(dates, times)
dts <- strptime(dates_times,format = "%d/%m/%Y %H:%M:%S")
power_data <- data.frame(Date = dts, power_data[,3:9])

#convert "?" to NA's for cols 2-8
power_data$Global_active_power <- as.numeric(power_data$Global_active_power)
power_data$Global_reactive_power <- as.numeric(power_data$Global_reactive_power)
power_data$Voltage <- as.numeric(power_data$Voltage)
power_data$Global_intensity <- as.numeric(power_data$Global_intensity)
power_data$Sub_metering_1 <- as.numeric(power_data$Sub_metering_1)
power_data$Sub_metering_2 <- as.numeric(power_data$Sub_metering_2)
power_data$Sub_metering_3 <- as.numeric(power_data$Sub_metering_3)

#extract data for 2/1/2007 thru 2/2/2007
begin_date <- strptime("2007-02-01 00:00:01 PST","%Y-%m-%d %H:%M:%S")
end_date <- strptime("2007-02-02 23:59:59 PST","%Y-%m-%d %H:%M:%S")
pd_subset <- subset(power_data, Date >= begin_date - 60 & Date <= end_date)