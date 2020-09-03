## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these 
## four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in 
## emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
source("Preparing_data.R")
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
