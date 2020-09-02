## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
## make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## First I Subset the data per year
source("Preparing_data.R")



pm1 <- subset(NEI, year==1999)
pm2 <- subset(NEI, year==2002)
pm3 <- subset(NEI, year==2005)
pm4 <- subset(NEI, year==2008)

pm1 <- pm1[,c(2,4)]
pm2 <- pm2[,c(2,4)]
pm3 <- pm3[,c(2,4)]
pm4 <- pm4[,c(2,4)]

total1 <- sapply(split(pm1, pm1$SCC), function(x){ sum(x[,2])})
total2 <- sapply(split(pm2, pm2$SCC), function(x){ sum(x[,2])})
total3 <- sapply(split(pm3, pm3$SCC), function(x){ sum(x[,2])})
total4 <- sapply(split(pm4, pm4$SCC), function(x){ sum(x[,2])})

rngyears <- range(unique(NEI$year))


plot(rep(1999, length(unique(pm1$SCC))), total1, ylab = "Total emissions per source in tons", xlab = "Year", 
     main = "Total emissions per year in the U.S", xlim = rngyears)
points(rep(2002, length(unique(pm2$SCC))), total2)
points(rep(2005, length(unique(pm3$SCC))), total3)
points(rep(2008, length(unique(pm4$SCC))), total4)
segments(rep(1999, length(unique(pm1$SCC))), total1, rep(2002, length(unique(pm2$SCC))), total2)
segments(rep(2002, length(unique(pm2$SCC))), total2, rep(2005, length(unique(pm3$SCC))), total3)
segments(rep(2005, length(unique(pm4$SCC))), total3, rep(2008, length(unique(pm4$SCC))), total4)

dev.copy(png, file="plot1.png")
dev.off()
