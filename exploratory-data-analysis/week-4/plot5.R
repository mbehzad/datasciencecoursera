## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## 5
emissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]

png(file = "plot5.png", width = 480, height = 480, units = "px")
ggplot(emissions,
       aes(x=factor(year), y=Emissions)) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0, 2.5)) + 
  geom_smooth(method='lm')
dev.off()