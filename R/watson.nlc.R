#' WatsonR - Natural Language Classifier (NLC) - CREATE
#'
#' NLC1
#'  @param CSV File of Ground Truth to Train;  Name of the New Classifier
#'  @return NOTHING
#'  @export

###### NLC FUNCTION CREATE NEW CLASSIFIER - post /v1/classifiers - Creates a classifier with CSV data ## URL below no "/" after base url
watson.nlc.createnewclassifier <- function(file,classifiername) {
  return(POST(url="https://gateway.watsonplatform.net/natural-language-classifier/api/v1/classifiers",
              authenticate(username_NLC,password_NLC),
              body = list(training_data = upload_file(file),
                          training_metadata = paste("{\"language\":\"en\",\"name\":\"",classifiername,"\"}",sep=""))
              )
         )}



#' WatsonR - Natural Language Classifier (NLC) - LIST
#'
#' NLC2
#'  @param  NOTHING
#'  @return LIST OF CLASSIFIERS
#'  @export

###### NLC FUNCTION: LIST ALL CLASSIFIERS AND RETURN NEAT LIST
watson.nlc.listallclassifiers <- function(){
  library(data.table)
  library(splitstackshape)
  base_url_nlc = "https://gateway.watsonplatform.net/natural-language-classifier/api/v1/classifiers/"
  data <- getURL(base_url_nlc,userpwd = username_password_NLC )
  data <- as.data.frame(strsplit(as.character(data),"classifier_id"))
  data <- data[-c(1), ] # remove dud first row
  data <- data.frame(matrix(data))
  colnames(data) <- "V1"
  data$V1 <- gsub("[{}]","", data$V1)
  data$V1 <- gsub("]","", data$V1)
  data$V1 <- gsub("\"","", data$V1)
  data$V1 <- gsub("name:","", data$V1)
  data$V1 <- gsub(":","", data$V1)
  data <- cSplit(data, 'V1', sep=",", type.convert=FALSE)
  data[,c(2,4)] <- NULL
  data <- as.data.table(data)
  setnames(data,c("classifier","name","date_created"))
  data <- data[order(date_created),]
  print(data)
  ## return(data) erroring out
}



#' WatsonR - Natural Language Classifier (NLC) - STATUS Check
#'
#' NLC3
#'  @param  Classifier ID
#'  @return Classifier Status
#'  @export

###### NLC FUNCTION - CHECK CLASSIFIER STATUS
watson.nlc.checkclassifierstatus <- function(classifier_id) {
  return(
    getURL(paste(base_url_nlc,classifier_id,sep=""),userpwd = username_password_NLC)
  )
}
## IF YOU GET MESSAGE BELOW - YOU NEED TO WAIT! Can take 15m for some medium size classifers (longer for larger ones)
## The classifier instance is in its training phase, not yet ready to accept classify requests




#' WatsonR - Natural Language Classifier (NLC) - PROCESS TEXT
#'
#'  NLC4
#'  @param  Text to Pass to Classifier
#'  @return Classifiers, with confidence
#'  @export

###### NLC FUNCTION: ACCEPT QUERY & RETURN RESULT: CLASSIFIER and % FROM TEXT INPUT AND PROCESS TO LOOK GOOD
watson.nlc.processtextreturnclass <- function(classifier_id,query_text){
  query_text <- URLencode(query_text)
  data <- getURL(paste(base_url_NLC,classifier_id,"/classify","?text=", query_text,sep=""),userpwd = username_password_NLC)
  data <- as.data.frame(strsplit(as.character(data),"class_name"))
  data <- data[-c(1), ] # remove dud first row
  data <- gsub("[{}]","", data)
  data <- gsub("confidence","", data)
  data <- data.frame(matrix(data))
  setnames(data,("V1"))
  data$V1 <- gsub("\"","", data$V1)
  data$V1 <- gsub(":","", data$V1)
  data$V1 <- gsub("]","", data$V1)
  data <- cSplit(data, 'V1', sep=",", type.convert=FALSE)
  setnames(data,c("class","confidence"))
  return(data) }
### end of function





#' WatsonR - Natural Language Classifier (NLC) - DELETE Classifier
#'
#'  NLC5
#'  @param  Classifier ID
#'  @return Message that you've killed the classifier (but not the service)
#'  @export
###### NLC FUNCTION - DELETE CLASSIFIER - Receives name of Classifier to Kill; May not be able to do this until training complete
watson.nlc.deleteclassifier <- function(kill_classifier) {
  DELETE(url=(paste(base_url,kill_classifier,sep="")),authenticate(username_nlc,password_nlc))
}


#' WatsonR - Natural Language Classifier (NLC) - PROCESS TEXT
#'
#'  NLC6
#'  @param  Text to Process
#'  @return Classes and % Confidence
#'  @export

###### NLC FUNCTION: ACCEPT QUERY & RETURN RESULT: CLASSIFIER and % FROM TEXT INPUT AND PROCESS TO LOOK GOOD
watson.nlc.processtextreturnclass <- function(classifier_id,query_text){
  query_text <- URLencode(query_text)
  data <- getURL(paste(base_url_NLC,classifier_id,"/classify","?text=", query_text,sep=""),userpwd = username_password_NLC)
  data <- as.data.frame(strsplit(as.character(data),"class_name"))
  data <- data[-c(1), ] # remove dud first row
  data <- gsub("[{}]","", data)
  data <- gsub("confidence","", data)
  data <- data.frame(matrix(data))
  setnames(data,("V1"))
  data$V1 <- gsub("\"","", data$V1)
  data$V1 <- gsub(":","", data$V1)
  data$V1 <- gsub("]","", data$V1)
  data <- cSplit(data, 'V1', sep=",", type.convert=FALSE)
  setnames(data,c("class","confidence"))
  return(data) }

