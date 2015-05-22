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
#
# This excercise is to make a smaller tidy-data data set from a larger one
# It involves having two parallel datasets (test and train) and merging them together
# The technique used here is to process each of the two data sets separately but in parallel
# and then merge them together
#
#
# Website for data:
#   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Data download:
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
#################################################################################################
#
# All input files need to be in the working directory
#
rm(list=ls())
#
# Read in the "test" data set
#
x_test <- read.table("x_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")
#
# Read in the "train" data set
#
x_train <- read.table("x_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")
#
# Merge the two data sets together
#
x_total <- rbind(x_test, x_train)
y_total <- rbind(y_test, y_train)
subject_total <- rbind(subject_test, subject_train)
#
# Clean up some temporary files
#
rm(x_train)
rm(y_train)
rm(subject_train)
rm(x_test)
rm(y_test)
rm(subject_test)
#
# Get the column names ("features") from the original data set
#
features <- read.table("features.txt")
#
# Add column names into the main data.frame
#
names(x_total) <- features$V2
#
# We need to extract the mean and standard deviation columns
# To do so, search for "mean" or "std" in the column names
#
# std_l - logical array for columns with "std"
# mean_l - logical array for columns with "mean"
#
std_l <- grepl("-std()", features$V2, fixed=TRUE)         # get the -std()
mean_l <- grepl("-mean()", features$V2, fixed=TRUE)       # get the -mean()

extracted_features<-features[std_l|mean_l,]
#
# Extract the necessary columns from the total
#
extracted_total <- x_total[std_l|mean_l]
#
# Add labels to the Activity and Subject data.frames
#
names(y_total)<- "Activity"
names(subject_total)<- "Subject"
#
# Put the subjects, activities, and variables together in "total"
#
total<-cbind(subject_total, y_total, extracted_total)
#
# Clean up some temproary stuff
rm(x_total)
rm(y_total)
rm(subject_total)
rm(std_l)
rm(mean_l)
rm(extracted_total)
#
####################################################################################################
#
#  This loop will compute the means of variables, by subject, by activity
#
rm(means_total)                                                       # delete any old version before running
means_total <- data.frame()                                           # initialize output data frame

subjects <- unique(total$Subject)                                     # a list of all the subjects
for (i in subjects){                                                  # loop through the subjects
      subject_subset <- subset(total, total$Subject == i )            # get each subject at a time
      
      activities <- unique(subject_subset$Activity)                   # list of the subject's activities
      for (j in activities){                                          # loop throug the activities
                                                                      # get each activity at  a time
          activity_subset<-subset(subject_subset, subject_subset$Activity == j)
          
          #
          # This loop has been set up to take advantgae of the fact that subject ids and activity ids 
          # are numeric at this point, so the average of the subject ids or activity ids are
          # the actual ids (since all values are the same)
          #
          colCount <- ncol(activity_subset)                           # get the number of columns
          means_activity <- data.frame()                              # where to put the means
          for (k in c(1:colCount)){                                   # loop through all columns
              means_activity <- c(means_activity, mean(activity_subset[, k]))
          }
          
          names(means_activity) <- names(total)                       # add to the output data.frame
          means_total <- rbind(means_total, as.data.frame(means_activity))
      }
}

####################################################################################
#
# Add the Activity label names into the dataset
#
activity_table <- read.table("activity_labels.txt")        # read the activity table in
names(activity_table) <- c("Index", "Activity")            # column names for the activity_table

activity_set<-unique(means_total$Activity)                 # the set of necessary activities to map from the data set
#
#  Loop through each of the activities replacing activity id with the character label
#
for (i in activity_set){
      use_activity <- activity_table$Activity[activity_table$Index == i]
      use_activity <- as.character(use_activity)
      means_total$Activity[means_total$Activity == i] <- use_activity
}

####################################################################################
#
# Modify the variable names to make more "tidy"
#
names(means_total) <- gsub("\\.\\.\\.","_", names(means_total))
names(means_total) <- gsub("\\.\\.","", names(means_total))
names(means_total) <- gsub("\\.","", names(means_total))
#
# Expand the abbreviations in the original variable names to something more readable
#
names(means_total) <- gsub("Acc","Accelerometer", names(means_total))
names(means_total) <- gsub("Gyro","Gyroscope", names(means_total))
names(means_total) <- gsub("Mag","Magnitude", names(means_total))
names(means_total) <- gsub("mean","Mean", names(means_total))
names(means_total) <- gsub("std","Std", names(means_total))
#
# add the "Average" prefix to all variable columns since they are the mean()s
#
names(means_total) <- gsub("^t","Averaget", names(means_total))
names(means_total) <- gsub("^f","Averagef", names(means_total))
#
# Save the results in  "tidydataset.txt"
#
write.table(means_total, file="tidydataset.txt", row.names=FALSE)
