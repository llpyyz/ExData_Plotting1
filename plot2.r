#########
#plot2.r
#########

##########################################################
#Author: David Schonberger
#Created: 8/7/2014
#Creates a time series of the Global Active Power data
#Saves result to plot2.png
##########################################################

source("load_power_data.r")

#####################################
#Plot 2: time series of g_a_p vs time
#####################################
plot(pd_subset$Global_active_power ~ pd_subset$Date, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(pd_subset$Date, pd_subset$Global_active_power)
dev.copy(png, file = "plot2.png")
dev.off()