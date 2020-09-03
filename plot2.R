## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
## Use the base plotting system to make a plot answering this question.
if(!file.exists("data")){
      dir.create("data")
}

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl, destfile = "./data/pm.zip", method = "curl")
unzip("./data/pm.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


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
