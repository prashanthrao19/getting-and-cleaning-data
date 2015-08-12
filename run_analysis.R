run_analysis<- function(){
        
        # read test data
        test_x <- read.table("./data/test/X_test.txt")
        test_y <- read.table("./data/test/y_test.txt")
        test_subject <- read.table("./data/test/subject_test.txt")
        
        #read train data
        train_x <- read.table("./data/train/X_train.txt")
        train_y <- read.table("./data/train/y_train.txt")
        train_subject <- read.table("./data/train/subject_train.txt")
        
        # read activity labels 
        activities <- read.table("./data/activity_labels.txt",col.names = c("activityID","activityLabel"))
        activity_names<- activities[,2]
        activity_names <- gsub("_","",activity_names)
       
        #read features
        features <- read.table("./data/features.txt",col.names = c("featureID","featureLabel"))
        featurenames<- features[,2]
        featurenames_included <- grep("-mean\\(\\)|-std\\(\\)",featurenames)
        featurenames_neat <- gsub("\\(|\\)","",featurenames[featurenames_included])
        
        # merge test and training data and name them
        X <- rbind(test_x,train_x)
        X<- X[,featurenames_included]
        colnames(X)<- featurenames_neat
        
        Y<- rbind(test_y,train_y)
        names(Y)<- "activityID"
        
        subject<- rbind(test_subject,train_subject)
        names(subject) <- "subjectID"
        
        activity<- merge.data.frame(Y,activities,by.x= "activityID", by.y= "activityID")
        activity<- activity[,2]
        
        # merge data frames of different columns in to single data frame
        data<- cbind(subject,activity,X)
        write.table(data,"./merged_tidy_data.txt",row.names = FALSE)
        
        # create data table grouped by "subject" and "activity" after applying mean and Standard deviation calculations
        library(data.table)
        data_table<- data.table(data)
        calculated_data<- data_table[,lapply(.SD, mean),by =c("subjectID","activity")]
        write.table(calculated_data,"./calculated_tidy_data.txt",row.names = FALSE)
        
}