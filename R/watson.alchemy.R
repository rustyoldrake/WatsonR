#' WatsonR - Alchemy Language Test
#'
#'  Alchemy Language Functions - Light Test
#'  @param NONE
#'  @return NOTHING - just prints the response (hopefully 200 & API response) on screen
#'  @export

watson.alchemy.test <- function() {
  library(httr)
  print("Short Test of Alchemy - Hitting Endpoint; Checking Credentials OK and Transactions Consumed ")
  GET(url=paste("http://gateway-a.watsonplatform.net/calls/info/GetAPIKeyInfo?apikey=",username_password_ALCH,"&outputMode=json",sep=""))
 }


#' WatsonR - Alchemy Language COMBINED Calles
#'
#'  Alchemy Language Functions -- Receives text and returns MULTPLE Features like keyword, entity, sentiment, tone
#'  @param String to be Analyzed by Alchemy's combined call
#'  @return JSON formatted like this http://www.alchemyapi.com/api/combined/textc.html
#'  @export

watson.alchemy.combined <- function(utterance) {
  library(httr)
  print("Alchemy combined call- running multiple Alchemy Language calls")

  alchemy_url <- "http://gateway-a.watsonplatform.net/calls/text/"
  api_feature <- "TextGetCombinedData"
  output_mode <- "json"
  utterance <- URLencode(utterance) #in case we have spaces, we need %20

  query <- paste(alchemy_url,api_feature,"?extract=keyword,entity,taxonomy,concept,doc-sentiment,doc-emotion&apikey=",username_password_ALCH,"&text=",utterance,"&outputMode=",output_mode, sep="")
  query
  response <- POST(query)
  print(response)
  return(content(response))
}


