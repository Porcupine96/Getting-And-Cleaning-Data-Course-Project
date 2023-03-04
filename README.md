# Getting and Cleaning Data Course Project


This is a solution to the project from "Getting and Cleaning Data Course
Project" Coursera course.

The goal of this assignment was to implement an .R script that performs the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each
   measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with
   the average of each variable for each activity and each subject.

## Implementation

The implementation resides in `run_analysis.R` file and it consists of three functions.

- `fetch` - fetch the dataset, store it in the data directory and unzip it
- `load` - loads the train/test dataset setting the readable feature labels
- `run_analysis` - reads both datasets using the `load` function and performs the remaining steps:
  1. merges the train/test datasets
  2. picks only the "mean()" / "std()" mesurements
  3. groups the data by (subject, activity) calculating a mean for each group
  4. saves the tidy dataset to a file

As a result of running the `run_analysis` function we get a tidy dataset stored
under `output/tidy.txt`. The description of the resulting dataset can be found
in the `CodeBook.R` file.

