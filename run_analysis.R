library(dplyr)
library(tidyr)

readData <- function(type = "test") {
  fileNames <- c("subject_", "y_", "X_")
  fileNames <- sapply(fileNames, paste, type, ".txt", sep= "")
  filePaths <- file.path("UCI HAR Dataset", type, fileNames)
  
  subjects <- tibble(read.csv(filePaths[1], header = F))
  names(subjects) <- c("subjectid")
  
  labels <- tibble(read.csv(filePaths[2], header = F))
  names(labels) <- c("id")
  
  set <- tibble(read.csv(filePaths[3], header = F, sep = "", numerals = "no.loss"))
  names(set) <- featureLabels
  
  # bug - see why it's only has 480 variables
  data <- left_join(labels, activitiesLabels)
  data <- mutate(data, subjects, set) 
  data$type <- type
  data
}

activitiesLabels <- tibble(read.csv("UCI HAR Dataset/activity_labels.txt", sep = " ", header = F))
names(activitiesLabels) <- c("id", "activity")
featureLabels <- tibble(read.csv("UCI HAR Dataset/features.txt", header = F, sep = " "))$V2

data <- rbind(readData("test"), readData("train"))