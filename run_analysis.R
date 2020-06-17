library(dplyr)
library(tidyr)
# dataFolder <- "UCI HAR Dataset"
# testPath <- file.path(dataFolder, "test")
# trainPath <- file.path(dataFolder, "train")

activitiesLabels <- tibble(read.csv("UCI HAR Dataset/activity_labels.txt", sep = " ", header = F))
names(activitiesLabels) <- c("id", "activity")

testSubjects <- tibble(read.csv("UCI HAR Dataset/test/subject_test.txt", header = F))
names(testSubjects) <- c("subjectid")

testLabels <- tibble(read.csv("UCI HAR Dataset/test/y_test.txt", header = F))
testLabels <- tibble(testLabels)
names(testLabels) <- c("id")

# data <- rbind(testSubjects, testLabels)
data <- left_join(testLabels, activitiesLabels)
data <- mutate(data, subject = testSubjects)

# testSet <- tibble(read.csv("UCI HAR Dataset/test/X_test.txt", header = F, sep = " "))
