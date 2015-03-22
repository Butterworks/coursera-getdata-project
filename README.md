# Coursera Gettting and Cleaning Data Course Project
This is my submission for the course project which includes the run_analysis.R, README.md and Codebook.md

#1. run_analysis.R
This is the main file for the folder, contains the required script that completes all 5 tasks 
required by the course project outline.
##1.1. Setting up the folder
My submission for the run_analysis.R script gets the data and places it in a folder for you.
To ensure that it doesn't keep downloading on each run, the script checks to see if all the required data
is there.  Helps with multiple runs during development.
##1.2. Dependencies
The script will install the required dependencies for you.
##1.3. Run Task 1, 2, & 3
1. The script loads all the required data from the raw_data folder and merges the rows and columns.  The completed 
merged table is created, called observationData.  
2. Task 2 is then completed which only selects the mean and standard deviation for each 
measurement.  Note, a new table is _not_ created, observationData is updated.  
3. Task 3 is completed by adding the correct activity names for the Activity column.  

##1.4. Run Task 4
All columns have appropriate names. The column names are; (1) Subject, refering the volunteer completeing an 
activity, (2) Activity, refering to the activity being completed, and the subsequent column names follow the 
study feature namining convention.  For the namening conventions used for the experiment, please refer to
features_info.txt

##1.5. Run Task 5
The last task completed is to create the tidydata.txt file using the write.table function.  The file is saved in
the working folder.

##Memory Use of Script
During the script run, unnecessary memory allocation for variables are removed to reduce the amount of memory
held. Furthermore, the script prompts the user to clear all memory after the tidydata.txt file has been created. 
