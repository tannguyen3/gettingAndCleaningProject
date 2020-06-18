# Code Book

## Cleaning Data Steps 
All the cleaning steps are in the run_analysis.R. The run_analysis.R requires 

- Package: dplyr and tidyr
- [The Samsung data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) downloaded and put in the "UCI HAR Dataset"

The run_analysis.R will: 
- First read activity labels in the "UCI HAR Dataset/activity_labels.txt" file and add variable names as "id" and "activity"
- Read all features in "UCI HAR Dataset/features.txt" file
- Read data from the "UCI HAR Dataset/test" and "UCI HAR Dataset/train" folder, each follows below steps:
	- Read the subject file and name variable as "subjectid"
	- Read the lable file and name variable as "id"
	- Read the set file use the features data from Step 2 to name the variables
	- Then on the set data, only select mean and standard deviation variables.
	- Finally merge subject, lables and set data into one data set.
- After having test and training data, merge them into one dataset, 
- Then appropriately labels the data set with descriptive variable names by lowering all the names and remove special chars like '()' and '-'
- Finally, create a tidy data set with the average of each variable for each activity and each subject.
- And write them to file tidyData.txt with write.table() using row.name=FALSE 

## Variables of the tidy data set

- subjectid: an identifier of the subject who carried out the experiment, from 1 to 30
- activity: activity name
	we has 6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Below are feature variables, they are normalized and bounded within [-1,1]. For feature info, please see "UCI HAR Dataset/features.txt"
- tbodyaccmeanx
- tbodyaccmeany
- tbodyaccmeanz
- tgravityaccmeanx
- tgravityaccmeany
- tgravityaccmeanz
- tbodyaccjerkmeanx
- tbodyaccjerkmeany
- tbodyaccjerkmeanz
- tbodygyromeanx
- tbodygyromeany
- tbodygyromeanz
- tbodygyrojerkmeanx
- tbodygyrojerkmeany
- tbodygyrojerkmeanz
- tbodyaccmagmean
- tgravityaccmagmean
- tbodyaccjerkmagmean
- tbodygyromagmean
- tbodygyrojerkmagmean
- fbodyaccmeany
- fbodyaccmeanx
- fbodyaccmeanz
- fbodyaccmeanfreqx
- fbodyaccmeanfreqy
- fbodyaccmeanfreqz
- fbodyaccjerkmeanx
- fbodyaccjerkmeany
- fbodyaccjerkmeanz
- fbodyaccjerkmeanfreqx
- fbodyaccjerkmeanfreqy
- fbodyaccjerkmeanfreqz
- fbodygyromeanx
- fbodygyromeany
- fbodygyromeanz
- fbodygyromeanfreqx
- fbodygyromeanfreqy
- fbodygyromeanfreqz
- fbodyaccmagmean
- fbodyaccmagmeanfreq
- fbodybodyaccjerkmagmean
- fbodybodyaccjerkmagmeanfreq
- fbodybodygyromagmean
- fbodybodygyromagmeanfreq
- fbodybodygyrojerkmagmean
- fbodybodygyrojerkmagmeanfreq
- angle(tbodyaccmean,gravity)
- angle(tbodyaccjerkmean),gravitymean)
- angle(tbodygyromean,gravitymean)
- angle(tbodygyrojerkmean,gravitymean)
- angle(x,gravitymean)
- angle(y,gravitymean)
- angle(z,gravitymean)
- tbodyaccstdx
- tbodyaccstdy
- tbodyaccstdz
- tgravityaccstdx
- tgravityaccstdy
- tgravityaccstdz
- tbodyaccjerkstdx
- tbodyaccjerkstdy
- tbodyaccjerkstdz
- tbodygyrostdx
- tbodygyrostdy
- tbodygyrostdz
- tbodygyrojerkstdx
- tbodygyrojerkstdy
- tbodygyrojerkstdz
- tbodyaccmagstd
- tgravityaccmagstd
- tbodyaccjerkmagstd
- tbodygyromagstd
- tbodygyrojerkmagstd
- fbodyaccstdx
- fbodyaccstdy
- fbodyaccstdz
- fbodyaccjerkstdx
- fbodyaccjerkstdy
- fbodyaccjerkstdz
- fbodygyrostdx
- fbodygyrostdy
- fbodygyrostdz
- fbodyaccmagstd
- fbodybodyaccjerkmagstd
- fbodybodygyromagstd
- fbodybodygyrojerkmagstd