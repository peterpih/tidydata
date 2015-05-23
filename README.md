## Repository for the Tidy Data Course Project

### Contents
This repository contains the following files:

Input data files:[1]
- x_test.txt, y_test.txt, subject_test.txt, x_train.txt, y_train.txt, subject_train.txt
- activity_labels.txt
- features.txt

Ouput file:
- tidydata.txt

Documentation files:
- **features_info.txt**[1]
- **CodeBook.md**

R Program:
- **run_analysis.R** This is the program to run on the input files. It transforms the original data set into a smaller "tidier" dataset with variables of interest.  The program is self-contained and assumes the data files are in its working directory. The output is "tidydata.txt".  Please refer the CodeBook.md for further information on the files and their usage.


[1] These data and documentation files are from:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human 
Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Website for data data study:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original data download link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
