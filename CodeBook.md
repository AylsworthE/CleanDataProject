# Codebook for the tidy dataset (tidydata.txt ) produced by the run_analysis.R script

The final output contains the means and standard deviations for 66 measurements taken from 30 unique individuals performing six different physical activities.

## Identifying variables - group, subject, and activity

  **group**
  Two-level factor vector identifying which subjects and their data were randomly assigned for the experiment presented in (Anguita et al 2012).
  - test - 9 subjects
  - train - 21 subjects
  
  **subject**
  This is a 30-level factor vector identifying observations from the 30 individuals, aged 19-48, who wore a Samsung Smartphone while performing various activities.
  
  **activity**
  Six-level factor vector identifying observations corresponding to one of six types of activities:
  1) walk - Walking (dynamic activity)
  2) walkup - Walking upstairs (dynamic activity)
  3) walkdown - Walking downstairs (dynamic activity)
  4) sit - Sitting (static activity)
  5) stand - Standing (static activity)
  6) lay - Laying down (static activity)
  
## Measurement variables

The averages of all means and standard deviation pairs of measurements (or features) by subject and activity type are presented

Only pairs of means and standard deviations from the measurements taken directly from the accelerometer and the gyroscope on the Samsung Smartphone device are included in the tidydata.txt

Variables preceded with a 't' refer to measurements from the accelerometer, measured in 'g's (gravity of earth -> 9.80665 m/seg2).

Variables preceded with 'f' are measurements from the gyroscope, measured in rad/seg. 

The 'XYZ' of some variables indicates measurements made in three-dimensional space. There is an average mean and standard deviation for each of measurements below, as well as each direction, XYZ, resulting in 66 variables.

For example, tBodyAcc - XRY produces in six variables:
* tBodyAcc-mean()-X _and_ tBodyAcc-std()-X
* tBodyAcc-mean()-Y _and_ tBodyAcc-std()-Y
* tBodyAcc-mean()-Z _and_ tBodyAcc-std()-Z

In conrast, tBodyAccMag produces only two variables: tBodyAccMag-mean() _and_ tBodyAccMag-std()

Here is the complete list of features from the original data that are included as variables in the final dataset:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

## Original Data 

The tidydata.txt dataset was produced from a more extensive dataset provided publicly [HERE](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description of the experiment and explanation of the variables may be found [HERE](http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions)

## CITATION FOR ORIGINAL DATA

Jorge-L. Reyes-Ortiz, Luca Oneto, Albert SamÃ , Xavier Parra, Davide Anguita. Transition-Aware Human Activity Recognition Using Smartphones. Neurocomputing. Springer 2015.
