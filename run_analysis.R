library(dplyr)
library(tidyr)

# function to read and merge data in one folder.
readData <- function(type = "test") {
  fileNames <- c("subject_", "y_", "X_")
  fileNames <- sapply(fileNames, paste, type, ".txt", sep= "")
  filePaths <- file.path("UCI HAR Dataset", type, fileNames)
  
  subjects <- read.csv(filePaths[1], header = F)
  names(subjects) <- c("subjectid")
  
  labels <- read.csv(filePaths[2], header = F, comment.char = "")
  names(labels) <- c("id")
  
  set <- read.csv(filePaths[3], header = F, sep = "", numerals = "no.loss"
                  , comment.char = "", colClasses = rep("numeric", length(featureLabels)))
  
  names(set) <- featureLabels
  # only get mean and std variables
  set <-select(set, contains(c("mean", "std")))
  
  # There are features with the same name for example: 382-fBodyAccJerk-bandsEnergy()-1,8; 
  # so from 561 features we only get 481 variables. We will not to worry about this as they are not mean and std
  data <- left_join(labels, activitiesLabels)
  
  data <- data %>% mutate(subjects, set) 
  data$type <- type
  data
}

activitiesLabels <- tibble(read.csv("UCI HAR Dataset/activity_labels.txt", sep = " ", header = F))
names(activitiesLabels) <- c("id", "activity")
featureLabels <- tibble(read.csv("UCI HAR Dataset/features.txt", header = F, sep = " "))$V2

# merge the 2 dataset into one
data <- rbind(readData("test"), readData("train"))
data <- tibble(data)