
## Required packages for this script, other than utils
install.packages("reshape")
library(reshape)

## Search for and Create directory for run_analysis.R 
if (!file.exists("runanalysis")) {
        dir.create("runanalysis")
}

## Download zipped data and record date for reproducibility
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./runanalysis/Dataset.zip")
dateDownloaded <- date()

## Unzip and rename folder without spaces
unzip("./runanalysis/Dataset.zip", exdir = "./runanalysis")
file.rename("./runanalysis/UCI HAR Dataset", "./runanalysis/UCIHARDataset")

## TEST DATA: combine all elements into one "testdat" table

## Create a data table of the test data, observations
test_data <- read.table("./runanalysis/UCIHARDataset/test/X_test.txt")

## Create a factor vector of the six test activities and rename
## for simplicity, see revised README
test_activities <- read.table("./runanalysis/UCIHARDataset/test/y_test.txt")
testactivities <- test_activities$V1
testactivities <- factor(testactivities, labels = c("walk", "walkup", "walkdown", "sit",
                            "stand", "lay"))

## Create a factor vector of the test subjects (there are nine)
test_subj <- read.table("./runanalysis/UCIHARDataset/test/subject_test.txt")
testsubj <- test_subj$V1
testsubj <- as.factor(testsubj)

## Create a character vector of all 561 features, or measurements
features <- read.table(file = "./runanalysis/UCIHARDataset/features.txt")
features <- features[,2]
features <- as.character(features)

## "Bind" the testactivities vector to the test data to create
## a new table: test_data_act
test_data_act <- cbind(testactivities, test_data)

## "Bind" the test subject factor fector to this new table; make
## yet another table
test_data_act_subj <- cbind(testsubj, test_data_act)

## Create a new vector from scratch to identify all observations
## from the "test" group
testgroup <- rep(c("test"), each = 2947)

## "Bind" this new vector to make a third table
test_data_act_subj_grp <- cbind(testgroup, test_data_act_subj)

## Create character vector of column names for all test data
testcol <- c("group", "subject", "activity", features)

## Rename columns of all test data
colnames(test_data_act_subj_grp) <- testcol

## Rename this data frame "testdat" data table to keep things simple
testdat <- test_data_act_subj_grp

## TRAIN DATA: combine all "train" elements into one data table, 
## "traindat," that can be combined (rbind()) with "testdat"

## Create a data table of the train data, note number of observations
train_data <- read.table("./runanalysis/UCIHARDataset/train/X_train.txt")

## Create a factor vector of the six train activities for all
## "train" subjects and rename for simplicity, see revised README
train_activities <- read.table("./runanalysis/UCIHARDataset/train/y_train.txt")
trainactivities <- train_activities$V1
trainactivities <- as.factor(trainactivities)
levels(trainactivities) <- c("walk", "walkup", "walkdown", "sit",
                            "stand", "lay")

## Create a factor vector of the train subjects
train_subj <- read.table("./runanalysis/UCIHARDataset/train/subject_train.txt")
trainsubj <- train_subj$V1
trainsubj <- as.factor(trainsubj)

## "Bind" the trainactivities factor vector to the train data to create
## a new table: train_data_act
train_data_act <- cbind(trainactivities, train_data)

## "Bind" the train subject factor fector to this new table; make
## yet another table
train_data_act_subj <- cbind(trainsubj, train_data_act)

## Create a new vector from scratch to identify all observations
## from the "train" group
traingroup <- rep(c("train"), each = 7352)

## "Bind" this new vector to make a third table
train_data_act_subj_grp <- cbind(traingroup, train_data_act_subj)

## Use  character vector of all column names for all train data
traincol <- c("group", "subject", "activity", features)

## Rename columns of all train data
colnames(train_data_act_subj_grp) <- traincol

## Rename this data frame "traindat" data table to keep things simple
traindat <- train_data_act_subj_grp

## Merge the testdat and traindat datasets with rbind: SAMSUNGdat
samsungdat <- rbind(testdat, traindat)

## Select columns of interest, mean and std pairs, while keeping the
## first three columns as well: group, subject, activity
meanstdcolumns <- grep("mean|std", names(samsungdat), value = TRUE)
samsungdat2 <- samsungdat[c("group", "subject", "activity", meanstdcolumns)]

## Remove columns of "meanFreq"
meanFreq <- grep("meanFreq", names(samsungdat2))
samsungdat3 <- samsungdat2[-meanFreq]

## "Melt" our data into a tidy, long format to calculate variable averages
samsungdat3long <- melt(samsungdat3, id = c("group", "subject", "activity"))

## "Cast" our data to calculate the "...[mean]average for every
## variable for each activity and each subject."
samsungdat3means <- cast(samsungdat3long, group + subject +
                                 activity ~ variable, mean)

## Rename to indicate tidy dataset for samsung data
tidymeans <- samsungdat3means

## Write table to a tidydata.txt file to the working directory
write.table(tidymeans, file = "tidydata.txt", sep = "\t", 
            row.names = FALSE, col.names = TRUE)

## Optional code to remove intermediary tables, vectors
## rm(samsungdat2, samsungdat3, samsungdat3long, samsungdat3means, test_activities, test_data, test_data_act, test_data_act_subj, test_data_act_subj_grp, test_subj, testdat, train_activities, train_data, train_data_act, train_data_act_subj, train_data_act_subj_grp, train_subj, traindat, features, meanFreq, meanstdcolumns, testactivities, testcol, testgroup, testsubj, trainactivities, traincol, traingroup, trainsubj)
