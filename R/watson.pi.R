#' WatsonR - Personality Insights (PI) - Analyze
#'
#' Personality Insights
#' @param creds the name of the credentials file in json format
#' @param text_passage Long text passage to analyze - has to be more than 100 words, better if more than 2500
#' @return 52 Psychometric traits - big 5, needs, values, personalit
#' @export

watson.pi.analyze <- function(creds, text_passage) {
      print("Personality Insights")
      ##text_passage <- URLencode(text_passage) ## NO NO NO - no URL encode here  (need to resarch why )
      pi_url="https://gateway.watsonplatform.net/personality-insights/api/v3/profile"
      credentials = rjson::fromJSON(,creds)

      data <- httr::POST(url=pi_url,
           httr::authenticate(credentials$username, credentials$password),
#           httr::add_headers("Content-Type"="text/plain","charset"="utf-8"),
           body = paste("--data-binary",text_passage, sep=" "))
      ##data
      ##return(response)
      # content(data,"text")
      ## 400 erros come sometimes if not enough words
#      data <- as.data.frame(strsplit(as.character(data),"\"id\":\""))
#      data <- data[-c(1:5), ] # remove dud first row
#      data <- data.frame(matrix(data))
#      data[,1]  <- gsub("\"","",data[,1] )
#      data <- data.frame(do.call('rbind', strsplit(as.character(data$matrix.data),',',fixed=TRUE)))
#      data <- data[!grepl('name:',data$X5),]
#      data <- data[!grepl('children:',data$X5),]
#      data <- data[,-c(2,6), ] # remove columns we dont need - duplicates or dont care for SAMPLING ERROR (now) but mght later
#      data.table::setnames(data,c("trait","category","percentage","error"))
#      data$percentage <- gsub("percentage:","",data$percentage)
#      data$category <- gsub("category:","",data$category)
#      data$error <- gsub("sampling_error:","",data$error)
#      data$error <- gsub("}","",data$error) # crude but effective
#      data$error <- gsub("]","",data$error) # crude but effective
#      data$percentage <- round((as.numeric(data$percentage)),4) # if you prefer % format like this
#      data$error <- round((as.numeric(data$error)),4) # if you prefer % format like this
#      rownames(data) <- NULL # resets row names to remove 'gaps'
#      data$row <- as.numeric(rownames(data))
      return(data)
}

#' WatsonR - Personality Insights (PI) - DEMO
#'
#' Personality Insights - Demo using a Ronald Reagan Speech #
#' @param creds the name of the credentials file in json format
#' @param Pulls Ronald Reagan speech that is included in the library
#' @return 52 Psychometric traits - big 5, needs, values, personalit
#' @export

watson.pi.demo <- function(creds) {
  print("Loading Text for Ronald Reagan Speech 1986 - Space Shuttle Challenger")
  text <-  read.table("data/ronald_reagan_speech.txt", fill=TRUE, header=FALSE)
  ##I Think this is erroing out on my build - may be issue here
  watson.pi.analyze(creds, text[1,])
}



