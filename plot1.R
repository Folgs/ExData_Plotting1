mydata<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE,na.strings = "?")
##We pick the dates we want.
mydata<-mydata[(mydata$Date=="2/2/2007")|(mydata$Date=="1/2/2007"),]

##Then we convert the columns we will is into their units
mydata$Date<-as.Date(mydata$Date,format="%d/%m/%Y")
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)

#We open the device, make the plot and close it.
png(filename="plot1.png")
hist(mydata$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.off()