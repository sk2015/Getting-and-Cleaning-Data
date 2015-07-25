#setwd("~\\Desktop\\Getting&CleanData\\Week3")

#1. Merges the training and the test sets to create one data set.

trainData <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
trainLabel <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
trainSubject <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")

testData <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
testLabel <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
testSubject <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

X_Data <- rbind(trainData, testData)
y_Data <- rbind(trainLabel, testLabel)
Subject_data <- rbind(trainSubject, testSubject)


#2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table(".\\UCI HAR Dataset\\features.txt")[,2]
names(X_Data)=features
extract_features <- grepl("mean|std",features)
X_Data <- X_Data[, extract_features]


#3. Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
y_Data[, 1] <- activity_labels[y_Data[, 1], 2]
names(y_Data) <- "activity"


#4. Appropriately labels the data set with descriptive activity names. 

names(Subject_data) <- "subject"
joinData <- cbind(X_Data,y_Data,Subject_data)


#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

averages_data <- ddply(joinData,c("subject", "activity"), function(x) colMeans(x[, 1:79]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)

