## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## 4
## only emissions from coal combustion-related sources
is.coal.combustion <- grepl("*Coal",SCC$EI.Sector)
## extract the SCC code for emissions from coal combustion-related sources
coalScc <- SCC$SCC[is.coal.combustion]
NEI.coal <- subset(NEI, SCC %in% coalScc)

png(file = "plot4.png", width = 480, height = 480, units = "px")
ggplot(NEI.coal,
       aes(x=factor(year), y=Emissions)) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0, 10)) + 
  geom_smooth(method='lm')
dev.off()