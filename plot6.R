## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in 
## Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

if(!file.exists("data")){
      dir.create("data")
}

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl, destfile = "./data/pm.zip", method = "curl")
unzip("./data/pm.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

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

