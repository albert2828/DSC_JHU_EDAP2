## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in 
## Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

source("Preparing_data.R")
source("plot5.R")
library(ggplot2)

motor <- subset(NEI, SCC %in% motorscc)

motorbal <- subset(motor, fips=="24510")
motorbal <- motorbal[,c(4,6)]

motorLA <-  subset(motor, fips=="06037")
motorLA <- motorLA[,c(4,6)]

totalBal <- sapply(split(motorbal, motorbal$year), function(x){sum(x[,1])})
totalLA <- sapply(split(motorLA, motorLA$year), function(x){sum(x[,1])})

total <- c(totalBal,totalLA)
fipsbal <- rep("Baltimore City",times = 4)
fipsla <- rep("Los Angeles", times = 4)
fips <- c(fipsbal,fipsla)
year <- unique(motorLA$year)

df <- data.frame(fips, total, year)

ggplot(data=df, mapping = aes(x=year, y=total, color=fips))+
      geom_point()+
      geom_line()+
      ggtitle("Comparison of total emissions from metor vehicles in Baltimore City and Los Angeles")+
      xlab("year")+ylab("Emissions in tons")
dev.copy(png, file="plot6.png")
dev.off()

