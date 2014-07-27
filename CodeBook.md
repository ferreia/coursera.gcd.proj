### Introduction

This file describes the data in the file tidy.txt


### Columns in tidy.txt
This file contains a table with the following columns:

- `subject` : an integer number of the subject performing the experiment;
- `activity` : a descriptive value of the activity being performed one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING;
- `variable` : The variable whose values have been aggregated by `subject` and `activity`;
- `mean` : the mean value of a feature whose name is described in the column `variable`. The selected features were the means or standard deviations of other variables in the original code book (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#). The original variables contained  3-axial (X,Y and Z) raw and transformed signals extracted from the accelerometer and gyroscope of a Samsung Galaxy S II mobile phone. Below are all the original features that were used:
 tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, tBodyAcc-std()-X, 
 tBodyAcc-std()-Y, tBodyAcc-std()-Z, tGravityAcc-mean()-X, tGravityAcc-mean()-Y, 
 tGravityAcc-mean()-Z, tGravityAcc-std()-X, tGravityAcc-std()-Y, tGravityAcc-std()-Z, 
 tBodyAccJerk-mean()-X, tBodyAccJerk-mean()-YvtBodyAccJerk-mean()-Z, tBodyAccJerk-std()-X, 
 tBodyAccJerk-std()-Y, tBodyAccJerk-std()-Z, tBodyGyro-mean()-X, tBodyGyro-mean()-Y, 
 tBodyGyro-mean()-Z, tBodyGyro-std()-X, tBodyGyro-std()-Y, tBodyGyro-std()-Z, 
 tBodyGyroJerk-mean()-X, tBodyGyroJerk-mean()-Y, tBodyGyroJerk-mean()-Z, tBodyGyroJerk-std()-X, 
 tBodyGyroJerk-std()-Y, tBodyGyroJerk-std()-Z, tBodyAccMag-mean(), tBodyAccMag-std(), 
 tGravityAccMag-mean(), tGravityAccMag-std(), tBodyAccJerkMag-mean(), tBodyAccJerkMag-std(), 
 tBodyGyroMag-mean(), tBodyGyroMag-std(), tBodyGyroJerkMag-mean(), tBodyGyroJerkMag-std(), 
 fBodyAcc-mean()-X, fBodyAcc-mean()-Y, fBodyAcc-mean()-Z, fBodyAcc-std()-X, 
 fBodyAcc-std()-Y, fBodyAcc-std()-Z, fBodyAccJerk-mean()-X, fBodyAccJerk-mean()-Y, 
 fBodyAccJerk-mean()-Z, fBodyAccJerk-std()-X, fBodyAccJerk-std()-Y, fBodyAccJerk-std()-Z, 
 fBodyGyro-mean()-X, fBodyGyro-mean()-Y, fBodyGyro-mean()-Z, fBodyGyro-std()-X, 
 fBodyGyro-std()-Y, fBodyGyro-std()-Z, fBodyAccMag-mean(), fBodyAccMag-std(), 
 fBodyBodyAccJerkMag-mean()  fBodyBodyAccJerkMag-std(), fBodyBodyGyroMag-mean(), fBodyBodyGyroMag-std(), 
 fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std() 

### Data Transformations
* The feature names in the column `variable` have been modified to make them more readable: '()' were removed and '-' were replaced with '.'
* The activity values were converted to factors and instead of the numerical values, textual descriptions were used in the column `activity`
