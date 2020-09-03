## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these 
## four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in 
## emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
if(!file.exists("data")){
      dir.create("data")
}

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl, destfile = "./data/pm.zip", method = "curl")
unzip("./data/pm.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

bal <- subset(NEI, fips=="24510")
bal <- bal[,4:6]

ggplot(data= bal, mapping = aes(x=year, y=Emissions, color=type))+
      geom_point()+
      geom_smooth(method = "lm")+
      ggtitle("Emissions by type in Maryland, Baltimore City")+
      xlab("year")+ylab("Emissions in tons")

dev.copy(png, file="plot3.png")
dev.off()
