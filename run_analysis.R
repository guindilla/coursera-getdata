################################################################################
##                                                                            ##
## This program merges and clean a database of signals for human activity     ##
## recognition using smartphones data set                                     ##
##                                                                            ##
## Due to personal preference, the codign standard used for this assignement  ##
## is the Google's R Style Guide that can be found at the URL below:          ##
## https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml              ##
##                                                                            ##
################################################################################

################################################################################
##  Definition of main variables                                              ##
################################################################################

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data.dir <- "UCI HAR Dataset"
all.filenames <- c("subject_",
               "X_",
               "y_",
               "Inertial Signals/body_acc_x_",
               "Inertial Signals/body_acc_y_",
               "Inertial Signals/body_acc_z_",
               "Inertial Signals/body_gyro_x_",
               "Inertial Signals/body_gyro_y_",
               "Inertial Signals/body_gyro_z_",
               "Inertial Signals/total_acc_x_",
               "Inertial Signals/total_acc_y_",
               "Inertial Signals/total_acc_z_")
data.sets <- c("test", "train")
output.set <- "merged"
file.extension <- ".txt"

subjects.merged <- paste(data.dir,output.set, "subject_merged.txt", sep="/")
data.merged <- paste(data.dir,output.set, "X_merged.txt", sep="/")
activities.merged <- paste(data.dir,output.set, "y_merged.txt", sep="/")

activities <- paste(data.dir, "activity_labels.txt", sep="/")
features   <- paste(data.dir, "features.txt", sep="/")

# Use regexp expressions when defining the following variables
keywords      <- c("mean\\(\\)",
                   "std\\(\\)",
                   "meanFreq\\(\\)")
substitutions <- c("mean\\(\\)" = "Mean",
                   "meanFreq\\(\\)" = "MeanFrequency",
                   "std\\(\\)" = "StandardDeviation",
                   "Acc" = "Accelerometer",
                   "Mag" = "Magnitude",
                   "Gyro" = "Gyroscope",
                   "BodyBody" = "Body",
                   "^f" = "FastFourierTransform",
                   "^t" = "Time",
                   "-" = "")

################################################################################
##  If data directory is not available, download and unzip it                 ##
################################################################################

GetData <- function(url, data.dir) {
    # Checks if the data has already been downloaded. If the data is not
    # present it downloads it in zip format, unzip it and removes the zip file
    # at the end, leaving only the data folder.
    #
    # Args:
    #   url: URL where the data is located in zip format
    #   data.dir: directory where the data will be stored
    #
    # Returns:
    #   Directory with the required data
    
    zip.file <- "data.zip"
    
    if(!file.exists(data.dir)) {
        download.file(url, destfile = zip.file)
        unzip(zip.file)
        file.remove(zip.file)
    } else {
        print(paste("Directory '", data.dir, "' already exists", sep = ""))
    }    
}

################################################################################
##  Merges the training and test sets to create one data set                  ##
################################################################################

MergeFiles <- function(all.filenames) {
    # Merges different files into a single dataset
    #
    # Args:
    #   all.filenames: vector with all file names to merge
    #
    # Returns:
    #   Table with the new merged data
    
    m <- matrix(, nrow = 0, ncol = 0)  # Initializing empty output data

    for (file in all.filenames) {
        data <- read.table(file)
        m <- rbind(m, data)
    }
    return(m)
}

#  Create new merged datafile if not already done
CreateMergedDatabase <- function(data.dir,
                                 data.sets,
                                 all.filenames,
                                 output.set,
                                 file.extension){
    # Merges different datasets into a new single dataset with both readings
    #
    # Args:
    #   data.dir: string with the name of directory where data is stored
    #   data.sets: string with the reference names of the data to merge
    #   all.filenames: vector with all file names to merge
    #   output.set: string with the reference name of the output data
    #   file.extension: string with the extension name of the files
    #
    # Returns:
    #   N.a.
    if(!file.exists(paste(data.dir, output.set, sep="/"))) {
        dir.create(paste(data.dir, output.set, sep="/"))
        dir.create(paste(data.dir, output.set, "Inertial Signals", sep="/"))
        for (f in all.filenames) {
            test.file   <- paste(data.dir,
                                 data.sets[1],
                                 paste(f, data.sets[1], file.extension, sep=""),
                                 sep="/")
            train.file  <- paste(data.dir,
                                 data.sets[2],
                                 paste(f, data.sets[2], file.extension, sep=""),
                                 sep="/")
            merge.file  <- paste(data.dir,
                                 output.set,
                                 paste(f, output.set, file.extension, sep=""),
                                 sep="/")
            
            merge.data <- MergeFiles(c(test.file, train.file))
            write.table(merge.data, file = merge.file,
                        col.names=FALSE, row.names = FALSE)
        }
    } else {
        print("Databases already merged")
    }    
}

################################################################################
##  Extracts only the measurements on the mean and standard deviation for     ##
##  each measurement                                                          ##
################################################################################

SelectFeatures <- function(features, keywords) {
    # Selects pertinent columns that contain at least one keyworkd from a list
    # of keywords.
    #
    # Args:
    #   features: file with the names of all features present in the DB
    #   keyword: vector with keywords to search based on regexp
    #
    # Returns:
    #   Vector with the list of selected columns

    features <- read.table(features)
    names(features) <- c("id", "name")
    
    output <- matrix(, nrow = 0, ncol = 0)  # Initializing empty output data
    
    for (k in keywords) {
        output <- rbind(output,
                        features[grep(k, features$name),])
    }
    return(as.vector(output$name))
}

