library(dplyr)
library(tidyr)

activitiesLabels <- tibble(read.csv("UCI HAR Dataset/activity_labels.txt", sep = " ", header = F))
names(activitiesLabels) <- c("id", "activity")
featureLabels <- tibble(read.csv("UCI HAR Dataset/features.txt", header = F, sep = " "))$V2
                        

testSubjects <- tibble(read.csv("UCI HAR Dataset/test/subject_test.txt", header = F))
names(testSubjects) <- c("subjectid")

testLabels <- tibble(read.csv("UCI HAR Dataset/test/y_test.txt", header = F))
testLabels <- tibble(testLabels)
names(testLabels) <- c("id")


testSet <- tibble(read.csv("UCI HAR Dataset/test/X_test.txt", header = F, sep = "", numerals = "no.loss"))
names(testSet) <- featureLabels

data <- left_join(testLabels, activitiesLabels)
data <- mutate(data, testSubjects, testSet)