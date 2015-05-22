#
# You should create one R script called run_analysis.R that does the following.
#
# 1. Merges the training and the test sets to create one data set
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average
#    of each variable for each activity and each subject.
#
#
#
# tidydata
# Getting and Cleaning Data - Course Project

# Website for data:
#   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Data download:
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

setwd("c:/R/tidydata")

x_test <- read.table("x_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

x_train <- read.table("x_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

features <- read.table("features.txt")

std <- grepl("-std()", features$V2, fixed=TRUE)         # get the -std()
mean <- grepl("-mean()", features$V2, fixed=TRUE)       # get the -mean()

w <- x_test[mean | std]

extracted_features<-features[std|mean,]
#
# add column names into the data frame
#
names(x_test)<-features$V2
names(x_train)<-features$V2

extracted_test <- x_test[std|mean]
extracted_train <- x_train[std|mean]

names(y_test)<- "Activity"
names(subject_test)<- "Subject"
names(y_train)<- "Activity"
names(subject_train)<- "Subject"

sub_test<-cbind(subject_test, y_test, extracted_test)
sub_train<-cbind(subject_train, y_train, extracted_train)

total <- rbind(sub_test, sub_train)


activities <- unique(total$Activity)


rm(means_total)
means_total <- data.frame()

subjects <- unique(total$Subject)
for (i in subjects){
      subject_subset <- subset(total, total$Subject == i )
      
      activities <- unique(subject_subset$Activity)
      for (j in activities){  
          activity_subset<-subset(subject_subset, subject_subset$Activity == j)
          
          colCount <- ncol(activity_subset)
          means_activity <- data.frame()
          for (k in c(1:colCount)){
              means_activity <- c(means_activity, mean(activity_subset[, k]))
          }
          
          names(means_activity) <- names(total)
          means_total <- rbind(means_total, as.data.frame(means_activity))
      }
}

#############################################################

activity_table <- read.table("activity_labels.txt")
names(activity_table) <- c("Index", "Activity")

x<- means_total

activity_set<-unique(means_total$Activity)
for (i in activity_set){
      use_activity <- activity_table$Activity[activity_table$Index == i]
      use_activity <- as.character(use_activity)
      means_total$Activity[means_total$Activity == i] <- use_activity
}

####################################################################################

names(means_total) <- gsub("\\.\\.\\.","_", names(means_total))
names(means_total) <- gsub("\\.\\.","", names(means_total))
names(means_total) <- gsub("\\.","", names(means_total))

names(means_total) <- gsub("Acc","Accelerometer", names(means_total))
names(means_total) <- gsub("Gyro","Gyroscope", names(means_total))
# names(means_total) <- gsub("Jerk","AngularVelocity", names(means_total))
names(means_total) <- gsub("Mag","Magnitude", names(means_total))
names(means_total) <- gsub("mean","Mean", names(means_total))
names(means_total) <- gsub("std","Std", names(means_total))
