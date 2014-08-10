#########
#plot3.r
#########

##########################################################
#Author: David Schonberger
#Created: 8/7/2014
#Creates overlayed time series of the sub_metering_1,
# sub_metering_2, and sub_metering_3 data
#Saves result to plot3.png
##########################################################

source("load_power_data.r")

###################################################
#Plot3 : overlayed time series of sm1, sm2, and sm3
###################################################
sm1 <- pd_subset$Sub_metering_1
sm2 <- pd_subset$Sub_metering_2
sm3 <- pd_subset$Sub_metering_3
sm <- c(sm1, sm2, sm3)
g <- gl(3, length(sm1), labels = c("sm1","sm2","sm3"))
x <- c(pd_subset$Date,pd_subset$Date,pd_subset$Date)
png(filename = 'plot3.png', width = 480, height = 480, units = 'px')
plot(x,sm, xlab = "", ylab = "Energy sub metering", type = "n") #create plot region with everything except the data
lines(x[g == "sm1"], sm[g == "sm1"], col = "black") #add points for sub metering 1
lines(x[g == "sm2"], sm[g == "sm2"], col = "red") #add points for sub metering 2
lines(x[g == "sm3"], sm[g == "sm3"], col = "blue") #add points for sub metering 3
legend("topright", lty = "solid",  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()