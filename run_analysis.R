## Read data sets and merge
trainData <- read.table("train/X_train.txt")
testData <- read.table("test/X_test.txt")
data<-rbind(trainData, testData)

## Read subjects and merge
trainSubjects <- read.table("train/subject_train.txt")
testSubjects <- read.table("test/subject_test.txt")
subjects <- rbind(trainSubjects, testSubjects)

## Read data labels and merge
trainLabels <- read.table("train/y_train.txt")
testLabels <- read.table("test/y_test.txt")
labels <- rbind(trainLabels, testLabels)

## Read Features List (to be used as attribute names for data)
featuresList <- read.table("features.txt", stringsAsFactors=FALSE)

## Use only names from features list
features <- featuresList$V2

## Logical Vector to keep only std and mean columns
keepColumns <- grepl("(std|mean[^F])", features, perl=TRUE)

## Keep only required data, and make it readable
data <- data[, keepColumns]
names(data) <- features[keepColumns]
names(data) <- gsub("\\(|\\)", "", names(data))

## Read ActivityList (to add descriptive names to data set)
activities <- read.table("activity_labels.txt")
labels[,1] = activities[labels[,1], 2]
## Add activity label
names(labels) <- "activity"

## Add human readable labels to activity names
names(subjects) <- "subject"
tidyData <- cbind(subjects, labels, data)
# write.table(tidyData, "tidyData.txt",row.name=FALSE)

## Creating second tiny data set with average of each variable for each activity and each subject
uniqueSubjects = unique(subjects)[,1]
numSubjects = length(uniqueSubjects)
numActivities = length(activities[,1])
numColumns = length(names(tidyData))
tidyDataAverage = tidyData[ 1:(numSubjects*numActivities), ]

row = 1
for (sub in 1:numSubjects) {
  for (activity in 1:numActivities) {
    tidyDataAverage[row,1] = uniqueSubjects[sub]
    tidyDataAverage[row,2] = activities[activity, 2]
    tmp <- tidyData[tidyData$subject==sub & tidyData$activity==activities[activity,2],]
    tidyDataAverage[row, 3:numColumns] <- colMeans(tmp[, 3:numColumns])
    row = row + 1
  }
}

write.table(tidyDataAverage, "tidyData2.txt",row.name=FALSE)