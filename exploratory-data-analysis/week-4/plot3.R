## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## 3

png(file = "plot3.png", width = 960, height = 480, units = "px")
ggplot(subset(NEI, fips == "24510"),
       aes(x=year, y=Emissions))+
  geom_point() + 
  facet_grid(~type)+ 
  geom_smooth(method='lm')
dev.off()