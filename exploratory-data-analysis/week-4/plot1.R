## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## 1
## calc total of emmisions for each year
total <- tapply(NEI$Emissions, NEI$year, sum)

## PLOT #1
png(file = "plot1.png", width = 480, height = 480, units = "px")
## draw plot
plot(row.names(total), total, pch = 20)
## conncet points
lines(row.names(total), total, pch=16)
dev.off()