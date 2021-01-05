library(dplyr)
filename <- "Getting_and_Cleaning_data.zip"
if (!file.exists("")){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, filename, method="curl")
}  

if (!file.exists("UCI HAR Dataset")) { 
    unzip(filename) 
}

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

X <- rbind(x_train,x_test)
Y <- rbind(y_train,y_test)
subject <- rbind(subject_train,subject_test)
mergedData <- cbind(subject,Y,X)

tidyData <- mergedData %>% select(subject,code,contains("mean"),contains("std"))
tidyData$code <- activities[TidyData$code, 2]

names(tidyData)[2] <- "activity"
names(tidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(tidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(tidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(tidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(tidyData)<-gsub("^t", "Time", names(TidyData))
names(tidyData)<-gsub("^f", "Frequency", names(TidyData))
names(tidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(tidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(tidyData)<-gsub("angle", "Angle", names(TidyData))
names(tidyData)<-gsub("gravity", "Gravity", names(TidyData))

FinalData <- tidyData %>% group_by(subject, activity) %>% summarize_all(funs(mean)) %>% print
write.table(FinalData, "FinalData.txt", row.name=FALSE)