## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
source("Preparing_data.R")
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
