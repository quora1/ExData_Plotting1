##PLOT 3
install.packages("ggplot2")
library("ggplot2")
rm(list=ls())
dir()
setwd("/Users/quora1/Desktop/DataScience/4_ExploratoryDataAnalysis/Project2_workDir")
NEI <- readRDS("summarySCC_PM25.rds")
baltimore <-subset(NEI,fips=="24510")
head(baltimore)
dim(baltimore)
baltimore.totals <- aggregate(Emissions ~ year + type, baltimore, sum)
baltimore.totals

png("plot3.png", width = 640, height = 480)
plot3 <-ggplot(baltimore.totals, aes(year, Emissions, color=type))
plot3<-plot3 + geom_line()+xlab("year")+ylab(expression('Total PM2.5 Emissions'))+ggtitle('Total Emissions in Baltimore from 1999 to 2008')
print(plot3)
dev.off()










png("plot3.png", width=640, height=480)

g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))

g <- g + geom_line() +

  xlab("year") +

  ylab(expression('Total PM'[2.5]*" Emissions")) +

  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')

print(g)

dev.off()
