'Loading datasets'
'Test datasets'
subjectTest <- read.table("UCIHARDataset/test/subject_test.txt")
xTest<- read.table("UCIHARDataset/test/X_test.txt")
yTest <- read.table("UCIHARDataset/test/y_test.txt")
'Train datasets'
subjectTrain <- read.table("UCIHARDataset/train/subject_train.txt")
xTrain <- read.table("UCIHARDataset/train/X_train.txt")
yTrain <- read.table("UCIHARDataset/train/y_train.txt")
'Feature catalog'
features <- read.table("UCIHARDataset/features.txt", sep=" ")
'Activity catalog'
activity <- read.table("UCIHARDataset/activity_labels.txt")

'Setting variables names for subject test dataset'
colnames(subjectTest) <- c("subject")
'Setting variables names for x Test dataset'
colnames(xTest) <- features$V2
'Adding activity description to y Test dataset'
yTest$activity_label <- activity$V2[match(yTest$V1,activity$V1)]
'Setting variables names for y Test dataset'
colnames(yTest) <-c("id_activity_label","activity_label")
'Combining 3 Test datasets'
test <-cbind(subjectTest,yTest,xTest)

'Setting variables names for subject train dataset'
colnames(subjectTrain)<-c("subject")
'Setting variables names for x Train dataset'
colnames(xTrain)<-features$V2
'Adding activity description to y Train dataset'
yTrain$activity_label <- activity$V2[match(yTrain$V1,activity$V1)]
'Setting variables names for y Train dataset'
colnames(yTrain)<-c("id_activity_label","activity_label")
'Combining 3 Train datasets'
train <-cbind(subjectTrain,yTrain,xTrain)
'Adding a type column to test dataset'
test$type <-"test"
'Adding a type column to train dataset'
train$type <- "train"
'Union of test and train dataset'
dataset <- rbind(test,train)

'Build a new dataset with measurements on the mean and standard deviation for each measurement.'
meanAndStdColumns <-grep("mean\\(|std",colnames(dataset))
datasetMeanAndStd <- dataset[meanAndStdColumns]

'data set with the average of each variable for each activity and each subject'
newDataset <-cbind(dataset$activity_label,dataset$subject,datasetMeanAndStd)
datasetMelt <-melt(newDataset,id=c("dataset$activity_label","dataset$subject"))
datasetSummarize <-dcast(datasetMelt,dataset$activity_label+dataset$subject~variable,fun.aggregate=mean, na.rm=TRUE)
