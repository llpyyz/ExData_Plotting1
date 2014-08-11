#########
#plot4.r
#########

##########################################################
#Author: David Schonberger
#Created: 8/7/2014
#Creates 2 x 2 array of plots as follows:
#plot at (1,1): time series of Global Active Power
#plot at (1,2): time series of Voltage
#plot at (2,1): overlayed time series of 3 sub metering data groups
#plot at (2,2): time series of Global Reactive Power
#Saves result to plot4.png
##########################################################

source("load_power_data.r")

par(mfrow = c(2,2)) #fill 2 x 2 row-wise

#row 1, col 1 plot
plot(pd_subset$Global_active_power ~ pd_subset$Date, xlab = "", ylab = "Global Active Power", type = "n")
lines(pd_subset$Date, pd_subset$Global_active_power)

#row 1, col 2 plot
plot(pd_subset$Voltage ~ pd_subset$Date, xlab = "", ylab = "Voltage",  type = "n")
lines(pd_subset$Date, pd_subset$Voltage)

#row 2, col 1 plot
sm1 <- pd_subset$Sub_metering_1
sm2 <- pd_subset$Sub_metering_2
sm3 <- pd_subset$Sub_metering_3
sm <- c(sm1, sm2, sm3)
g <- gl(3, length(sm1), labels = c("sm1","sm2","sm3"))
x <- c(pd_subset$Date,pd_subset$Date,pd_subset$Date)
plot(x,sm, xlab = "", ylab = "Energy sub metering", type = "n") #create plot region with everything except the data
lines(x[g == "sm1"], sm[g == "sm1"], col = "black") #add points for sub metering 1
lines(x[g == "sm2"], sm[g == "sm2"], col = "red") #add points for sub metering 2
lines(x[g == "sm3"], sm[g == "sm3"], col = "blue") #add points for sub metering 3
legend("topright", bty = "n", lty = "solid",  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#row 2, col 2 plot
png(filename = 'plot4.png', width = 480, height = 480, units = 'px')
plot(pd_subset$Global_reactive_power ~ pd_subset$Date, xlab = "", ylab = "Global Reactive Power", type = "n")
lines(pd_subset$Date, pd_subset$Global_reactive_power)
dev.off()
