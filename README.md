
##Steps to work on this course project

1.Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder after extracting the zip file.

2.Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.

3.Run source("run_analysis.R"), then it will generate a new file averages_data.txt in your working directory.

#The script run_analysis.R performs the 5 steps described in the course project's definition.

1.First, all the similar data as in X_Train/X_Test, y_train/y_test and subject_train/subject_test is merged using the rbind() function.

2.Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.

3.As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset(y_train/y_test).

4.On the whole dataset, the columns without a proper column names are corrected and at the same time a tidy data set is formed by using cbind() function on all the datasets.

5.Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to github repository.
