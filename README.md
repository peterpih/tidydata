## Repository for the Data Gathering and Cleaning Course Project

This repository contains files and programs for the course project for Coursera's Gathering and Cleaning Data course

### Contents of this repository
This repository contains the following files:

Input data files, of which there are eight:[1]
- **x_test.txt**, **x_train.txt** - data set of 561 variables(features) with multiple rows for activity observations
- **y_test.txt**, **y_train.txt** - a vector of activity ids with values between 1:6
- **subject_test.txt**, **subject_train.txt** - a vector of subject ids with values 1:30 for each of the 30 subjects
- **activity_labels.txt** - list of the 6 activities each of the 30 subjects performed
- **features.txt** - list of the original 561 variables(features) names

Solution data set file:
- **tidydata.txt** This file was written using write.file("tidydataset.txt", row.names=FALSE) and should be read in using read.file("tidydataset.txt")

Documentation files:
- **CodeBook.md**
- **README.txt** (from the original data set)[1] describes the original study where these data sets were obtained
- **features_info.txt** (from the original data set)[1] describes the original variable names. These names were then transformed into more descriptive names in the final tidy data set: https://github.com/peterpih/tidydata/edit/master/CodeBook.md

R Program:
- **run_analysis.R** This is the program to run on the input files. It transforms the original data set into a smaller "tidier" dataset with variables of interest.  The program is self-contained and assumes the data files are in its working directory. The output is "tidydata.txt".  With the input data files in its working directory, the user should be able to run "run_analysis.R" with the result being the output file "tidydata.txt". Please refer the CodeBook.md for further information on the files and their usage.


NOTE: The input data files need to be in the working directory of run_analysis.R to run successfully



**Footnotes**

[1] These data and documentation files are from:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human 
Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Website for data data study:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original data download link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

[2] The author of this study can be contacted at ppihcoursera@gmail.com with any questions, comments, or feedback on this study
