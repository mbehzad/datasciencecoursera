## Q 1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "survey.csv")
srv <- read.csv("survey.csv")
agricultureLogical <- srv$ACR == 3 & srv$AGS == 6
which(agricultureLogical)
srv[which(agricultureLogical) ,]

## Q 2
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile = "img.jpg")
img <- readJPEG("img.jpg", native = TRUE)
quantile(img, probs = seq(0,1,0.1))


## Q 3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "gdp.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "edu.csv")
## gdp <- read.csv("gdp.csv")
edu <- read.csv("edu.csv")
gdp <- read.csv("gdp.csv", skip=4, header=T)

mergedData <- merge(gdp, edu, by.x = "X", by.y = "CountryCode", all=F) 
##mergedData$X.1 <- as.numeric(mergedData$X.1)

## extract empty factores
## read favctores as char
ranks <- mergedData$X.1
ranks<- as.character(ranks)

## remove empty ones
merged2 <- mergedData[which(nchar(ranks)>0),]
merged2$X.1 <- as.character(merged2$X.1)
merged2$X.1 <- as.numeric(merged2$X.1)
merged2 <- merged2[order(merged2$X.1, decreasing = T),]

## Q 4
oecd <- d3[which(d3$Income.Group == "High income: OECD"),]
nonOecd <- d3[which(d3$Income.Group == "High income: nonOECD"),]
rnkOecd <- mean(oecd$X.1)
rnkNonOecd <- mean(nonOecd$X.1)

## Q 5
breaks <- quantile(d3$X.1, probs = seq(0, 1, 0.2), na.rm = TRUE)
d3$quantileGDP <- cut(d3$X.1, breaks = breaks)

## dind't use quantile
nrow(d3[which(d3$X.1 < 39 & d3$Income.Group == "Lower middle income"),])