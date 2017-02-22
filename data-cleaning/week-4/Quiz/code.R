## Q1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "survey.csv")
srv <- read.csv("survey.csv")
spliter <- function(str) {strsplit(str, "wgtp")}
sapply(names(srv), spliter)[123]


## Q2
gdp <- read.csv("gdp.csv", skip=4, header=T)
cleaner <- function(str){gsub(",", "", str)}
res<- sapply(gdp$X.4[1:190], cleaner)
res<- as.numeric(res)
mean(res)

## Q4
length(mergedData$Special.Notes[mergedData$Special.Notes == q])

## Q5
length(sampleTimes[format(sampleTimes, "%Y") == "2012"])