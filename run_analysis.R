# Getting and Cleaning Data Project (Coursera)
# John Hopkins, Bloomberg School of Public Health
# Created by Rudolf J
# 21st of March 2015

#START SCRIPT
cat("Coursera - Getting and Cleaning Data\n")
cat("John Hopkins, Bloomberg School of Public Health\n")
cat("Coursera Course Project, by Rudolf J\n")
cat("21st of March 2015\n")
cat("---------------------------------------\n")
#Libraries
#if package is unavailable, install
if("plyr" %in% rownames(installed.packages()) == FALSE){
  cat("Required plyr package for script... Installing\n")
  install.packages("plyr")  
}
library("plyr")

#PRE-TASKS: IF the user does not have the Samsung data in the wordking directory: GET IT

#set URL, get zip and extract
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#set raw data folder, check exists
if(!file.exists("./raw_data")) {
  cat("Creating data directory: /raw_data...")
  dir.create("./raw_data")
  cat("done\n")
}
#download into raw_data folder, and extract files
if(!file.exists("./raw_data/datafiles.zip")) {
  #zip file isn't in folder, download it:
  cat("Downloading file: ", fileURL)
  download.file(fileURL, destfile="./raw_data/datafiles.zip")
  
}

#unzip the downloaded file
#check if I have already unzipped the files
if(!file.exists("./raw_data/UCI HAR Dataset")) {
  cat("\nExtracting files from .zip file...")
  unzip("./raw_data/datafiles.zip", list = FALSE, overwrite = TRUE, exdir="./raw_data")
  cat("done\n")
}

# TASK ONE: Merge the training and the tests
cat("Task 1: Merge the Training and the Test sets")
#Training set & Test set into data frames, then merge
#Get all datasets for training set (load all files in folder into data frames)
xTrain <- read.table("./raw_data/UCI HAR Dataset/train/X_train.txt") #Training set.
yTrain <- read.table("./raw_data/UCI HAR Dataset/train/y_train.txt") #Training Labels.
subjectTrain <- read.table("./raw_data/UCI HAR Dataset/train//subject_train.txt") #Which subject performed activity

#Get all data sets for the test set
xTest <- read.table("./raw_data/UCI HAR Dataset/test/X_test.txt") 
yTest <- read.table("./raw_data/UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("raw_data/UCI HAR Dataset/test/subject_test.txt")


#Merge into one dataset
#Merge all the x-data (from training & test)
xData <- rbind(xTrain, xTest)
#Merge all the y-data
yData <- rbind(yTrain, yTest)

#merge all the subject acitivities
subjectData <- rbind(subjectTest, subjectTrain)

#add the measurements as column header on observations
#only select second column(names)
measurements <- read.table("./raw_data/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[[2]] 
colnames(xData) <- measurements
#colnames for subjectData and yData for merged data set
colnames(yData) <- "yData"
colnames(subjectData) <- "Subject"
#Merge training and test sets
observationData <- cbind(subjectData, yData, xData)

#Drop unnessasary variables from memory

rm(xTrain, xTest, xData, yData, yTrain, yTest, subjectTest, subjectTrain, subjectData, measurements)
cat("...done\n")
cat("***NOTE: From all the data sets given, one single dataset created: observationData***\n")

#TASK TWO: Extracts only the measurements on the mean and standard deviation for each measurement. 
cat("Task 2: Extract only the measurements on the mean and standard deviation for each measurement")
observationData <- observationData[,grep("yData|Subject|mean|std",colnames(observationData))]
#reference: https://class.coursera.org/getdata-012/forum/thread?thread_id=246#comment-725
cat("...done\n")

#TASK THREE: Use descriptive names to name the activities in the data set.
cat("Task 3: Use descriptive names to name the activities in the data set")
#get all activity names
actNames <- read.table("./raw_data/UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

#add activity names to yData
observationData[,2] <- actNames[observationData[,2], 2]

#change y data column name to activity
colnames(observationData)[2] <- "Activity"

#clean-up memory
rm(actNames)
cat("...done\n")

#TASK FOUR: Appropriately label the data set with descriptive variable names
#Body Acc 
cat("Task 4: Label the data set with descriptive variable names")
cat("...done\n")
cat("***Note: For column naming convention please refer to ./features_info.md***\n")

#TASK FIVE: Create a second, independent tidy data set with the average of each variable for each activity and each subject
# x(30 (subjects) x 6 (activities))  by  y(79 (measurements)) (dimentions of tidy data set)
cat("Task 5: Create a second, independent tidy data set with the average of each variable of each activity and each subject")
tidyData = aggregate(observationData, by=list(Activity = observationData$Activity, Subject = observationData$Subject), mean)
#remove mean of activity & subject
tidyData[,3] <- NULL
tidyData[,3] <- NULL

cat("..done\n")

#POST TASKS: Write txt of tidy data set & ask user to clear mem
cat("Write tidy data set txt file")
write.table(tidyData, file="./tidydata.txt", row.names=FALSE)
cat("...done\n")
responce <- readline(paste("Clear all workspace memory? y to clear, or press ENTER to continue without memory clear..."))
if(responce == "y"){
  rm(list=ls())
} else {
  cat("\nContinuing without memory clear.\n")
}
cat("Script finished.\n")
#END SCRIPT

