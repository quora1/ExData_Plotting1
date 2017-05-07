##Exploratory_data_analysis
## week1
## PLOT 2

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

gap <-as.numeric(data1$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(gap ~ data1$Datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()


