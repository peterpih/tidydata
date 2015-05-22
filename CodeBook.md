
## Code Book for Gathering and Cleaning Data Final Project

### The Data Set
This assignment uses the data set from the Samsung 

The original data set consists of 8 files, a training set and text set of 3 files each: x_, y_, subjects_; and a variable name file which defines 561 columns of data, and a activities label file.

- x_test.txt, y_test.txt, subject_test.txt
- x_train.txt, y_train.txt, subject_train.txt
- activity_labels.txt
- features.txt (variable names)

These files will need to be in the working directory in order to properly run the assignment program.

### The Program run_analysis.R

The program run_analysis.R takes the above mentioned input files and transforms the data set to produce a 180 x 68 data set of variable means. The program is self contained and expects the input data files to be in its working directory.

The original data set consists of observations of 6 different activities for 30 subjects.  These are stored in two separate vectors or lists.  The orignal data set also has 561 different measurements from which we extract 66 variables for mean() and std(). The subjects and activities are combined with the 66 measures resulting in 68 columns. The mean is calculated for each of the 66 variables, by subject (30), by activity (6).

The program is broken into various segments instead of separate scripts called by a top level script. It is thought this would make it easier to maintain and conveninently makes the program itself, self-contained.

Step 1. it combines the test and train data sets including 

Step 2. Filters out


### Transformations to the Data Set

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

Two versions of the final data set have been saved: tidaydata.txt and tidydata_withlabels.txt.
The original assignment specifically asks to save without labels: tidydata.txt
The second version have the modified column names.
