
## Code Book for the Code Project for
## Gathering and Cleaning Data


## The Data Set
This assignment uses the data set from the Samsung 

## Transformations to the Data Set


##
## Naming of Feature Variables
##
The same syntax for the variables names was maintained, however more descriptive naming has been
used. For example, when the original variable name used "Acc", the abbreviation has been changed
to "Accelerometer".

#Previous Name           New Name
Acc -> Accelerometer
Gyro -> Gyroscope
Mag -> Magnitude

Other modifications are:
# Every variable begins with "Average", since the are all averages of the original data set
# "mean" and "std" have been changed to "Mean" and "Std" to maintain camelling and readability
# Where appropriate, the axis of measurement (X,Y,Z) has been kept, preceeded by a "-"

## Saved Data Set

Two versions of the final data set have been saved: tidaydata.txt and tidydata_withlabels.txt.
The original assignment specifically asks to save without labels: tidydata.txt
The second version have the modified column names.