LoadMergedDatabase <- function(data.merged, features, selected.features) {
    # Load features database and selects only specific columns
    #
    # Args:
    #   data.merged: name of file where the merged features data is stored
    #   features: name of file where the names of the features are stored
    #   selected.features: vector with the names of the specific columns
    #                      to select
    #
    # Returns:
    #   Dataframe with the list of selected columns from feature readings
    
    # Reading features and feature names, creating a working database
    data <- read.table(data.merged)
    features <- read.table(features)
    names(features) <- c("id", "name")
    names(data) <- features$name

    # Extract only the columns requested 
    data <- data[,selected.features]
    
    return(data)
}

################################################################################
##  Appropriately labels the data set with descriptive activity names         ##
################################################################################

CleanFeatureNames <- function(selected.features, substitutions) {
    # Rewrite feature names by eliminating and substituting sub-strings
    #
    # Args:
    #   features: vector of features (as strings)
    #   substitutions: list with two pairs  strings to substitute and their
    #   substitution. To eliminate a string, simply 
    #
    # Returns:
    #   Vector with the list of selected columns
    for (s in names(substitutions)) {
        selected.features <- gsub(s,substitutions[s], selected.features)
    }
    return(selected.features)
}

NameMergedDatabase <- function(database, feature.names) {
    # Add names to merged database
    #
    # Args:
    #   database: dataframe with the activity data
    #   feature.names: vector with names of features
    #
    # Returns:
    #   Dataframe with names of features added
    names(database) <- feature.names
    return(database)
}

################################################################################
##  Uses descriptive activity names to name the activities in the data set    ##
################################################################################

library(Hmisc)
RenameActivities <- function(activities) {
    # Rename activity names based on simple rules: all small caps and
    # separated words
    #
    # Args:
    #   activities: name of file where the activity names are stored
    #
    # Returns:
    #   Dataframe with the id and new name of the activities

    # use the gsub function
    # gsub(pattern, replacement, x)
    # gsub("is", "XY", x)
    data <- read.table(activities)
    names(data) <- c("id", "name")
    
    ## Put all activities in small caps and separate them by word
    data$name <- capitalize(tolower(data$name))
    data$name <- gsub("_", " ", data$name)
    return(data)
}

AddActivities <- function(database, activities.merged, activities.table) {
    # Adds an user column at the left of the database
    #
    # Args:
    #   database: dataframe with the activity data
    #   activities.merged: file with the id of activities
    #
    # Returns:
    #   Dataframe with activity column added at the left
    data <- read.table(activities.merged)
    
    # Changing codes to numbers
    ## NBED Works but still don't really know why
    data[,1] <- sapply(data[,1], function(x) {return(activities.table[activities.table$id == x,]$name)})
    names(data) <- c("Activities")
    database <- cbind(data, database)
    database$Activities <- as.factor(database$Activities)
    return(database)
}

AddSubjects <- function(database, subjects.merged) {
    # Adds an activity column at the left of the database
    #
    # Args:
    #   database: dataframe with the activity data
    #   subjects.merged: file with the id of subjects considered in the study
    #
    # Returns:
    #   Dataframe with subject column added at the left

    data <- read.table(subjects.merged)
    names(data) <- c("Subjects")
    database <- cbind(data, database)
    database$Subjects <- as.factor(database$Subjects)
    return(database)
}

################################################################################
##  Creates a second, independent tidy data set with the average of each      ##
##  variable for each activity and each subject                               ##
################################################################################

ReshapeDataset <- function(database) {
    # Reshapes the database in order to provide the average value of each
    # variable for each subject and activity
    # 
    # Args:
    #   database: dataframe with the activity data subjects.merged: file
    # 
    # Returns: Reshaped dataframe with average values

    library(reshape2)
    output <- melt(database, id=c("Subjects", "Activities"))
    output <- dcast(output, Subjects+Activities~variable, mean)
    return(output)
}

################################################################################
##  Helper functions                                                          ##
################################################################################

MakeNamesList <- function(database) {
    lines <- ""
    for (n in names(database)) {
        lines <- paste(lines, "**", n, ":** ", "\n\n", sep="")
    }
    write.table(lines, file="activities.txt",
                quote = FALSE, col.names=FALSE, row.names=FALSE)
}

################################################################################
##  Main program                                                              ##
################################################################################

# Download the data
GetData(url, data.dir)

# Merges the training and the test sets to create one data set
CreateMergedDatabase(data.dir, data.sets, all.filenames,
                     output.set, file.extension)

# Extracts only the measurements on the mean and standard deviation for each
# measurement.
selected.features <- SelectFeatures(features, keywords)
database <- LoadMergedDatabase(data.merged, features, selected.features)

# Appropriately labels the data set with descriptive activity names
feature.names <- CleanFeatureNames(selected.features, substitutions)
database <- NameMergedDatabase(database, feature.names)

# Uses descriptive activity names to name the activities in the data set
activities.table <- RenameActivities(activities)
database <- AddActivities(database, activities.merged, activities.table)
database <- AddSubjects(database, subjects.merged)

# Creates a second, independent tidy data set with the average of each variable
# for each activity and each subject
reshaped.database <- ReshapeDataset(database)
write.csv(reshaped.database, file = 'tidyDataset.csv', row.names = FALSE)
