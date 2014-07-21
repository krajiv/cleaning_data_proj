#check for the existence of the dataset. The data set directory must be present in the cwd for the analysis.
if (!file.exists("UCI HAR Dataset")) {
        stop("The data set could not be found. Ensure that the data directory 'UCI HAR Dataset' is present in the cwd")
}

#read the feature names
feature <- read.table("UCI HAR Dataset/features.txt")

#read the trainsets
train_sub <- read.table("UCI HAR Dataset/train//subject_train.txt")
colnames(train_sub) <- c("subject")
train_x <- read.table("UCI HAR Dataset/train/X_train.txt")
colnames(train_x) <- as.character(feature$V2)
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
colnames(train_y) <- c("activityId")

# create the train set
train <- cbind(train_sub,train_y)
train <- cbind(train, train_x)

#clean unused data variables to free some memory
rm(train_sub, train_x, train_y)

#read the testsets
test_sub <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(test_sub) <- c("subject")
test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(test_x) <- as.character(feature$V2)
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
colnames(test_y) <- c("activityId")

# create the test set
test <- cbind(test_sub,test_y)
test <- cbind(test, test_x)

#clean unused data variables to free some memory
rm(test_sub, test_x, test_y)

#create a merged dataset
tidy <- rbind(train, test)

#clean unused data variables to free some memory
rm(train, test)

#get the activity label
labels <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(labels) <- c("activityId","activityName")
labled_tidy <- merge(labels, tidy, by="activityId")
#Show tidy data set
message("First three rows of the tidy dataset..")
head(labled_tidy, n=3L)

#get the columns for the standard deviation and mean
std_mean_cols <- grep("std()|mean()", names(labled_tidy))
std_mean_tidy <- labled_tidy[,std_mean_cols]
#Show the std mean data set
message("First three rows of the dataset with standard deviation and mean only..")
head(std_mean_tidy, n=3L)

#create data set with mean of the values
split_data <- split(tidy, tidy$subject)
mean_df <- data.frame()

for (i in split_data) {
        mean_sub <- sapply(i,mean)
        mean_df <- rbind(mean_df, mean_sub)
}
colnames(mean_df) <- names(tidy)

# Show the average data
message("First three rows of average data based on subject")
head(mean_df, n=3L)

#Dump the cleaned data data
write.csv(labled_tidy, "tidy_data.csv", row.names=FALSE)
write.csv(std_mean_tidy, "std_mean.csv", row.names=FALSE)
write.csv(mean_df, "mean_subject.csv", row.names=FALSE)
