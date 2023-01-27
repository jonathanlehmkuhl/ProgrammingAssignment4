# Uses the HAR data set to create two tidy data sets
# Firstly, one that contains mean and std for all measurements
# Secondly, one that contains for each activity and subject the average of the
# remaining variables of the first data set


# Load necessary libraries
library(dplyr)

# Extracting measurements, activities and subjects of the training data set.
# All columns are combined into the data frame df_training.
measurements_training <- read.table("UCI HAR Dataset/train/X_train.txt")
activities_training <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")
subject_training <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
df_training <- cbind(measurements_training, activities_training, subject_training)

# Same procedure for the test data set
measurements_test <- read.table("UCI HAR Dataset/test/X_test.txt")
activities_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
df_test <- cbind(measurements_test, activities_test, subject_test)

# Combining the rows of both data sets df_training and df_test
df_merged <- rbind(df_training, df_test)

# Extracting names for the measurement features and using them
# to get descriptive variable names for all columns
variable_names <- read.table("UCI HAR Dataset/features.txt")
names(df_merged)[1:561] <- variable_names[, 2]

# Creating the first tidy data set df:
# Selecting only the columns that measure mean and std for a particular measurement
df <- select(df_merged, grep("mean\\(\\)|std\\(\\)", names(df_merged)), "activity", "subject")

# Extracting the activity labels and using them to get descriptive values
# for the factor variable activity.
# Making the variable subject of class factor.
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
df$activity <- factor(df$activity, labels = activity_labels[, 2])
df$subject <- as.factor(df$subject)

# Creating the second tidy data set df_summarized:
# Grouping df by activity and subject and summarizing the other columns
# by applying the mean function
df_summarized <- df %>% group_by(activity, subject) %>% summarize_all(mean)
# Adding the prefix "average" for all variable names besides activity and subject
names(df_summarized)[-(1:2)] <- paste("average", names(df_summarized)[-(1:2)])

# Output
df_summarized