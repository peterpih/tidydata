
## Code Book for Gathering and Cleaning Data Final Project

### Objective

This assignment uses the data set from studying using smartphones to monitor human activity[1]
https://github.com/peterpih/tidydata/blob/master/README.txt

The objective of this Final Project is to take a larger data set and create a smaller more "tidy" data set with: summary variables of interest, more descriptive variable names, and single activity observations per row, using an .R script program which requires no intervention.

### The Data Set

The original data set consists of 8 files, a "train" set, a "test" set, a variable name file which defines 561 columns of data(features), and an activities label file which defines 6 activities.

- x_test.txt, y_test.txt, subject_test.txt  (3 files)
- x_train.txt, y_train.txt, subject_train.txt  (3 files)
- features.txt (561 variable names) (1 file)
- activity_labels.txt (6 activity labels) (1 file)

These files will need to be in the working directory in order to properly run the assignment program.

There are 30 subjects in total performing 6 activities.
The orignal data has multiple observations for each activity by each subject.
The output data set is a summary measure (mean) for each of the 6 activities by each subject per row (180 rows)

### The Program: run_analysis.R

The program run_analysis.R takes the above mentioned input files and transforms the data set to produce a 180 x 68 data set of variable means. The program is self contained and expects the input data files to be in its working directory.

The original data set consists of observations of 6 different activities for 30 subjects.  These are stored in two separate vectors or lists for activities and subjects.  The orignal data set also has 561 different measurements from which we extract 66 variables which have mean() or std(). The subjects vector and activities vector are combined with the 66 measures resulting in 68 columns. The mean is then calculated for each of the 66 variables, by subject (30), by activity (6), resulting in a 180 x 68 data set.

The program is broken into various segments, instead of separate scripts called by a top level script. It is thought this would make it easier to maintain and conveninently makes the program itself, self-contained.

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
- None of the units of measurement have been changed from the original data set

### Naming of Feature Variables

The same syntax as the original variables names was maintained, however more descriptive naming has been
used. For example, when the original variable name used "Acc", the abbreviation has been changed
to "Accelerometer".

Modifications to variable names:
- "Acc" becomes "Accelerometer"
- "Gyro" becomes "Gyroscope"
- "Mag" becomes "Magnitude"
- "mean" becomes "Mean"  (maintaining camelling and readability)
- "std" becomes "Std"  (maintaining camelling and readability)
- "f" prefix becomes "Freq"  (maintaining camelling and readability)
- "t" prefix becomes "Time"  (maintaining camlling and readability)
- "BodyBody" becomes "Body"  (it was thought this was typing error)
- Every variable name has been prepended with  "Mean", since the resulting data set are all averages of the original data set
- Where appropriate, the axis of measurement (X,Y,Z) has been kept, preceeded by a "_" for easier reference

NOTE: in the original data set, axis of measurement were seperated with "-" which might cause computation errors

Variable names use the following syntax.  This reflects the naming covention from the original data set[1]. This convention is kept for ease of comparison with the original data set.

Part 1: ("Mean")("Time"|"Freq")("Body"|"Gravity")("Accelerometer"|"Gyroscope")

- "Mean" - all the variables in the solution data set are means
- "Time" or "Freq" - measurements are either with respect to time or frequency
- "Body" or "Gravity" - measurements are either made on the subjects body, or using gravity as a baseline
- "Accelerometer" or "Gyroscope" - the device used to take measurement, accelerometer being linear, gyroscope being angular

For example:

- MeanFreqBodyGyroscope - average of body measurements with respect to frequency using an gyroscope
- MeanTimeGravityAccelerometer - average of gravity measurements with respect to time using an accelerometer

> NOTE: There are only 8 measurements for gravity, they are all with respect to time and only measured with an accelerometer
> MeanTimeGravityAccelerometerMean_X
> MeanTimeGravityAccelerometerMean_Y
> MeanTimeGravityAccelerometerMean_Z
> MeanTimeGravityAccelerometerStd_X
> MeanTimeGravityAccelerometerStd_Y
> MeanTimeGravityAccelerometerStd_Z
> MeanTimeGravityAccelerometerMagnitudeMean>
> MeanTimeGravityAccelerometerMagnitudeStd

Additionally, the following is appended to Part 1 names:

Part 2: (""|"Jerk"|"Magnitude"|"JerkMagnitude")("Mean"|"Std")(""|"_X"|"_Y"|"_Z")

- "Jerk" - the change in acceleration(linear) or angular(rotation) momentum
- "Magnitude" - the amount of force
- "JerkMagnitude" - the change in the amount of force
- "Mean" - the mean(average) measurements
- "Std" - the standard deviation or the measurements
- "_X" or "_Y", or "_Z" - the Euclidian direction of force
- "" - an empty(skipped) naming element

For example:

- MeanTimeBodyAccelerometerMean_Z - average linear body acceleration measurement along the Z axis
- MeanTimeBodyAccelerometerMean - average linear body acceleration
- MeanTimeBodyAccelerometerJerkMean_X - change in average linear body acceleration measurement along the Z axis

> NOTE: Units of measurement have not been changed or rebased from the original data set.
> For example, readings from the accelerometer are in standard gravity "g" units, readings from gyroscopes are in radians/sec

Additional information for the original data set can be found here:

https://github.com/peterpih/tidydata/blob/master/features_info.txt


### Saved Data Set

The solution data set is saved as "tidydataset.txt".
It can be loaded using: data <- read.table("tidaydataset.txt")

The tidy variable(features) are contained in the first row of the data set.

Whereas the original data set had multiple observations per activity per subject, this new data set has a unique summary(mean) observation for each measurement(feature) in each column and for each activity and each subject per row, as denotes a "tidy" data set.

### List of Variables(Features)

- 1 Subject   subject id
- 2 Activity  one of 6 activities performed by each subject
- 3 AverageTimeBodyAccelerometerMean_X  average of subject linear acceleration along X axis
- 4 AverageTimeBodyAccelerometerMean_Y  average of subject linear acceleration along Y axis
- 5 AverageTimeBodyAccelerometerMean_Z  average of subject linear acceleration along Z axis
- 6 AverageTimeBodyAccelerometerStd_X  standard deviation of subject linear acceleration along X axis
- 7 AverageTimeBodyAccelerometerStd_Y  standard deviation of subject linear acceleration along Y axis
- 8 AverageTimeBodyAccelerometerStd_Z  standard deviation of subject linear acceleration along Z axis




### Footnotes

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human 
Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
