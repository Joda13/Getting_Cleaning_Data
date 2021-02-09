# **Code book on Getting and Cleaning Data Course Project**

## **Downloads and execution**

a) The data is downloaded and unzipped automatically in Section 0 "Preprocessing". Please set your working directory in the script individually. Then execute the script.
b) If you want you can also download the data manually here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
c) You can also unzip the data manually


## **The dataset and its source**

This is a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Please find a more detailed description here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## **The R script**

The R file "run_analysis.R" does the following:

0. Preprocessing  
0.1 Set working directory  
0.2 Create data storing folder (if not already existent)  
0.3 Load dplyr library  
  0.4 Create download link  
  0.5 Download zip file  
  0.6 Unzip file  
  0.7 Read in data  
        0.7.1 Read test data  
        0.7.2 Read train data  
        0.7.3 Read feature description  
        0.7.4 Read activity labels   

1. Merge the training and the test sets to create one data set   

2. Extract only the measurements on the mean and standard deviation for each measurement  

3. Use descriptive activity names to name the activities in the data set 

4. Appropriately label the data set with descriptive variable names  

5. Create a second, independent tidy data set with the average of each variable for each activity and each subject  
  5.1 Merge final dataset  
  5.2 Convert activities & subjects into factors  
  5.3 Export summary dataset  
  5.4 Check output  
  5.5 Clear workspace  


## **Variables:** 

**Available in downloaded data:**  
`x_train`    
`y_train`  
`x_test`  
`y_test`  
`subject_train`  
`subject_test`  

**Merged available data for analysis:**  
`x_data`  
`y_data`   
`subject_data`    

**Correct variable names:**  
`features`  