## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
## make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## First I Subset the data per year
source("Preparing_data.R")

pm1 <- subset(NEI, year==1999)
pm2 <- subset(NEI, year==2002)
pm3 <- subset(NEI, year==2005)
pm4 <- subset(NEI, year==2008)

total1 <- sum(pm1$Emissions)
total2 <- sum(pm2$Emissions)
total3 <- sum(pm3$Emissions)
total4 <- sum(pm4$Emissions)

rng <- range(NEI$Emissions)

