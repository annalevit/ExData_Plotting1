## This file constructs the first plot in the project, named plot1.png  
library(datasets)
##opens png device (default width is 480 pixels and default height is 480 pixels)
png(filename="plot1.png") 
##reads the data (only the 2 dates)
dt<-read.csv2("household_power_consumption.txt",na.strings=c("?"), skip=66636,nrows=2880, colClasses="character")
temp<-read.csv2("household_power_consumption.txt",nrows=1)
names(dt)<-names(temp)
## converts the Date and Time variables to Date/Time classes (creates a new variable including both)
dt$Date<-as.Date(dt$Date, "%d/%m/%Y")
dt$Time1<-paste(dt$Date, dt$Time)
dt$Time1<-strptime(dt$Time1,format= "%Y-%m-%d %H:%M:%S")
## plots the histogram with required lable and title 
hist(as.numeric(dt$Global_active_power),col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
## closes device
dev.off()
