#########
#plot1.r
#########

##########################################################
#Author: David Schonberger
#Created: 8/7/2014
#Creates a histogram of the Global Active Power data
#Saves result to plot1.png
##########################################################

source("load_power_data.r")

#########################################
#Plot 1: histogram of Global Active Power
#########################################
hist(pd_subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()