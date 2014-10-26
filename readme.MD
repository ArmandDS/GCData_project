
Coursera Getting and Cleaning Data

This file is about what run_analysis does.

Instructions


The R script called run_analysis.R that does the following: 

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 

From the data set in step, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.



Files in this Repo:

Readme.ME - xplains how all of the scripts work and how they are connected
CodeBook.md - describes the variables, the data, and any transformations or
 work that you performed to clean up the data
run_analysis.R - the code in r 



run_analysis.R steps

1. Download the data source and  unzip you´ll have  UCI HAR Dataset 
2. Read all instruccions in the page of the course
3. Within R, read all files in test and train folder( data frames= x.test, y.test, x.train, y.train)
4. In R, read features file and activity labels ( labels)
5. Combine labels with its match in activity file( labels.test, labels.train)
6. Combine Columns in test data
7. combine Columns in train data
8. Combine rows from data result from steps  6 and 7  ( data.frame called all.data)
9. Extract from features the keyword mean and std to create index
10. look for mean and std in files test and train according to index from step 9
11. compute mean from columns in dataset from step 8 and add column ( data.frame called total)
12. sort the data ( data.frama called total)
11. write the data to file (tydidata.txt)
