## Code Book 

### Overview

Source of the original data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Full Description at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Process

The script run_analysis.R performs the following process to clean up the data and create tidy data sets:

* Merges the training and test sets to create one data set.

* Reads features.txt and uses only the measurements on the mean and standard deviation for each measurement.

* Reads activity_labels.txt and applies readable activity names to name the activities in the data set.

* Labels the data set with descriptive names. (Brackets included in the names are removed.)

* Merges the features with activity labels and subject IDs. The result is stored in a dataframe tidyData.

* The average of each measurement for each activity and each subject is merged to a second data set. The result is saved as tidyData2.txt.


### Variables

* trainData - table contents of train/X_train.txt
* testData - table contents of test/X_test.txt
* data - Measurement data. Combined data set of the two above variables
* trainSubjects - table contents of test/subject_train.txt
* testSubjects - table contents of test/subject_test.txt
* subjects - Subjects. Combined data set of the two above variables
* trainLabels - table contents of train/y_train.txt
* testLabels - table contents of test/y_test.txt
* labels - Data Labels. Combined data set of the two above variables
* featuresList - table contents of features.txt
* features - Names of features (2nd data column) derived from featuresList
* keepColumns - logical vector of which features to use in tidy data set i.e. the ones which are either std or mean features
* activities - table contents of activity_labels.txt. Readable activities.
* tidyData - subsetted, readable data ready for output according to project description.
* uniqueSubjects - unique subjects from "subjects" variable
* numSubjects - number of unique subjects
* numActivities - number of activities
* numColumns - number of columns in tidyData
* tidyDataAverage - second tidy data set with average of each variable for each activity and subject.


## Output

### data-frame "tidyData"

tidyData is a 10299x68 data frame.

* The first column contains subject IDs.
* The second column contains activity names.
* The last 66 columns are measurements.
* Subject IDs are integers between 1 and 30.

### tidyData2.txt

tidyData2.txt is a 180x68 data frame.

* The first column contains subject IDs.
* The second column contains activity names.
* The average for each of the 66 attributes are in columns 3-68.