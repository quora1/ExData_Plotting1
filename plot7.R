##PLOT 4
install.packages("ggplot2")
library("ggplot2")
rm(list=ls())
dir()
setwd("/Users/quora1/Desktop/DataScience/4_ExploratoryDataAnalysis/Project2_workDir")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data <- merge(NEI,SCC, by="SCC")
head(data)

coal  <- grepl("coal", data$Short.Name, ignore.case=TRUE)
subset <- data[coal, ]
totals <- aggregate(Emissions ~ year, subset, sum)

png("plot4.png", width=640, height=480)

plot4 <- ggplot(totals, aes(factor(year), Emissions))
plot4 <- plot4 + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from coal sources in years 1999 - 2008')
print(plot4)

dev.off()
