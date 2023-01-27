# Codebook for Programming Assignment 4

In the following we describe the variables of the output data frame of run_analysis.R as well as all transformations that were performed on the [original data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Variables

Note: 'average tBodyAcc-(mean()\|std())-(X\|Y\|Z)' means that there are 6 variables that are constructed by taking 'tBodyAcc', then taking either the mean() or the std() of it and then taking either X or Y or Z coordinate.

| Variables                                       | Description                                          | Range                                                                    |
|----------------------------|----------------------|----------------------|
| activity                                        | The activity that was performed by the proband       | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING |
| subject                                         | The index of the proband that performed the activity | 1-30                                                                     |
| average tBodyAcc-(mean()\|std())-(X\|Y\|Z)      | average value of mean/std of tBodyAcc for X/Y/Z      | [-1,1]                                                                   |
| average tGravityAcc-(mean()\|std())-(X\|Y\|Z)   | average value of mean/std of tGravityAcc for X/Y/Z   | [-1,1]                                                                   |
| average tBodyAccJerk-(mean()\|std())-(X\|Y\|Z)  | average value of mean/std of tBodyAccJerk for X/Y/Z  | [-1,1]                                                                   |
| average tBodyGyro-(mean()\|std())-(X\|Y\|Z)     | average value of mean/std of tBodyGyro for X/Y/Z     | [-1,1]                                                                   |
| average tBodyGyroJerk-(mean()\|std())-(X\|Y\|Z) | average value of mean/std of tBodyGyroJerk for X/Y/Z | [-1,1]                                                                   |
| average tBodyAccMag-(mean()\|std())             | average value of mean/std of tBodyAccMag             | [-1,1]                                                                   |
| average tGravityAccMag-(mean()\|std())          | average value of mean/std of tGravityAccMag          | [-1,1]                                                                   |
| average tBodyAccJerkMag-(mean()\|std())         | average value of mean/std of tBodyAccJerkMag         | [-1,1]                                                                   |
| average tBodyGyroMag-(mean()\|std())            | average value of mean/std of tBodyGyroMag            | [-1,1]                                                                   |
| average tBodyGyroJerkMag-(mean()\|std())        | average value of mean/std of tBodyGyroJerkMag        | [-1,1]                                                                   |
| average fBodyAcc-(mean()\|std())-(X\|Y\|Z)      | average value of mean/std of fBodyAcc for X/Y/Z      | [-1,1]                                                                   |
| average fBodyAccJerk-(mean()\|std())-(X\|Y\|Z)  | average value of mean/std of fBodyAccJerk for X/Y/Z  | [-1,1]                                                                   |
| average fBodyGyro-(mean()\|std())-(X\|Y\|Z)     | average value of mean/std of fBodyGyro for X/Y/Z     | [-1,1]                                                                   |
| average fBodyAccMag-(mean()\|std())             | average value of mean/std of fBodyAccMag             | [-1,1]                                                                   |
| fBodyBodyAccJerkMag-(mean()\|std())             | average value of mean/std of fBodyAccJerkMag         | [-1,1]                                                                   |
| fBodyBodyGyroMag-(mean()\|std())                | average value of mean/std of fBodyBodyGyroMag        | [-1,1]                                                                   |
| fBodyBodyGyroJerkMag-(mean()\|std())            | average value of mean/std of fBodyBodyGyroJerkMag    | [-1,1]                                                                   |

For the meaning of the original variables tBodyAcc-mean()-X, fBodyBodyAccJerkMag-mean(), etc., note the description in the file features_info of the original data set. Also note the README.txt of the original data set.

## Transformations

The following transformation were applied on the original data set.

1.  The training and test data sets were constructed by joining the measurements with the corresponding activities and subjects.
2.  Both data sets were merged.
3.  Descriptive variable names were introduced for the measurements, given by features.txt
4.  From the measurements only mean and std values were kept.
5.  The variables activity and subject were coerced into factor with the labels of activity being taken out of activity_labels.txt. This gives the first tidy data set.
6.  A second tidy data set, the output of the script, was created by grouping by activity and subject and taking the mean of all remaining variables. Here, the remaining variables were renamed by introducing the prefix 'average' to take into account that these are now the average values over all instances for a particular activity and subject.
