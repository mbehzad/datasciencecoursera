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


## 3

png(file = "plot3.png", width = 960, height = 480, units = "px")
ggplot(subset(NEI, fips == "24510"),
       aes(x=year, y=Emissions))+
       geom_point() + 
       facet_grid(~type)+ 
       geom_smooth(method='lm')
dev.off()


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


## 5
emissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]

png(file = "plot5.png", width = 480, height = 480, units = "px")
ggplot(emissions,
       aes(x=factor(year), y=Emissions)) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0, 2.5)) + 
  geom_smooth(method='lm')
dev.off()


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
