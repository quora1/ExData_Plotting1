##Exploratory_data_analysis
## week1
## PLOT 3

##1) loading the data:

getwd()
setwd("/Users/quora1/Desktop/DataScience/4_ExploratoryDataAnalysis/workDir")
install.packages("lubridate")
library("lubridate")
data<-read.table("./household_power_consumption.txt",sep = ";", header = TRUE, dec=".", na.strings ="?", check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"') 
head(data)
str(data)


##2) converting the data variable into date format 
data[,1]<-as.Date(data[,1], format = "%d/%m/%Y")
str(data)
head(data)


#3) Substracting the data corresponding to dates 2007-02-01 and 2007-02-02
lct <- Sys.getlocale("LC_TIME"); Sys.setlocale("LC_TIME", "C") # setting system locale, otherwise convertion will produce NA
mydates<-as.Date(c("2007/02/01", "2007/02/02"), format="%Y/%m/%d")
mydates
data1<-subset(data, Date == mydates[1]|Date==mydates[2] )
head(data1)
str(data1)
dim(data1)



##4) converting dates

 datetime <-paste(as.Date(data1$Date), data1$Time)
 data1$Datetime <-as.POSIXct(datetime)
head(data1)
str(data1)


##5) Plotting 
##a) first separately

e1 <-as.numeric(data1$Sub_metering_1)
e2 <-as.numeric(data1$Sub_metering_2)
e3 <-as.numeric(data1$Sub_metering_3)

plot(e1~ data1$Datetime, type = "l",ylab = "Energy sub metering", col="black")
plot(e2~ data1$Datetime, type = "l",ylab = "Energy sub metering", col="red")
plot(e3~ data1$Datetime, type = "l",ylab = "Energy sub metering", col="blue")
	
##b) then together

png("plot3.png", width = 480, height = 480)
with(data1, plot(e1~ data1$Datetime, type = "l",ylab = "Energy sub metering", xlab = "", col="black"))
lines(e2~ data1$Datetime, col="red")
lines(e3~ data1$Datetime, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()	


