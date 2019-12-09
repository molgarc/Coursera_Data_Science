library(dplyr)
setwd("C:/EMNOMIA/Data Science Specialization/Courses/Course 3/Week 4/Project")
filename <- "AssignmentCourse3.zip"

# Step 0: Checking if archive and folder exists.
if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, filename)
}  

if (!file.exists("Project")) { 
    unzip(filename) 
}

#Step 1a: Load dataframes and set descriptive names
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("feature_id","feature_name"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activity_id", "activity_name"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "person_id")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature_name)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_id")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "person_id")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature_name)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_id")

##Step 1b: Merge the training and the test sets to create one data set.
feature_data <- rbind(x_train, x_test)
activity_data <- rbind(y_train, y_test)
individual_data <- rbind(subject_train, subject_test)
fullAnalysisData <- cbind(individual_data, activity_data, feature_data)

##Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
meanStdAnalysisData <-select(fullAnalysisData, matches("person_id|activity_id|mean|std"))

##Step 3: Set descriptive names for activities. Change the activity_id of the activity to the activity name
meanStdAnalysisData$activity_id <- activities[meanStdAnalysisData$activity_id, 2]

##Step 4: Set descriptive names for columns. Look for patterns and substitute
names(meanStdAnalysisData)<-gsub("Acc", "accelerometer", names(meanStdAnalysisData),ignore.case = TRUE)
names(meanStdAnalysisData)<-gsub("Gyro", "gyroscope", names(meanStdAnalysisData),ignore.case = TRUE)
names(meanStdAnalysisData)<-gsub("BodyBody", "body", names(meanStdAnalysisData),ignore.case = TRUE)
names(meanStdAnalysisData)<-gsub("Mag", "magnitude", names(meanStdAnalysisData),ignore.case = TRUE)
names(meanStdAnalysisData)<-gsub("^t", "time", names(meanStdAnalysisData),ignore.case = TRUE)
names(meanStdAnalysisData)<-gsub("^f", "frequency", names(meanStdAnalysisData),ignore.case = TRUE)
names(meanStdAnalysisData)<-gsub("tBody", "timeBody", names(meanStdAnalysisData),ignore.case = TRUE)
names(meanStdAnalysisData)<-gsub("-mean()", "meanValue", names(meanStdAnalysisData), ignore.case = TRUE)
names(meanStdAnalysisData)<-gsub("-std()", "standardDeviation", names(meanStdAnalysisData), ignore.case = TRUE)
names(meanStdAnalysisData)<-gsub("-freq()", "frequency", names(meanStdAnalysisData), ignore.case = TRUE)
names(meanStdAnalysisData)<-gsub("angle", "angle", names(meanStdAnalysisData),ignore.case = TRUE)
names(meanStdAnalysisData)<-gsub("gravity", "gravity", names(meanStdAnalysisData),ignore.case = TRUE)

#Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Step 5a: Group by person_id and activity_id
meanStdAnalysisDataGrouped <- meanStdAnalysisData %>% group_by(person_id, activity_id)
#Step 5b: Average all the columns
meanStdAnalysisDataGroupedAveraged <- meanStdAnalysisDataGrouped %>% summarise_all("mean")  
#Step 5c: Average all the columns    
write.table(meanStdAnalysisDataGroupedAveraged, "TidyDataset.txt", row.name=FALSE)
str(meanStdAnalysisDataGroupedAveraged)
write.table(str(meanStdAnalysisDataGroupedAveraged), "TidyDatasetStr.txt", row.name=FALSE)
summary(meanStdAnalysisDataGroupedAveraged)
write.table(summary(meanStdAnalysisDataGroupedAveraged), "TidyDatasetSummary.txt", row.name=FALSE)
x <- data.frame(unclass(summary(meanStdAnalysisDataGroupedAveraged)),check.names = FALSE, stringsAsFactors = FALSE)
str(x,vec.len=6)