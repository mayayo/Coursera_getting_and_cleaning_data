### preparing the material ###

setwd("/Users/mayayo/Documents/code/R/Getting_And_Cleaning_Data/course_proyect")
fileName<-"course_project_3_dataset.zip"

#download the file and unzip

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 

if (!file.exists(fileName)){
 download.file(fileURL, fileName, method="curl") 
}

#unzip the file that has been downloaded

dataFolder <- "UCI HAR Dataset"

if(!file.exists(dataFolder)){
  unzip(fileName, list = FALSE, overwrite = TRUE)
} 

#Load activity label dataframe from .txt
activityLabelsDF <- read.table("UCI HAR Dataset/activity_labels.txt")

#Load features dataframe from .txt
featuresDF <- read.table("UCI HAR Dataset/features.txt")
featuresDF[,2] <- as.character(featuresDF[,2])

#Load training set datasets
trainingSetDS <- read.table("UCI HAR Dataset/train/X_train.txt")
trainingActivitiesDS <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainingSubjectsDS <- read.table("UCI HAR Dataset/train/subject_train.txt")

#Load test set datasets
testSetDS <- read.table("UCI HAR Dataset/test/X_test.txt")
testActivitiesDS <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjectsDS <- read.table("UCI HAR Dataset/test/subject_test.txt")


#extract only mean and standard deviation features (measurements) from test and training X sets
features_selection_rows<- grep(".*mean.*|.*std.*", featuresDF[,2])
features_selection_rows.names <- featuresDF[features_selection_rows, 2]

trainingSetDS <- trainingSetDS[features_selection_rows]
trainingSetDS <-cbind(trainingSubjectsDS, trainingActivitiesDS, trainingSetDS)

testSetDS <- testSetDS[features_selection_rows]
testSetDS <-cbind(testSubjectsDS, testActivitiesDS, testSetDS)

# merge datasets and add labels
mergedSetDS <- rbind(trainingSetDS, testSetDS)

colnames(mergedSetDS) <- c("subject_id", "activity", features_selection_rows.names)

#Label the data set with descriptive variable names
#convert as factors so we can created the tidy dataset that:
# has the average of each variable for each activity and each subject.

mergedSetDS$activity <- factor(mergedSetDS$activity, levels=activityLabelsDF$V1, labels=activityLabelsDF$V2)
mergedSetDS$subject_id <- as.factor(mergedSetDS$subject_id)

library(reshape2)

#first we create a skinny dataset with variables "subject_id" and "activity". The variable column will contain each of the variables 
mergedSetDSmelted <- melt(mergedSetDS, id = c("subject_id", "activity"))

#and now we reshape this melted dataset into a wide shaped dataset, that aggregates on subject and
# activity using the mean function

mergedSetDSaverage <- dcast(mergedSetDSmelted, subject_id + activity ~ variable, mean)

write.table(mergedSetDSaverage, "UCI HAR Dataset/tidy_file.txt")