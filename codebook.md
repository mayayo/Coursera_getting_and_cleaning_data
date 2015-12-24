run_analysis.R

This script works as follows: 

1. Download the zipped data file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the file 
3. Load activity label dataframe from .txt
4. Load features dataframe from .txt, used for the columns in the dataset 
5. Load the training set and the testing set dataframes: 
    -- loads X_train.txt, y_train.txt, subject_train.txt
    --- loads X_test.txt, y_test.txt, subject_test.txt

  X_train --> IT contains the data using the feature data set as columns
  y_train  --> It contains the activity labels
  subject_train --> It contains the ids of the subjects 
   
6. After this, the script extracts only the mean and standard deviation features (measurements) from training and test X datasets
7. Merge training and test datasets
8. Add labels for each measurement, taking the names of the variables
9. Label the data set with descriptive variable names, converting as factors so we can created the tidy dataset that has the average of each variable for each activity and each subject.
10. Writes this tidy dataset into a "tidy_file.txt" file

   

    

tidy_file.txt

From Dataframe that contains 181 rows (including header), and 82 columns 

These are the variables of the tidy dataframe:

    subject_id
    activity
    "tBodyAcc-mean()-X" 
    "tBodyAcc-mean()-Y" 
    "tBodyAcc-mean()-Z"
    "tBodyAcc-std()-X"
    "tBodyAcc-std()-Y" 
    "tBodyAcc-std()-Z" 
    "tGravityAcc-mean()-X"
    "tGravityAcc-mean()-Y"
    "tGravityAcc-mean()-Z" 
    "tGravityAcc-std()-X"
    "tGravityAcc-std()-Y"
    "tGravityAcc-std()-Z" 
    "tBodyAccJerk-mean()-X" 
    "tBodyAccJerk-mean()-Y"
    "tBodyAccJerk-mean()-Z" 
    "tBodyAccJerk-std()-X" 
    "tBodyAccJerk-std()-Y"
    "tBodyAccJerk-std()-Z" 
    "tBodyGyro-mean()-X"
    "tBodyGyro-mean()-Y" 
    "tBodyGyro-mean()-Z" 
    "tBodyGyro-std()-X"
    "tBodyGyro-std()-Y"
    "tBodyGyro-std()-Z" 
    "tBodyGyroJerk-mean()-X"
    "tBodyGyroJerk-mean()-Y" 
    "tBodyGyroJerk-mean()-Z" 
    "tBodyGyroJerk-std()-X" 
    "tBodyGyroJerk-std()-Y"
    "tBodyGyroJerk-std()-Z"
    "tBodyAccMag-mean()" 
    "tBodyAccMag-std()"
    "tGravityAccMag-mean()"
    "tGravityAccMag-std()" 
    "tBodyAccJerkMag-mean()"
    "tBodyAccJerkMag-std()"
    "tBodyGyroMag-mean()" 
    "tBodyGyroMag-std()" 
    "tBodyGyroJerkMag-mean()"
    "tBodyGyroJerkMag-std()" 
    "fBodyAcc-mean()-X"
    "fBodyAcc-mean()-Y"
    "fBodyAcc-mean()-Z" 
    "fBodyAcc-std()-X" 
    "fBodyAcc-std()-Y"
    "fBodyAcc-std()-Z"
    "fBodyAcc-meanFreq()-X" 
    "fBodyAcc-meanFreq()-Y" 
    "fBodyAcc-meanFreq()-Z"
    "fBodyAccJerk-mean()-X" 
    "fBodyAccJerk-mean()-Y" 
    "fBodyAccJerk-mean()-Z" 
    "fBodyAccJerk-std()-X" 
    "fBodyAccJerk-std()-Y" 
    "fBodyAccJerk-std()-Z"
    "fBodyAccJerk-meanFreq()-X" 
    "fBodyAccJerk-meanFreq()-Y"
    "fBodyAccJerk-meanFreq()-Z" 
    "fBodyGyro-mean()-X" 
    "fBodyGyro-mean()-Y" 
    "fBodyGyro-mean()-Z"
    "fBodyGyro-std()-X"
    "fBodyGyro-std()-Y" 
    "fBodyGyro-std()-Z" 
    "fBodyGyro-meanFreq()-X" 
    "fBodyGyro-meanFreq()-Y" 
    "fBodyGyro-meanFreq()-Z" 
    "fBodyAccMag-mean()" 
    "fBodyAccMag-std()" 
    "fBodyAccMag-meanFreq()" 
    "fBodyBodyAccJerkMag-mean()" 
    "fBodyBodyAccJerkMag-std()" 
    "fBodyBodyAccJerkMag-meanFreq()"
    "fBodyBodyGyroMag-mean()" 
    "fBodyBodyGyroMag-std()" 
    "fBodyBodyGyroMag-meanFreq()"
    "fBodyBodyGyroJerkMag-mean()" 
    "fBodyBodyGyroJerkMag-std()" 
    "fBodyBodyGyroJerkMag-meanFreq()"
    
    
