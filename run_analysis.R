run_analysis<- function(){
        # set working directory
        setwd("C:\\Users\\rao\\Documents\\data")
        # read test data
        test_x <- read.table("./test/X_test.txt")
        test_y <- read.table("./test/y_test.txt")
        test_subject <- read.table("./test/subject_test.txt")
        #read train data
        train_x <- read.table("./train/X_train.txt")
        train_y <- read.table("./train/y_train.txt")
        train_subject <- read.table("./train/subject_train.txt")
        
        # read labels
        activities <- read.table("./activity_labels.txt",col.names = c("activityID","activityLabel"))
        activity_names<- activities[,2]
        activity_names <- gsub("_","",activity_names)
       
         #read features
        features <- read.table("./features.txt",col.names = c("featureID","featureLabel"))
        featurenames<- features[,2]
        featurenames_included <- grep("-mean\\(\\)|-std\\(\\)",featurenames)
        featurenames_neat <- gsub("\\(|\\)","",featurenames[featurenames_included])
        
        X <- rbind(test_x,train_x)
        Y<- rbind(test_y,train_y)
        names(Y)<- "activityID"
        subject<- rbind(test_subject,train_subject)
        names(subject) <- "subjectID"
        X<- X[,featurenames_included]
        colnames(X)<- featurenames_neat
        activity<- merge.data.frame(Y,activities,by.x= "activityID", by.y= "activityID")
        activity<- activity[,2]
        data<- cbind(subject,activity,X)
        write.table(data,"./merged_tidy_data.txt")
        
        library(data.table)
        data_table<- data.table(data)
        calculated_data<- data_table[,lapply(.SD, mean),by =c("subjectID","activity")]
        write.table(calculated_data,"./calculated_tidy_data.txt")
        
}