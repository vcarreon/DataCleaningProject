# Data Cleaning Project Assignment

This project uses data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description of the data is available at the site where it was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 

#Repo Contents
This repo includes the following files:

1. README.md 

2. Codebook.md

3. run_analysis.R, which includes the script to create the tidy dataset.
 
##Script: run_analysis.R

The script for this project is contained in run_analysis.R to create a tidy dataset. It does the following:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run.analysis.R includes explanatory comments to help the reader understand what each line or section of code does.

##Codebook.md

The codebook describes the variables, the data, and transformations that were performed to clean the data in run_analysis.R. It includes the major steps taken to create the tidy datset.
* Step 1: Read files into R

* Step 2: Clean the data

a. Clean xtest and limit to features with mean or std. 

b. Add labels called Activity_ID and Activity_Label to ytest.

c. Add Subject as a column name to subjectTest.

d. Bind subjectTest, xtest and ytest by column using the cbind function and make a datframe using as.data.frame called test.

e. Repeat these steps for xtrain and ytrain and create a new dataframe called train.

* Step 3: Create a preliminary tidy dataset using the melt function

* Step 4: Create a tidy dataset (tidyData)that takes the mean of each variable for each activity of each subject

* Step 5: Write the file for tidyData in both txt and csv formats




