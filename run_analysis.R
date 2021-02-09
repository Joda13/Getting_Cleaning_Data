# 0
# Preprocessing

## Set working directory
getwd()
setwd("./assign_4")

## Create data storing folder
if (!file.exists("data")){
    dir.create("data")
}

## Load dplyr library
library(dplyr) 

## Create download link
download_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## Download zip file
download.file(download_URL, destfile = "./data/ziFile.zip")
zipFile_downl_date <- date()

## Unzip file
unzip("./data/ziFile.zip", exdir = ".")
list.files()

## Read in data
### Read test data 
x_test   <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test   <- read.table("./UCI HAR Dataset/test/y_test.txt") 
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

### Read train data 
x_training   <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_training   <- read.table("./UCI HAR Dataset/train/y_train.txt") 
sub_training <- read.table("./UCI HAR Dataset/train/subject_train.txt")

### Read feature description 
variables <- read.table("./UCI HAR Dataset/features.txt") 

### Read activity labels 
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") 


# 1 
# Merge the training and the test sets to create one data set
x_merged   <- rbind(x_test, x_training)
y_merged   <- rbind(y_test, y_training) 
sub_merged <- rbind(sub_test, sub_training) 

# 2
# Extract only the measurements on the mean and standard deviation for each measurement
sel_variables <- variables[grep(".*mean\\(\\)|std\\(\\)", variables[,2], ignore.case = FALSE),]
x_merged <- x_merged[,sel_variables[,1]]

# 3 $ 4
# Use descriptive activity names to name the activities in the data set
colnames(x_merged)   <- sel_variables[,2]
colnames(y_merged)   <- "activity"
colnames(sub_merged) <- "subject"


# 5
# Create a second, independent tidy data set with the average 
# of each variable for each activity and each subject
#
## Merge final dataset
merged <- cbind(sub_merged, y_merged, x_merged)

# Convert activities & subjects into factors 
merged$activity <- factor(merged$activity, levels = activity_labels[,1], labels = activity_labels[,2]) 
merged$subject  <- as.factor(merged$subject) 

merged_mean <- merged %>% group_by(activity, subject) %>% summarize_all(funs(mean)) 

# Export summary dataset
write.table(merged_mean, file = "./tidydata.txt", row.names = FALSE, col.names = TRUE) 

# Check output 
output <- read.table("./tidydata.txt", header = TRUE)
summary(output)

# Clear workspace
rm(list = ls())
