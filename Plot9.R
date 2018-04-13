##PLOT 2

rm(list=ls())
dir()
setwd("/Users/quora1/Desktop/DataScience/4_ExploratoryDataAnalysis/Project2_workDir")
NEI <- readRDS("summarySCC_PM25.rds")
baltimore <-subset(NEI,fips=="24510")
head(baltimore)
dim(baltimore)
baltimore.totals <- aggregate(Emissions ~ year, baltimore, sum)
baltimore.totals
class(baltimore.totals)
##balt <-baltimore.totals[c(1,4),]

str(baltimore.totals)
png('plot2.png')

barplot(height=baltimore.totals$Emissions, names.arg=baltimore.totals$year, xlab="years", ylab=expression('total PM'[2.5]*' emission in tons'),main=expression('Evolution of total PM'[2.5]*' emissions (in tons) in Baltimore'))

dev.off()
