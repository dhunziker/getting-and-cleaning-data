# Code Book

The raw data sets are a collection of signal measurements from accelerometers and gyroscopes of Samsung smartphones attached to a volunteer (subject) conducting several different activities. For this exercise, we were only interested in the mean and standard deviation of all the available measurements.

The original measurements are divided into 2 separate data sets called test and train.

This Code Book describes in detail how the raw data is processed in order to get a resulting data set containing only the averages of measurements mentioned above for each subject and activity.

## Merged Data Set

1. A vector with all the names for the measurements is loaded

2. A function is defined in order to process the test and train data sets in exactly the same way, these are the steps:

  1. The measurements, subjects and activities are loaded from files
  2. The mean and standard deviation columns are selected, any other columns are dropped
  3. The subject and activity columns are added as well as a column describing the type of measurement (test or train)
  
3. The previous function is called for both the test and train data sets

4. The test and train data sets are merged vertically, the type column described to which each of the rows belongs

5. The names for the measurements contained some invalid character that R automatically replaced with . (dots), all the names are cleared and CamelCase is used for all the column names

6. The activities that so far were numbers are replaced with descriptive values that have been loaded from file

The following lists show all the attributes available in the merged dataset:

### New Columns

- subject: the volunteer carrying the smartphone
- activity: one of the 6 possible activities during which the volunteer was measured [WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING]
- type: the type of measurement [test or train]

### Mean Values

- tBodyAccMeanX
- tBodyAccMeanY
- tBodyAccMeanZ
- tGravityAccMeanX
- tGravityAccMeanY
- tGravityAccMeanZ
- tBodyAccJerkMeanX
- tBodyAccJerkMeanY
- tBodyAccJerkMeanZ       
- tBodyGyroMeanX
- tBodyGyroMeanY
- tBodyGyroMeanZ
- tBodyGyroJerkMeanX      
- tBodyGyroJerkMeanY
- tBodyGyroJerkMeanZ
- tBodyAccMagMean
- tGravityAccMagMean
- tBodyAccJerkMagMean
- tBodyGyroMagMean
- tBodyGyroJerkMagMean
- fBodyAccMeanX
- fBodyAccMeanY
- fBodyAccMeanZ
- fBodyAccJerkMeanX
- fBodyAccJerkMeanY
- fBodyAccJerkMeanZ
- fBodyGyroMeanX
- fBodyGyroMeanY
- fBodyGyroMeanZ
- fBodyAccMagMean
- fBodyBodyAccJerkMagMean
- fBodyBodyGyroMagMean
- fBodyBodyGyroJerkMagMean

### Standard Deviation

- tBodyAccStdX
- tBodyAccStdY
- tBodyAccStdZ
- tGravityAccStdX
- tGravityAccStdY
- tGravityAccStdZ
- tBodyAccJerkStdX
- tBodyAccJerkStdY
- tBodyAccJerkStdZ
- tBodyGyroStdX
- tBodyGyroStdY
- tBodyGyroStdZ
- tBodyGyroJerkStdX
- tBodyGyroJerkStdY
- tBodyGyroJerkStdZ
- tBodyAccMagStd
- tGravityAccMagStd
- tBodyAccJerkMagStd
- tBodyGyroMagStd
- tBodyGyroJerkMagStd
- fBodyAccStdX
- fBodyAccStdY
- fBodyAccStdZ
- fBodyAccJerkStdX
- fBodyAccJerkStdY
- fBodyAccJerkStdZ
- fBodyGyroStdX
- fBodyGyroStdY
- fBodyGyroStdZ
- fBodyAccMagStd
- fBodyBodyAccJerkMagStd
- fBodyBodyGyroMagStd

Note that each measurement has been normalized and bounded within [-1,1]. For more details on the meaning of the actual measurements, visit the [Human Activity Recognition Using Smartphones Website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Aggregated Data Set

1. In this step I aggregated the merged data set by subject and activity using the mean function, dropping the type column in the process because it has no meaning anymore

2. The column names for this new aggregated data set are changed with Avg being appended as a suffix to each of the names above

3. The final result is printed to a file in order to be able to upload it to Coursera