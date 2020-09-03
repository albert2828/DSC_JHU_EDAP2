## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
if(!file.exists("data")){
      dir.create("data")
}

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl, destfile = "./data/pm.zip", method = "curl")
unzip("./data/pm.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

which <- grepl("Coal", SCC$EI.Sector)
SCC$SCC1 <- as.character(SCC$SCC)
sc <- SCC[which,]
coalscc <- sc$SCC1

coal <- subset(NEI, SCC %in% coalscc)
coal <- coal[,c(4,6)]
total <- sapply(split(coal, coal$year), function(x){sum(x[,1])})
year <- unique(coal$year)

plot(year, total, main="Emissions from coal combustion related sources", ylab = "Total Emissions in tons", pch=19,
     type = "b")
dev.copy(png, file="plot4.png")
dev.off()
