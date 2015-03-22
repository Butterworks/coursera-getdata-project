##CodeBook
CodeBook for Getting and Cleaning Data Course Project
##The Research
###The Data Set
The data set is available from the [Machine Learning Repository]
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) site.

**From the website:** 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person 
performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 
(Samsung Galaxy S II) on the waist. 

Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial 
angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise 
filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 

The sensor acceleration signal, which has gravitational and body motion components, was separated using a 
Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only 
low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of
features was obtained by calculating variables from the time and frequency domain.

###The Data Variables

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

1. tBodyAcc-XYZ
2. tGravityAcc-XYZ
3. tBodyAccJerk-XYZ
4. tBodyGyro-XYZ
5. tBodyGyroJerk-XYZ
6. tBodyAccMag
7. tGravityAccMag
8. tBodyAccJerkMag
9. tBodyGyroMag
10. tBodyGyroJerkMag
11. fBodyAcc-XYZ
12. fBodyAccJerk-XYZ
13. fBodyGyro-XYZ
14. fBodyAccMag
15. fBodyAccJerkMag
16. fBodyGyroMag
17. fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

1. mean(): Mean value
2. std(): Standard deviation
3. mad(): Median absolute deviation 
4. max(): Largest value in array
5. min(): Smallest value in array
6. sma(): Signal magnitude area
7. energy(): Energy measure. Sum of the squares divided by the number of values. 
8. iqr(): Interquartile range 
9. entropy(): Signal entropy
10. arCoeff(): Autorregresion coefficients with Burg order equal to 4
11. correlation(): correlation coefficient between two signals
12. maxInds(): index of the frequency component with largest magnitude
13. meanFreq(): Weighted average of the frequency components to obtain a mean frequency
14. skewness(): skewness of the frequency domain signal 
15. kurtosis(): kurtosis of the frequency domain signal 
16. bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
17. angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

1. gravityMean
2. tBodyAccMean
3. tBodyAccJerkMean
4. tBodyGyroMean
5. tBodyGyroJerkMean

###The Script Variables
To load all the text files into the R script the following variables where used:
1. xTest, yTest and subjectTest for all the test data
2. xTrain, yTrain and subject Train for all the training data

**_Note: read.table function was used to load in the data._**

To merge the tables; xData containing all the x-axis data from both sets was created, yData for all the y-axis data
and subjectData containing all the Subjects for both training and test sets.

Measurement variable was created to load all the feature names.  This is later used to name the columns of the single merged
table.

observationData variable was the single large data frame, containing all xData, yData and subject data.
observationData is manipulated to only contain subject, activity and all measurements containing std() and mean()
variables.

actName variable was created to load all the activity names and later used to rename all the yData to reflect the correct 
activity name, rather than just looking at numerical values for activity identification.

tidyData variable is the data set which shows the averages of each variable for each activity and each subject as required.

###Source
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)

1 - Smartlab - Non-Linear Complex Systems Laboratory 

DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy.

2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living 

Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain 
activityrecognition '@' smartlab.ws 
