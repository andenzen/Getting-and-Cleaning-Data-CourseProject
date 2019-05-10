# Getting-and-Cleaning-Data-CourseProject
This repo includes my submission for the final assignment of the course in question.

Coursera: John Hopkins University course, "Getting and Cleaning Data", Course Project
Author: Antti Merisalo
Date: May 7th 2019

Please note that in order for the script to work you have to have the directory 'UCI HAR Dataset' in your working directory that
contains the provided data for this assignment by the course. You can find the dataset via the link below:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The script that does the work is located in this repository and is called 'run_analysis.R'
It has been divided into four following parts:

Part I: Load the required data into R
This part loads the necessary data from the coursework dataset in R as individual data frames.

Part II: Steps 1, 3, and 4
This part finalizes the steps 1,3, and 4 of the assignment. It will:
-Label the variables accordingly.
-Include subject and activity for each record in the data set.
-Merge the test and train data into one complete data set.

Part III: Step 2
This part finalizes the step 2 of the assignment.
It extracts the measurements on the mean and standard deviation for each measurement and
combines these with the activity and subject classification variables.

Part IV: Step 5
This part of the code wraps up the assignment. It groups the data set by activity and subject and
calculates the means for all other variables.
Finally it will write the final dataset to a text file called "galaxy-S-processed-data.txt"


You can import the output of the assignment back to R with the following line after you have created it with the initial script:
outputData <- read.table(file = "galaxy-S-processed-data.txt", header = T, check.names = F)
