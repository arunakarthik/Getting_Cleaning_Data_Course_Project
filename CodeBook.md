Transformations
---------------

- After associating the feature names given in the features.txt to the training and test data frames, prepared a subset of the dataset by filtering out only the required columns using the column indices produced by **grep**.

- SubjectIds and LabelIds given in separate files were read and attached to the main dataset using **cbind** function

- Training and test data are combined into one single dataset using **rbind** function

- Activity names given in the activity_labels.txt file was associated to the data rows using **merge** function


Tidy dataset Variables
----------------------
**ActivityName** contains the name of the activity and **SubjectId** contains the id of the subject who performed the activity.

The calculated average of each variable for each activity and each subject are available in these variables:
 
- tBodyAccMeanX
- tBodyAccMeanY
- tBodyAccMeanZ
- tBodyAccStdX
- tBodyAccStdY
- tBodyAccStdZ
- tGravityAccMeanX
- tGravityAccMeanY
- tGravityAccMeanZ
- tGravityAccStdX
- tGravityAccStdY 
- tGravityAccStdZ 
- tBodyAccJerkMeanX
- tBodyAccJerkMeanY
- tBodyAccJerkMeanZ
- tBodyAccJerkStdX
- tBodyAccJerkStdY
- tBodyAccJerkStdZ
- tBodyGyroMeanX
- tBodyGyroMeanY
- tBodyGyroMeanZ
- tBodyGyroStdX
- tBodyGyroStdY
- tBodyGyroStdZ
- tBodyGyroJerkMeanX
- tBodyGyroJerkMeanY
- tBodyGyroJerkMeanZ
- tBodyGyroJerkStdX
- tBodyGyroJerkStdY
- tBodyGyroJerkStdZ
- tBodyAccMagMean 
- tBodyAccMagStd
- tGravityAccMagMean
- tGravityAccMagStd
- tBodyAccJerkMagMean
- tBodyAccJerkMagStd
- tBodyGyroMagMean
- tBodyGyroMagStd
- tBodyGyroJerkMagMean
- tBodyGyroJerkMagStd
- fBodyAccMeanX
- fBodyAccMeanY
- fBodyAccMeanZ
- fBodyAccStdX
- fBodyAccStdY
- fBodyAccStdZ
- fBodyAccJerkMeanX
- fBodyAccJerkMeanY
- fBodyAccJerkMeanZ
- fBodyAccJerkStdX
- fBodyAccJerkStdY
- fBodyAccJerkStdZ
- fBodyGyroMeanX
- fBodyGyroMeanY 
- fBodyGyroMeanZ
- fBodyGyroStdX
- fBodyGyroStdY
- fBodyGyroStdZ
- fBodyAccMagMean 
- fBodyAccMagStd
- fBodyBodyAccJerkMagMean
- fBodyBodyAccJerkMagStd
- fBodyBodyGyroMagMean
- fBodyBodyGyroMagStd
- fBodyBodyGyroJerkMagMean
- fBodyBodyGyroJerkMagStd
