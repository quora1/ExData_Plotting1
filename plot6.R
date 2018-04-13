##PLOT 6
install.packages("ggplot2")
library("ggplot2")
rm(list=ls())
dir()
setwd("/Users/quora1/Desktop/DataScience/4_ExploratoryDataAnalysis/Project2_workDir")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data <- merge(NEI,SCC, by="SCC")
head(data)

subset <- NEI[NEI$fips=="24510"|NEI$fips=="06037" & NEI$type=="ON-ROAD",  ]

totals <- aggregate(Emissions ~ year+fips, subset, sum)
totals$fips[totals$fips=="24510"] <-"Baltimore"
totals$fips[totals$fips=="06037"] <-"Los Angeles"

png("plot6.png", width=1040, height=480)

plot6 <- ggplot(totals, aes(factor(year), Emissions))
plot6 <- plot6 + facet_grid(.~ fips)
plot6 <- plot6 + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total PM2.5 Emissions from motor vehicles in Baltimore versus Los Angeles (1999-2008)')
print(plot6)

dev.off()

