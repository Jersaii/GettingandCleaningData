---
title: "Code Book"
author: "Brandon"
date: "1/4/2021"
output: pdf_document
---

1.  **Download the data set**

Data set downloaded under the folder name: "UCI HAR Dataset". Extracted from <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>



2.  **Assign each data to variables**


```features <- features.txt``` : 561 rows, 2 columns

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

```activities <- activity_labels.txt``` : 6 rows, 2 columns

Links the class labels with their activity name.

```subject_test <- test/subject_test.txt``` : 2947 rows, 1 column

contains test data of 9/30 volunteer test subjects being observed

```x_test <- test/X_test.txt``` : 2947 rows, 561 columns

Test set

```y_test <- test/y_test.txt``` : 2947 rows, 1 columns

Test labels

```subject_train <- test/subject_train.txt``` : 7352 rows, 1 column

contains train data of 21/30 volunteer subjects being observed

```x_train <- test/X_train.txt``` : 7352 rows, 561 columns

Links the class labels with their activity name

```y_train <- test/y_train.txt``` : 7352 rows, 1 columns

Training labels



3.  **Merges the training and the test sets to create one data set**


```X``` created by merging ```x_train``` and ```x_test```using ```rbind()``` function

```Y``` created by merging ```y_train``` and ```y_test```using ```rbind()``` function

```subject``` created by merging ```subject_train``` and ```subject_test```using ```rbind()``` function

```mergedData``` created by merging ```Subject```, ```X```and `Y` using ```cbind()``` function



4.  **Extracts only the measurements on the mean and standard deviation for each measurement**


`tidyData` created by subseting `mergedData` using `select` function, selecting columns: `subject`,`code` and all columns labels that contain either the word 'mean' or 'std'



5.  **Uses descriptive activity names to name the activities in the data set**


All numbers in `code` column replaced by their corresponding activity, taken from the `activities` data table.



6.  **Appropriately labels the data set with descriptive variable names**


`code` column from `tidyData` renamed as `activities`, since step 5 was achieved

All `Acc` in column labels were replaced by `Accelerometer`

All `Gyro` in column labels were replaced by `Gyroscope`

All `BodyBody` in column labels were replaced by `Body`

All `Mag` in column labels were replaced by `Magnitude`

All `Gyro` in column labels were replaced by `Gyroscope`

All `tBody` in column labels were replaced by `TimeBody`

All `-mean()` in column labels were replaced by `Mean`

All `-std()` in column labels were replaced by `STD`

All `-freq()` in column labels were replaced by `Frequency`

All `angle` in column labels were replaced by `Angle`

All `gravity` in column labels were replaced by `Gravity`

All `-mean()` in column labels were replaced by `Mean`

All initial All `t`s in column labels were replaced by `Time`

All initial All `f`s in column labels were replaced by `Frequency`



7.  **From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**


`FinalData` is created by grouping `tidyData` by `subject` and `activity`, and then summarizing `FinalData` by taking the means of all columns.

Finally, `FinalData` was exported into `FinalData.txt`






