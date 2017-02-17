#' WatsonR - Natural Language Classifier (NLC) - CREATE
#' CREATE NEW CLASSIFIER - post /v1/classifiers -
#' Creates a classifier with CSV data ## URL below no "/" after base url
#'
#' NLC1
#' @param creds the name of the credentials file in json format
#' @param csvfile File of Ground Truth to Train;  Name of the New Classifier
#' @param classifiername The name to assign to the new classifier
#' @return NOTHING
#' @export
#'
watson.nlc.createnewclassifier <- function(creds, csvfile,classifiername) {
  credentials = rjson::fromJSON(,creds)
  return(httr::POST(url="https://gateway.watsonplatform.net/natural-language-classifier/api/v1/classifiers",
              authenticate(credentials$username,credentials$password),
              body = list(training_data = upload_file(csvfile),
                          training_metadata = paste("{\"language\":\"en\",\"name\":\"",classifiername,"\"}",sep=""))
              )
         )}


#' WatsonR - Natural Language Classifier (NLC) - LIST
#' LIST ALL CLASSIFIERS AND RETURN NEAT LIST
#' NLC2
#' @param creds the name of the credentials file in json format
#' @return LIST OF CLASSIFIERS
#' @export
#'
watson.nlc.listallclassifiers <- function(creds){
  credentials = rjson::fromJSON(,creds)
  username_password = paste(credentials$username,credentials$password,sep=":")
  base_url_nlc = "https://gateway.watsonplatform.net/natural-language-classifier/api/v1/classifiers/"
  data <- RCurl::getURL(base_url_nlc,userpwd = username_password )
  return(rjson::fromJSON(data))
}

#' WatsonR - Natural Language Classifier (NLC) - STATUS Check
#'
#' CHECK CLASSIFIER STATUS
#' IF YOU GET MESSAGE BELOW - YOU NEED TO WAIT!
#' Can take 15m for some medium size classifers (longer for larger ones)
#'      "The classifier instance is in its training phase,
#'      not yet ready to accept classify requests"
#' @param creds the name of the credentials file in json format
#' @param  Classifier ID
#' @return Classifier Status
#' @export
#'
watson.nlc.checkclassifierstatus <- function(creds, classifier_id) {
  credentials = rjson::fromJSON(,creds)
  username_password = paste(credentials$username,credentials$password,sep=":")

  base_url_nlc = "https://gateway.watsonplatform.net/natural-language-classifier/api/v1/classifiers/"
  return(RCurl::getURL(paste(base_url_nlc,classifier_id,sep=""),userpwd = username_password))
}

#' WatsonR - Natural Language Classifier (NLC) - PROCESS TEXT
#' ACCEPT QUERY & RETURN RESULT: classifier and confidence score from text input
#'
#' @param creds the name of the credentials file in json format
#' @param classifier_id the classifier identification uuid
#' @param query_text to Pass to Classifier
#' @return Classifiers, with confidence
#' @export
#'
watson.nlc.processtext <- function(creds, classifier_id, query_text){
  credentials = rjson::fromJSON(,creds)
  username_password = paste(credentials$username,credentials$password,sep=":")

  base_url_nlc = "https://gateway.watsonplatform.net/natural-language-classifier/api/v1/classifiers/"
  query_text <- URLencode(query_text)
  data <- RCurl::getURL(paste(base_url_nlc,classifier_id,"/classify","?text=", query_text,sep=""),userpwd = username_password)
  return(rjson::fromJSON(data))
}
### end of function

#' WatsonR - Natural Language Classifier (NLC) - DELETE Classifier
#'  Receives name of Classifier to Kill; May not be able to do this until training complete
#'
#' NLC5
#' @param  Classifier ID
#' @return Message that you've killed the classifier (but not the service)
#' @export
###### NLC FUNCTION - DELETE CLASSIFIER -
watson.nlc.deleteclassifier <- function(creds, kill_classifier) {
  credentials = rjson::fromJSON(,creds)
  base_url_nlc = "https://gateway.watsonplatform.net/natural-language-classifier/api/v1/classifiers/"
  httr::DELETE(url=paste(base_url_nlc,kill_classifier,sep=""),
               authenticate(credentials$username, credentials$password))
}



