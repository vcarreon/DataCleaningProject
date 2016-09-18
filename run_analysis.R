#Cleaning Data Class Project
##You should create one R script called run_analysis.R that does the following. 
##1.Merges the training and the test sets to create one data set.
##2.Extracts only the measurements on the mean and standard deviation for each measurement. 
##3.Uses descriptive activity names to name the activities in the data set
##4.Appropriately labels the data set with descriptive variable names. 
##5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

setwd("~/Datasciencecoursera/UCIHAR")
library(data.table)
library(reshape2)

##Step 1: Load and Read files
activities<-read.table("./activity_labels.txt")[,2] #Load Activity Names
features<-read.table("./features.txt")[,2] #Load feature names
xtest<-read.table("./test/X_test.txt") #load Xtest, test set
ytest<-read.table("./test/y_test.txt")# load ytest, test labels
subjectTest<-read.table("./test/subject_test.txt") #load subject test
xtrain<-read.table("./train/X_train.txt") #load xtrain
ytrain<-read.table("./train/y_train.txt") #load ytrain training lables
subjectTrain<-read.table("./train/subject_train.txt") #load subject train- the subject who did activity

##Step 2: Clean the data
#Clean xtest and limit to features with mean or std
names(xtest)=features #turn names in xtest into features
extract_features<-grepl("mean|std",features) #see which features have mean or std
table(extract_features) #show this in a table. Answer is 79 have mean or std
xtest=xtest[,extract_features] #turn xtest into a subset with just extracted features
View(xtest) #now see xtest with the correct column names and only those with mean or std

#Clean ytest to add labels and match up activity level
ytest[,2] = activities[ytest[,1]] #adds a column to ytest
names(ytest) = c("Activity_ID", "Activity_Label") #add column names to ytest
View(ytest)

#Clean subjectTest to add label
names(subjectTest) = "subject" #add column names to subjectTest

#Bind the test data together by column
test<-cbind(as.data.frame(subjectTest),ytest,xtest)
View(test) #now see subjectTest, ytest and x test together

#Clean xtrain
names(xtrain)=features #turn names in xtrain into features
xtrain=xtrain[,extract_features] #extract subset with only mean or std
View(xtrain)

#Clean ytrain
ytrain[,2] = activities[ytrain[,1]] #adds a column to ytrain
names(ytrain) = c("Activity_ID", "Activity_Label") #add column names to ytrain
names(subjectTrain) = "subject" #add column names to subjectTrain
View(ytrain)

#bind the train data by column
train<-cbind(as.data.frame(subjectTrain),ytrain,xtrain)
View(train)

#Step 3: Merge test and train data by row
data=rbind(test,train) #adds all the rows together 2,947+7,352=10,299 rows
View(data)

#Step 4: Create a preliminary tidy dataset by using melt function
id=c("subject","Activity_ID","Activity_Label")
dataLabels=setdiff(colnames(data),id)
dataLabels
meltedData<- melt(data,id=id,measure.vars=dataLabels) #this melts the data so column names become one variable with values in a separate column
View(meltedData)

#Step 5: Create Tidy Dataset
#Apply mean to each variable- this creates a new column for each variable with the value
tidyData=dcast(meltedData,subject+Activity_Label~variable,mean)
View(tidyData)

#Step 6: Write file to both table and csv formats
write.table(tidyData,file="./tidy_data.txt",row.names = FALSE)
write.csv(tidyData,file="./tidy_data.csv", row.names= FALSE)
