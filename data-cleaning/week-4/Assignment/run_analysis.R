dataFolder <- "data"

if (dir.exists(dataFolder)) {
  dir.create(dataFolder)
}

dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "data/dataSet.zip"
download.file(dataUrl, destfile = destfile,method = curl)

unzip(destfile, exdir=dataFolder)

## load libs
library(dplyr)
library(data.table)

features<- read.table("data/UCI HAR Dataset/features.txt",header = FALSE)

X_test <- read.table("data/UCI HAR Dataset/test/X_test.txt",header = FALSE)
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt",header = FALSE)
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt",header = FALSE)

X_train <- read.table("data/UCI HAR Dataset/train/X_train.txt",header = FALSE)
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt",header = FALSE)
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt",header = FALSE)

## 1 Merges the training and the test sets to create one data set.
## merge train and test set
subjectNums <- rbind(subject_train, subject_test)
activityNums <- rbind(y_train, y_test)
observations <- rbind(X_train, X_test)
## add activity label to table
observations <- cbind(subjectNums, activityNums, observations)

## colnames fron feature list + activity label
colNames <- c("subject_number", "activity_number", as.character(features[, 2]))
## rename col names
names(observations) <- colNames
## remove dublicate cols
observations <- observations[, unique(colnames(observations))]
observations <- data.table(observations)
setkey(observations, "subject_number", "activity_number")

## 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
measurements <- observations %>%
  select(matches('mean\\(\\)|std\\(\\)'))

## 3 Uses descriptive activity names to name the activities in the data set
## read label names
activityLabels <- read.table("data/UCI HAR Dataset/activity_labels.txt",header = FALSE)
## add labels names according to the activity num
descriptivActivity <- mutate(observations,
               activity_lable = activityLabels[activity_number, 2])


## 4 Appropriately labels the data set with descriptive variable names. 
names(observations)<-gsub("BodyAcc-","Body acceleration signal ",names(observations))
names(observations)<-gsub("Gyro","(from the gyroscope)",names(observations))

## 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData <- observations %>% 
  group_by(subject_number, activity_number) %>% 
  summarise_all(mean)

write.table(tidyData, "data/tidyData.txt", row.name=FALSE)

