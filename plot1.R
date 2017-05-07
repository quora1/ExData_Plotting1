##Exploratory_data_analysis
## week1
## PLOT 1

##1) loading the data:
getwd()
setwd("/Users/quora1/Desktop/DataScience/4_ExploratoryDataAnalysis/workDir")
install.packages("lubridate")

library("lubridate")

data<-read.table("./household_power_consumption.txt",sep = ";", header = TRUE) 
head(data)


##2) converting the date variable into date format
str(data)
Sys.setlocale("LC_TIME", lct) # setting system locale, otherwise convertion will produce NA
data[,1]<-as.Date(data[,1], format = "%d/%m/%Y")
str(data)
head(data)
dim(data)

#3) Substracting the data corresponding to dates 2007-02-01 and 2007-02-02
lct <- Sys.getlocale("LC_TIME"); Sys.setlocale("LC_TIME", "C") # setting system locale, otherwise convertion will produce NA
mydates<-as.Date(c("2007/02/01", "2007/02/02"), format="%Y/%m/%d")
mydates
data1<-subset(data, Date == mydates[1]|Date==mydates[2] )
head(data1)
dim(data1)
 

##4) Creating Plot1 and saving it under PNG
var1<-data1$Global_active_power
var1_500 <-as.numeric(var1)/500
data1[ , "var1_500"] <- var1_500
png('plot1.png')
hist(as.numeric(data1$var1_500),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab= "Frequency")
dev.off()

