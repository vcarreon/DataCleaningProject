#Codebook for Data Cleaning Project Assignment

##Project Description
This project requires creation of a tidy data set using the Human Activity Recognition Using Smartphones Dataset performed by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto at Smartlab - Non Linear Complex Systems Laboratory at the Università degli Studi di Genova.

A full description of the data is available at the site where it was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Study design and data processing
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##Notes on the original (raw) data

###Each record includes:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

###Understanding the features:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The conventon for naming these features is shown below:
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


###The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Note: In this analysis, only mean and std are used.

###The dataset for the raw data includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Note: The Inertail Signals files were not used in this analysis.

#Creating the tidy datafile

##Guide to create the tidy data file
The script run_analysis.R creates the tidy data file. Each line/section of the script is annotated and includes the following steps:

###Step 1: Read files into R 
*Load the following files(activity_labels.txt, fetaures.txt, x_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, and subject_train.txt). 
*These are named as the following R objects: activities, features, xtest, ytest, subjectTest, xtrain, ytrain, and SubjectTrain

###Step 2: Clean the data
a. Clean xtest and limit to features with mean or std. 
* Rename the columns in xtest using the names from features.txt 
* Use grepl to find which features have mean or std and save this in a new object called "extracted features."
* Turn xtest into a subset with just the extracted features.

b. Add labels called Activity_ID and Activity_Label to ytest.

C. Add Subject as a column name to subjectTest.
 
d. Bind subjectTest, xtest and ytest by column using the cbind function and make a datframe using as.data.frame called test.

e. Repeat these steps for xtrain and ytrain and create a new dataframe called train.

###Step 3: Merge the test and train datasets
* Use the rbind function to merge the test and train datasets into a new dataset called data

###Step 4: Create a preliminary tidy dataset 
* Use the melt function to move the feature names for each type of observation into a single column called variable and create a new column called value.
* Store the result in a new object called meltedData.

###Step 5: Create a tidy dataset (tidyData) that takes the mean of each variable for each activity of each subject
* Use the dcast function to take the meltedData and create a new tidy dataset with the average of each variable for each activity and each subject.
* This turns each feature that was in the variable column in meltedData into its own column name.
* The values are the mean for each variable.

###Step 6: Write the file for tidyData in both txt and csv formats
* This section of code takes tidyData and converts into a txt and csv format.


#Description of the variables in the tiny_data.txt file
* Dimensions of the dataset, 180 rows (observations), 81 columns (variables)
* Summary of the data

$ subject                        : int  1 1 1 1 1 1 2 2 2 2 ...
 $ Activity_Label                 : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...
 $ tBodyAcc-mean()-X              : num  
 $ tBodyAcc-mean()-Y              : num  
 $ tBodyAcc-mean()-Z              : num  
 $ tBodyAcc-std()-X               : num  
 $ tBodyAcc-std()-Y               : num  
 $ tBodyAcc-std()-Z               : num  
 $ tGravityAcc-mean()-X           : num  
 $ tGravityAcc-mean()-Y           : num  
 $ tGravityAcc-mean()-Z           : num  
 $ tGravityAcc-std()-X            : num  
 $ tGravityAcc-std()-Y            : num  
 $ tGravityAcc-std()-Z            : num  
 $ tBodyAccJerk-mean()-X          : num  
 $ tBodyAccJerk-mean()-Y          : num  
 $ tBodyAccJerk-mean()-Z          : num  
 $ tBodyAccJerk-std()-X           : num  
 $ tBodyAccJerk-std()-Y           : num  
 $ tBodyAccJerk-std()-Z           : num  
 $ tBodyGyro-mean()-X             : num  
 $ tBodyGyro-mean()-Y             : num  
 $ tBodyGyro-mean()-Z             : num  
 $ tBodyGyro-std()-X              : num  
 $ tBodyGyro-std()-Y              : num  
 $ tBodyGyro-std()-Z              : num  
 $ tBodyGyroJerk-mean()-X         : num  
 $ tBodyGyroJerk-mean()-Y         : num  
 $ tBodyGyroJerk-mean()-Z         : num  
 $ tBodyGyroJerk-std()-X          : num  
 $ tBodyGyroJerk-std()-Y          : num  
 $ tBodyGyroJerk-std()-Z          : num  
 $ tBodyAccMag-mean()             : num  
 $ tBodyAccMag-std()              : num  
 $ tGravityAccMag-mean()          : num  
 $ tGravityAccMag-std()           : num  
 $ tBodyAccJerkMag-mean()         : num  
 $ tBodyAccJerkMag-std()          : num  
 $ tBodyGyroMag-mean()            : num  
 $ tBodyGyroMag-std()             : num  
 $ tBodyGyroJerkMag-mean()        : num  
 $ tBodyGyroJerkMag-std()         : num  
 $ fBodyAcc-mean()-X              : num  
 $ fBodyAcc-mean()-Y              : num  
 $ fBodyAcc-mean()-Z              : num  
 $ fBodyAcc-std()-X               : num  
 $ fBodyAcc-std()-Y               : num  
 $ fBodyAcc-std()-Z               : num  
 $ fBodyAcc-meanFreq()-X          : num  
 $ fBodyAcc-meanFreq()-Y          : num  
 $ fBodyAcc-meanFreq()-Z          : num  
 $ fBodyAccJerk-mean()-X          : num  
 $ fBodyAccJerk-mean()-Y          : num  
 $ fBodyAccJerk-mean()-Z          : num  
 $ fBodyAccJerk-std()-X           : num  
 $ fBodyAccJerk-std()-Y           : num  
 $ fBodyAccJerk-std()-Z           : num  
 $ fBodyAccJerk-meanFreq()-X      : num  
 $ fBodyAccJerk-meanFreq()-Y      : num  
 $ fBodyAccJerk-meanFreq()-Z      : num  
 $ fBodyGyro-mean()-X             : num  
 $ fBodyGyro-mean()-Y             : num  
 $ fBodyGyro-mean()-Z             : num  
 $ fBodyGyro-std()-X              : num  
 $ fBodyGyro-std()-Y              : num  
 $ fBodyGyro-std()-Z              : num  
 $ fBodyGyro-meanFreq()-X         : num  
 $ fBodyGyro-meanFreq()-Y         : num  
 $ fBodyGyro-meanFreq()-Z         : num  
 $ fBodyAccMag-mean()             : num  
 $ fBodyAccMag-std()              : num  
 $ fBodyAccMag-meanFreq()         : num  
 $ fBodyBodyAccJerkMag-mean()     : num  
 $ fBodyBodyAccJerkMag-std()      : num  
 $ fBodyBodyAccJerkMag-meanFreq() : num  
 $ fBodyBodyGyroMag-mean()        : num  
 $ fBodyBodyGyroMag-std()         : num  
 $ fBodyBodyGyroMag-meanFreq()    : num  
 $ fBodyBodyGyroJerkMag-mean()    : num  
 $ fBodyBodyGyroJerkMag-std()     : num  
 $ fBodyBodyGyroJerkMag-meanFreq(): num  
