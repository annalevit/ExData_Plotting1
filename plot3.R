## This file constructs the third plot in the project, named plot3.png  
library(datasets)
##opens png device (default width is 480 pixels and default height is 480 pixels)
png(filename="plot3.png") 
##reads the data (only the 2 dates)
dt<-read.csv2("household_power_consumption.txt",na.strings=c("?"), skip=66636,nrows=2880, colClasses="character")
temp<-read.csv2("household_power_consumption.txt",nrows=1)
names(dt)<-names(temp)
## converts the Date and Time variables to Date/Time classes (creates a new variable including both)
dt$Date<-as.Date(dt$Date, "%d/%m/%Y")
dt$Time1<-paste(dt$Date, dt$Time)
dt$Time1<-strptime(dt$Time1,format= "%Y-%m-%d %H:%M:%S")
## constructs the plot with required lables, colours and legend 
plot(dt$Time1,as.numeric(dt$Sub_metering_1),type="l",ylab="Energy sub metering",xlab="")
with(dt, lines(dt$Time1,as.numeric(dt$Sub_metering_2),col="red"))
with(dt, lines(dt$Time1,as.numeric(dt$Sub_metering_3),col="blue"))
legend("topright",lty=c(1,1),col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## closes device
dev.off()