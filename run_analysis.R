require(dplyr)

baseFolder <- "./UCI HAR Dataset"

# Load features to use as column names
features <- as.vector(read.csv(paste(baseFolder, "/features.txt", sep = ""), header = F, sep = "")[,2])

#
# Function to load one of the available data sets into a tidy data frame
#
prepareData <- function(type) {
  # Load data from file using features as column names
  data <- read.csv(paste(baseFolder, "/", type, "/X_",type, ".txt", sep = ""), header = F, sep = "", col.names = features)
  
  # Load subjects
  subjects <- as.vector(read.csv(paste(baseFolder, "/", type, "/subject_", type, ".txt", sep = ""), header = F)[,1])
  
  # Load test activities
  labels <- as.vector(read.csv(paste(baseFolder, "/", type, "/y_", type, ".txt", sep = ""), header = F, sep = "")[,1])
  
  # We only care about mean and standard deviation
  data <- select(data, contains("mean"), contains("std"), -contains("meanFreq"), -contains("angle"))
  
  # Insert subject, activity and discriminator columns
  data <- cbind(subject = subjects, activity = labels, type = type, data)
  
  return(tbl_df(data));
}

# Load both the data sets
testData <- prepareData("test");
trainData <- prepareData("train");

# Merge the 2 data frames vertically
merged <- rbind(testData, trainData)

# Replace dots (invalid characters) in column names
colnames(merged) <- sub("\\.mean\\.", "Mean", names(merged))
colnames(merged) <- sub("\\.std\\.", "Std", names(merged))
colnames(merged) <- gsub("\\.", "", names(merged))

# Load activities to be used as a lookup table
activities <- read.csv(paste(baseFolder, "/activity_labels.txt", sep = ""), header = F, sep = "")

# Reassing names matching the activity keys to the current activity column
merged$activity <- activities[match(merged$activity, activities[,1]),2]

# Calculate averages by subject and activity
res <- tbl_df(aggregate(merged[4:69], by = list(subject = merged$subject, activity = merged$activity), FUN = mean, na.rm = TRUE))

# Adjust column names to reflect aggregation
colnames(res)[3:68] <- paste(colnames(res)[3:68], "Avg", sep = "")

# Writing result for grading
write.table(res, file = "./tidy_data_set.txt", row.names = F)