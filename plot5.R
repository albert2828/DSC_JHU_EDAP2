## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
if(!file.exists("data")){
      dir.create("data")
}

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl, destfile = "./data/pm.zip", method = "curl")
unzip("./data/pm.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


which <- grepl("Highway Vehicles", SCC$SCC.Level.Two) # as Sunil Varma said they did in this post https://www.coursera.org/learn/exploratory-data-analysis/discussions/weeks/4/threads/cUoI6_cREeWnyw45DXyCTw/replies/kmRyE_vvEeWu1Q5gvOuhYQ
SCC$SCC1 <- as.character(SCC$SCC)
sc <- SCC[which,]
motorscc <- sc$SCC1

motor <- subset(NEI, SCC %in% motorscc)
motorbal <- subset(motor, fips=="24510")
motorbal <- motorbal[,c(4,6)]

total <- sapply(split(motorbal, motorbal$year), function(x){sum(x[,1])})
year <- unique(motorbal$year)

plot(year, total, main="Emissions from motor vehicles in Baltimor City", ylab = "Total Emissions in tons", pch=19,
     type = "b")
dev.copy(png, file="plot5.png")
dev.off()
