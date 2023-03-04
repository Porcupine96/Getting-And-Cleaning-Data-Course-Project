# The goal of the following script is to perform the following steps:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject

library(dplyr)

fetch <- function (url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip") {
  # 1. Fetch the dataset and store it under the data/ directory
  # 2. Unzip the data
  
  if (!dir.exists("data")) dir.create("data")
  
  download.file(url, "data/dataset.zip")
  unzip("data/dataset.zip", exdir="data")
}

load <- function (traintest) {
  # Load the train/test dataset and assign a descriptive name to each column 
  
  if (!traintest %in% c("train", "test")) stop("Invalid traintest!")
  
  activity_label_path <- "data/UCI HAR Dataset/activity_labels.txt"
  feature_path <- "data/UCI HAR Dataset/features.txt"
  subject_path <- paste("data/UCI HAR Dataset/", traintest, "/subject_", traintest, ".txt", sep = "")
  X_path <- paste("data/UCI HAR Dataset/", traintest, "/X_", traintest, ".txt", sep = "")
  y_path <- paste("data/UCI HAR Dataset/", traintest, "/y_", traintest, ".txt", sep = "")
  
  labels <- read.table(activity_label_path, col.names = c("activity_id", "activity"))
  features <- read.table(feature_path)
  subjects <- read.table(subject_path)
  X <- read.table(X_path)
  y <- read.table(y_path, col.names = "activity_id")
  y$index <- seq_along(y$activity_id)
  y <- merge(y, labels, by="activity_id") %>% arrange(index)

  df <- cbind(subjects, y[,"activity"], X)
  colnames(df) <- c("subject", "activity", features[,2])
  df
}

run_analysis <- function () {
  # load & merge the train/test datasets
  # the columns already have descriptive names
  train <- load("train")
  test <- load("test")
  df <- rbind(train, test)
  
  # pick only the subject/activity/-mean()/-std() columns
  names <- colnames(df)
  df <- df[,grep("^subject$|^activity$|-mean\\(\\)|-std\\(\\)", names)]
  
  # calculate a mean for each subject-activity pair and order by subject
  res <- df %>%
    group_by(subject, activity) %>%
    summarize(across(where(is.numeric), mean)) %>%
    arrange(subject) 
  
  if (!dir.exists("output")) dir.create("output")

  write.table(res, "output/tidy.txt", row.names = FALSE)
  
  res
}