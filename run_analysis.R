# title: 'Coursera: Getting and Cleaning Data Course Project'
# author: "Antti Merisalo"
# date: "7 toukokuuta 2019"

library(dplyr)

## Load the required data into R
# Load in the classification data
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = T)
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = F ,sep = " ", dec = ".", stringsAsFactors = T)

# Load in the train data
trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Load in the test data
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")



## Steps 1, 3, and 4: Label the variables accordingly, include subject and activity for each record in the data set, and finally merge the data set.
# Label the variables in both sets
names(trainSet) <- features[,2]
names(testSet) <- features[,2]

# Include Activity to both sets as descriptive variable
trainLabels <- left_join(trainLabels, activityLabels, by = "V1")
trainSet$activity <- trainLabels[, 2]

testLabels <- left_join(testLabels, activityLabels, by = "V1")
testSet$activity <- testLabels[, 2]

# Include Subject to both sets as integer
trainSet$subject <- subjectTrain[,1]
testSet$subject <- subjectTest[,1]

# Merge the data set as one complete set
completeSet <- rbind(trainSet, testSet)



## Step 2: Extract the measurements on the mean and standard deviation for each measurement.
# Regexp for choosing the correct elements
significantMeasuresSet <- completeSet[ , grep("mean\\(|std\\(", names(completeSet))]

# Add activity and subject variables to the set
significantMeasuresSet$activity <- completeSet$activity
significantMeasuresSet$subject <- completeSet$subject



## Step 5: Create independent tidy data set with the average of each variable for each activity and each subject.
# Create a grouped data set by activity and subject
groupedSet <- group_by(significantMeasuresSet, activity, subject)

# Calculate means for all other variables by activity and subject
meanSet <- groupedSet %>% summarise_all(mean)

# Save the processed data set as a text file
write.table(meanSet, file = "galaxy-S-processed-data.txt", row.names = F, quote = F)