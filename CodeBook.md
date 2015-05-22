
This is the CodeBook.md
## Code Book for the Final Program for Gathering and Cleaning Data

## Data Set
This assignment uses the data set from the Samsung 

## Transformations to the Data Set


##
## Naming of Feature Varilables
##
The same syntax for the variables names was maintained, however more descriptive naming has been
used. For example, when the original variable name used "Acc", the abbreviation has been changed
to "Accelerometer".

Previous Name           New Name
Acc                     Accelerometer
Gyro                    Gyroscope
Mag                     Magnitude

Other transformation are:
1) Every variable begins with "Avg", since the are all averages of the original data set
2) "mean" and "std" have been changed to "Mean" and "Std" to maintain camelling and readability
3) Where appropriate, the axis of measurement (X,Y,Z) has been kept, preceeded by a "-"
