#' WatsonR - Tone Analyzer
#'
#'  Tone Analysis receives an utterance and returns
#'  @param NONE
#'  @return NOTHING
#'  @export

watson.tone.analyze <- function(utterance) {

      library(RCurl) # to talk to Watson - REST APIS # install.packages("RCurl") # if the package is not already installed
      library(httr) # comms
      library(XML)  # comms and data
      library(data.table) # data shaping
      library(reshape2) # data shaping
      library(tidyr) # data cleaning
      library(dplyr) # data cleaning

      print("Tone Analyzer - Analyzing...")
      utterance <- URLencode(utterance)
      data <- getURL(paste("https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19&text=",utterance,sep=""),userpwd = username_password_TON )
      data <- as.data.frame(strsplit(as.character(data),"\"score\""))
      data <- data[-c(1), ] # remove dud first row
      data  <- gsub("\"tone_id\":","",data)
      data  <- gsub(":","",data)
      data  <- gsub("\"","",data)
      data  <- gsub("_big5","",data)
      data <- data.frame(data)
      data <- data.frame(do.call('rbind', strsplit(as.character(data$data),',',fixed=TRUE)))
      data <- data[,-c(3:6), ] # remove dud columns
      data <- data[c(1:13), ] # just top 13 (not sure why we have it repeating)
      data <- data[c("X2", "X1")]
      data$X1 <- as.character.numeric_version(data$X1) # not sure why, but coercing to numbers requires this
      data$X1 <- as.numeric(data$X1)
      data$X1 <- round((data$X1),2)
      setnames(data,c("trait","signal"))
      data
      return(data)
}


#' WatsonR - Tone Analyzer - Demo
#'
#'  Tone Analysis Demo
#'  @param Demo String
#'  @return NOTHING
#'  @export

watson.tone.demo <- function() {
  print("EXAMPLE: Angry and Confident person:")
  print("I am so angry that I got a speeding ticket. I'm certain it's the last time!")
  watson.tone.analyze("I am so angry that I got a speeding ticket. I'm certain it's the last time!")
}


