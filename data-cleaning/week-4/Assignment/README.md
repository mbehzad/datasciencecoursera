Data-cleaning assignment
======================================

R script to collect, work, and clean a data set based on Human Activity Recognition Using Smartphones Data Set.


The dataset includes the following files:
=========================================

- 'README.txt': This readme file

- 'codeBook.md': information about the variables

- 'run_analysis.R': R code to precess the data.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

What it does:
======================================
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

How to use:
======================================
Run the run_analysis.R script. It download and extracts the data,
Merges the data, features, subject numbers in the "observations" table.

removes all the columns not mean() or std() in "measurements" table.

exports the tidyData to "data/tidyData.txt"

