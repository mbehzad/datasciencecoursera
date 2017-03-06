## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## 6
emissions <- NEI[(NEI$fips %in% c("24510", "06037")) & (NEI$type=="ON-ROAD"),]

png(file = "plot6.png", width = 860, height = 480, units = "px")
ggplot(emissions,
       aes(x=factor(year), y=Emissions)) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0, 30)) + 
  facet_grid(~fips)+ 
  geom_smooth(method='lm') +
  geom_smooth(method = "lm", se=FALSE, color="black", aes(group=1))
dev.off()