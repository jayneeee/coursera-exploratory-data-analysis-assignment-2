library(ggplot2)

setwd('C://Users//jieya//OneDrive//Documents//R')

NEI <- readRDS("./R/summarySCC_PM25.rds")
SCC <- readRDS("./R/Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")

coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEISCC, sum)


g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)

png("plot4.png", width=640, height=480)
dev.off()