Getting and Cleaning Data: Course project
========================================================

In the context of the Coursera project *Getting and Cleaning Data* this repository contains all code and information required to replicate the cleaning process of a dataset composed of data collected from the accelerometers from the Samsung Galaxy S smartphone in the context of trying to recognize human activity based on smartphone readings.

A full description is available at the [site where the data was obtained](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
 
The operations done with the data are indicated in the list below, and will be explained in further detail in the following chapters:

1. Download the data
1. Merges the training and the test sets to create one data set
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Appropriately labels the data set with descriptive activity names
1. Uses descriptive activity names to name the activities in the data set
1. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

The code used for getting, merging and publishing the cleaned dataset is present in the *run_analysis.R* file, and can be simply launched from the command line as follows:
```{r}
source("run_analysis.R")
```

Make sure to set your working directory beforehand to the directory where the file is with the **setwd()** command.

There should be no need to modify the default values for the main variables of the program.

## Download the data ##
Code has been done to automatically download the data if not present in the working directory. In order to save disk space, the compressed file is deleted.

## Merge training and test sets ##
While the assignement was unclear on wether the merge should hapen in memory only, the program merges the data sets and copies to disk the new merged database in the */merged* folder.

This folder contains exactly the same files as the two other */test* and */train* folders but with the file names explicitely indicating they belong to the *merge* database.

For instance, the merge of the *subject_test.txt* and *subject_train.txt* file will be named *subject_merged.txt*.

The merge process is simply done by looping over each file, opening it from the */test* and */train* folders, reading it, merging it and saving it in a new file in the */merge* folder. This operation is done by the **MergeFiles()** function.

Although not explicitely required by the assignement, the merge process includes the files in the */Inertial Signals* folder.

## Extract measurements on mean and standard deviation ##
The first step is to identify which data to select. The assignment indicates that "only the measurements on the mean and standard deviation" should be considered. 

An overview of the *features_info.txt* file provided with the data indicates that the mean and standard deviation estimations for the variables considered could be identified by the *mean()*, *std()* and *meanFreq()* extensions. Furthermore, a full list of variable names is provided in the *features.txt* file provided with the database.

The **SelectFeature()** function reads this *features.txt* file and selects all variable names with the  *mean()* , *std()* and *meanFreq()* extensions using a simple **grep()** function.

While there are other variables that could have included means and standard deviations, they have been ignored under the premises that they were additional vectors resulting from operations applied to other signals, and as such not a primary source. Examples are:
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

Once the variables have been identified, the merged database is loaded into a data frame and the specific columns selected. This is done in the **LoadMergedDatabase()** function.

## Label the data set with descriptive activity names ##
The standard chosen for descriptive activity names are non-shortened names following a CamelCase standard. CamelCase appears to be better suited for long variable names with no spaces.

The base taken to define variable names are their original activity names - e.g. fBodyAccJerkMag-mean() - where basic substitutions are done with the **gsub()**, as indicated below:
* *mean()* changed to *Mean*
* *meanFreq()* changed to *MeanFrequency*
* *std()* changed to *StandardDeviation*
* *Acc* changed to *Accelerometer*
* *Mag* changed to *Magnitude*
* *Gyro* changed to *Gyroscope*
* *BodyBody* changed to *Body* - no explanation was provided to a *BodyBody* variable and it was deduced it might be a bug that is corrected here
* *t* at the beginning of variable name changed to *Time*
* *f* at the beginning of variable name changed to *FastFourierTransform*
* *-* characters are deleted

The names are added to the database with the **NameMergedDatabase()** function.

## Use descriptive activity names ##
Activity names are stored in the *activities.txt* file, and have an id associated. In order to use more descriptive activities, we read the file and modify the names according to those rules in the **RenameActivities()** function:
* Replace underscores that separate words with spaces
* Put all letters in smallcaps but for the first letter of each activity

The **AddActivities()** function read the activities file and add them to the database, although it first substitute their numeric values by their equivalent code. The activities column is added at the left of the database.

The **AddSubjects()** function read the subject file and add them to the database. The subjects column is added at the left of the database.

## Create a second, independent tidy data set ##
In the last step, the average of each variable for each activity and each subject is calculated and presented in a new dataset that is then saved in the same workind directory as *tidyDataset.csv*.

The **ReshapeDataset()** function does a standard **melt()** and **dcast()** procedure to automatically create a new database. Its structure is stored in the *CodeBook.md* file.