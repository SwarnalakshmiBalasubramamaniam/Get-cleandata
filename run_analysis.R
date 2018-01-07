run_analysis <- function()
{
  ##Readsthe file from the directory
  xtrainfile <- read.table("train/X_train.txt")
  featuresfile<-read.table("features.txt")
  xtestfile <- read.table("test/X_test.txt")
  testsubjectfile<-read.table("test/subject_test.txt")
  trainsubjectfile<-read.table("train/subject_train.txt")
  ytrainfile <-read.table("train/y_train.txt")
  ytestfile <- read.table("test/y_test.txt")
  activityfile<-read.table("activity_labels.txt")
  
  #rename columns
  colnames(xtrainfile) <- featuresfile$V2
  colnames(xtestfile) <- featuresfile$V2
  
  #Bind the subject file
  xtrainfile<-cbind(xtrainfile,trainsubjectfile$V1)
  xtestfile<-cbind(xtestfile,testsubjectfile$V1)
  names(xtrainfile)[562]<-"subject"
  names(xtestfile)[562]<-"subject"
  
  #combine activities
  xtrainfile<-cbind(xtrainfile,ytrainfile$V1)
  xtestfile<-cbind(xtestfile,ytestfile$V1)
  names(xtrainfile)[563]<-"activity"
  names(xtestfile)[563]<-"activity"
  
  #combining data frames
  combineddataframe <- rbind(xtrainfile,xtestfile)
  fcolnames<- grep("*mean*|*std*",names(combineddataframe),value = TRUE)
  
  #adds the subject and activity column names to the filtered column names
  fcolnames[length(fcolnames)+1]<-"subject"
  fcolnames[length(fcolnames)+1]<-"activity"
  
  #creates the combined data frame only with mean/std columns along with subject and activity
  combineddf<-subset(combineddataframe,select=(names(combineddataframe) %in% fcolnames)) 
  
  #Replacing with activity names
  combineddf$activity = apply(combineddf["activity"],1,function(x)
  {
    activityfile<-read.table("activity_labels.txt")
    for(j in 1:nrow(activityfile ))
    {
      if( trimws(x) == trimws(activityfile[j,1]) )
      {
        x <- as.character(activityfile[j,2])

      }

    }
    x
  })
  #calculating the mean in the final tidy set
  meandf<- aggregate(combineddf[,1:(ncol(combineddf)-2)],list(activity=combineddf$activity,subject=combineddf$subject),mean)
  #Writing the final data frame to a csv file
  write.table(meandf,"analysis.csv",quote=F,row.names = F)
} 