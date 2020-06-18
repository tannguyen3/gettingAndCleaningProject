# Getting and Cleaning Data Course Project

## Description 

This is the course project of "Getting and Cleaning Data" on Coursera.
The project use the data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone: 
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

 A full description is available at the site where the data was obtained:
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

It contains:

- "UCI HAR Dataset" data folder.
- R script called run_analysis.R that does the following.
	- Read data from "test" and "train" folder with only the measurements on the mean and standard deviation for each measurement.
	- Uses descriptive activity names to name the activities in the data set
	- Merges the training and the test sets to create one data set.		
	- Appropriately labels the data set with descriptive variable names by lower all the variable names, and remove characters '()' and '-'
	- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.