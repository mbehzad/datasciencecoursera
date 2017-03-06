## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## 2
## calc total of emmisions for each year
NEI.Baltimore <- subset(NEI, fips == "24510")
total <- tapply(NEI.Baltimore$Emissions, NEI.Baltimore$year, sum)

## PLOT #2
png(file = "plot2.png", width = 480, height = 480, units = "px")
## draw plot
plot(row.names(total), total, pch = 20)
## conncet points
lines(row.names(total), total, pch=16)
dev.off()