## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
## Use the base plotting system to make a plot answering this question.
source("Preparing_data.R")

bal <- subset(NEI, fips=="24510")
bal <- bal[,c(4,6)]
total <- sapply(split(bal, bal$year), function(x){sum(x[,1])})
years <- unique(bal$year)
df <- data.frame(years, total)


plot(df, xlab="year", ylab="Total emissions in tons", type="b", pch=19, 
     main="Total Emissions per year, Maryland, Baltimore City")
points(df, pch=19, col="blue")
dev.copy(png, file="plot2.png")
dev.off()
