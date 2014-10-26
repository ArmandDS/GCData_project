### Project 1 
require("data.table")


### Read  from file and merge data
data.feature<-read.table("./UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
x.test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y.test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names="label")

x.train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y.train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names="label")

labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE, col.names=c("label", "activity"))
labels.train<-(merge(x=y.train, y=labels, by.x="label", by.y="label"))
labels.test<-(merge(x=y.test, y=labels, by.x="label", by.y="label"))

subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="subject")
subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="subject")


names(x.train)<-data.feature$V2
names(x.test)<-data.feature$V2

names(subject.test)<-"subject"

## Merge all data
all.data <- rbind(cbind(subject.test, labels.test, x.test), cbind(subject.train, labels.train, x.train))


## loooking for mean and std indexes

features.ext <- data.feature[grepl("mean|std", data.feature[,"V2"]),"V2"]

## extract mean and std 
train.mean.std<-x.train[,features.ext]
test.mean.std<-x.test[,features.ext]

## creating tidy data with columm mean

total <- aggregate(all.data[, 4:ncol(all.data)],by=list(label_id = all.data$label, subject = all.data$subject, activity=all.data$activity),mean)

total<-total[order(total$label_id),]

## write to file

write.table(format(total, scientific=TRUE), "tidydata.txt", row.names=FALSE, col.names=FALSE)
