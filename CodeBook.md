---
title: "CodeBook"
output: html_document
date: "2023-03-04"
---

## Code Book

This document summarizes the resulting data fields in `output/tidy.txt`.

The raw data can be fetched using the `fetch` function from
`run_analysis.R`. This file also contains a `run_analysis` function which was
used to tidy the raw data and get the final `output/tidy.txt` dataset.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each
   measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with
   the average of each variable for each activity and each subject.

### Group Variables

- `subject` - subject's ID
- `activity` - activity in its readable form (see the values below)

#### Activity
- `LAYING`
- `SITTING`
- `STANDING`
- `WALKING`
- `WALKING_DOWNSTAIRS`
- `WALKING_UPSTAIRS`

### Measurements

- `tBodyAcc-mean()-X`
- `tBodyAcc-mean()-Y`
- `tBodyAcc-mean()-Z`
- `tBodyAcc-std()-X`
- `tBodyAcc-std()-Y`
- `tBodyAcc-std()-Z`
- `tGravityAcc-mean()-X`
- `tGravityAcc-mean()-Y`
- `tGravityAcc-mean()-Z`
- `tGravityAcc-std()-X`
- `tGravityAcc-std()-Y`
- `tGravityAcc-std()-Z`
- `tBodyAccJerk-mean()-X`
- `tBodyAccJerk-mean()-Y`
- `tBodyAccJerk-mean()-Z`
- `tBodyAccJerk-std()-X`
- `tBodyAccJerk-std()-Y`
- `tBodyAccJerk-std()-Z`
- `tBodyGyro-mean()-X`
- `tBodyGyro-mean()-Y`
- `tBodyGyro-mean()-Z`
- `tBodyGyro-std()-X`
- `tBodyGyro-std()-Y`
- `tBodyGyro-std()-Z`
- `tBodyGyroJerk-mean()-X`
- `tBodyGyroJerk-mean()-Y`
- `tBodyGyroJerk-mean()-Z`
- `tBodyGyroJerk-std()-X`
- `tBodyGyroJerk-std()-Y`
- `tBodyGyroJerk-std()-Z`
- `tBodyAccMag-mean()`
- `tBodyAccMag-std()`
- `tGravityAccMag-mean()`
- `tGravityAccMag-std()`
- `tBodyAccJerkMag-mean()`
- `tBodyAccJerkMag-std()`
- `tBodyGyroMag-mean()`
- `tBodyGyroMag-std()`
- `tBodyGyroJerkMag-mean()`
- `tBodyGyroJerkMag-std()`
- `fBodyAcc-mean()-X`
- `fBodyAcc-mean()-Y`
- `fBodyAcc-mean()-Z`
- `fBodyAcc-std()-X`
- `fBodyAcc-std()-Y`
- `fBodyAcc-std()-Z`
- `fBodyAccJerk-mean()-X`
- `fBodyAccJerk-mean()-Y`
- `fBodyAccJerk-mean()-Z`
- `fBodyAccJerk-std()-X`
- `fBodyAccJerk-std()-Y`
- `fBodyAccJerk-std()-Z`
- `fBodyGyro-mean()-X`
- `fBodyGyro-mean()-Y`
- `fBodyGyro-mean()-Z`
- `fBodyGyro-std()-X`
- `fBodyGyro-std()-Y`
- `fBodyGyro-std()-Z`
- `fBodyAccMag-mean()`
- `fBodyAccMag-std()`
- `fBodyBodyAccJerkMag-mean()`
- `fBodyBodyAccJerkMag-std()`
- `fBodyBodyGyroMag-mean()`
- `fBodyBodyGyroMag-std()`
- `fBodyBodyGyroJerkMag-mean()`
- `fBodyBodyGyroJerkMag-std()`

👆 Note that the values like `meanFreq()` are not a part of this tidy dataset as 
(in my opinion) it was left to interpretation whether to include them or not.
