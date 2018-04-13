##Exploratory data analysis
## project2
## PLOT 1
rm(list=ls())
dir()
setwd("/Users/quora1/Desktop/DataScience/4_ExploratoryDataAnalysis/Project2_workDir")

totals <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')

barplot(height=totals$Emissions, names.arg=totals$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' Evolution of emissions'))

dev.off()


totals

png('plot1.png')

barplot(height=totals$Emissions, names.arg=totals$year, xlab="years", ylab=expression('total PM'[2.5]*' emission in tons'),main=expression('Total PM'[2.5]*' Evolution of emissions'))

dev.off()
