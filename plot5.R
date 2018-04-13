##PLOT 5
install.packages("ggplot2")
library("ggplot2")
rm(list=ls())
dir()
setwd("/Users/quora1/Desktop/DataScience/4_ExploratoryDataAnalysis/Project2_workDir")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data <- merge(NEI,SCC, by="SCC")
head(data)

subset <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

totals <- aggregate(Emissions ~ year, subset, sum)

png("plot5.png", width=640, height=480)

plot5 <- ggplot(totals, aes(factor(year), Emissions))
plot5 <- plot5 + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total PM2.5 Emissions from motor vehicles in Baltimore (1999-2008)')
print(plot5)

dev.off()
