read.csv("americanSurvey.csv")
## Q 1
length(csv$VAL[csv$VAL == 24 & !is.na(csv$VAL)])

## Q 3
dat <- excel_sub <- read.xlsx("gas.xlsx", sheetIndex=1, head=TRUE, colIndex=7:15, rowIndex = 18:23)
sum(dat$Zip*dat$Ext,na.rm=T)

## Q 4
doc <- xmlTreeParse("baltimor.xml", useInternal=TRUE)
zipCodes <- xpathApply(rootNode, "//zipcode", xmlValue)
length(zipCodes[zipCodes == 21231])

## Q 5
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile="survey.csv")

DT <- fread("survey.csv")


