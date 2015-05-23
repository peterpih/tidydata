
## Code Book for Gathering and Cleaning Data Final Project

### The Data Set
This assignment uses the data set from the Samsung 

The original data set consists of 8 files, a training set and text set of 3 files each: x_, y_, subjects_; and a variable name file which defines 561 columns of data, and a activities label file.

- x_test.txt, y_test.txt, subject_test.txt
- x_train.txt, y_train.txt, subject_train.txt
- activity_labels.txt
- features.txt (variable names)

These files will need to be in the working directory in order to properly run the assignment program.

There are 30 subjects total with 6 activities.
The orignal data has multiple observations for each activity byt each subject. The output data set will have a summary measure (mean) for each of the activities.

### The Program: run_analysis.R

The program run_analysis.R takes the above mentioned input files and transforms the data set to produce a 180 x 68 data set of variable means. The program is self contained and expects the input data files to be in its working directory.

The original data set consists of observations of 6 different activities for 30 subjects.  These are stored in two separate vectors or lists.  The orignal data set also has 561 different measurements from which we extract 66 variables for mean() and std(). The subjects and activities are combined with the 66 measures resulting in 68 columns. The mean is calculated for each of the 66 variables, by subject (30), by activity (6).

The program is broken into various segments instead of separate scripts called by a top level script. It is thought this would make it easier to maintain and conveninently makes the program itself, self-contained.

Step 1. Combine the test and train data sets to create a 10299 x 66 dataframe of measurements and two 10299 x 1 vectors for activity and subject

Step 2. Combine the two vectors with the larger data set to create a 10299 x 68 data set

Step 3. Extracts the required 66 columns from the 561 original columns.

Step 4. Loop over subject (30) by activity (6) caluclating means to create a 180 x 68 output dataset

Step 5. Modify the variable names to make more descriptive.

Step 6. Save the new data set


### Transformations to the Data Set

Certain major modifications were made to the original data set:

- The "test" and "train" data sets were merged into a single combined data set. This formed the original primary data set which was then split into these two data sets
- Certain specified variables were extracted from the combined data set, variables containing mean() and std() forming a subset of 66 variables from the original 561 variables
- Feature variable names were expanded for readability
- Activity labels were were added in place if activity id codes for readability

### Naming of Feature Variables

The same syntax as the original variables names was maintained, however more descriptive naming has been
used. For example, when the original variable name used "Acc", the abbreviation has been changed
to "Accelerometer".

Additional changes:
- Acc becomes Accelerometer
- Gyro becomes Gyroscope
- Mag becomes Magnitude

Other modifications are:
- Every variable name begins with "Average", since the are all averages of the original data set
- "mean" and "std" have been changed to "Mean" and "Std" to maintain camelling and readability
- Where appropriate, the axis of measurement (X,Y,Z) has been kept, preceeded by a "-"

### Saved Data Set

The final data set is saved as tidaydata.txt.
Whereas the original data set had multiple observations per activity per subject, this new data set has a unique observation of the activity mean for each measurement for each subject.

