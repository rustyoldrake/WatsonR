#' WatsonR - Speech to Text (STT) PROCESS - receives WAV File
#'
#'  Speech to Text
#'  @param Receives WAV File - rather a pointer to where FILE.WAV is
#'  @return Transcript (Vanilla) of WAV file; omits all other data
#'  @export

watson.stt.process <- function(filename) {
  print("Speech to text - processing WAV file that is passd to us ")
  print("Sending Test WAV file to Speech to Text service for processing... ")
  data <- httr::POST(url="https://stream.watsonplatform.net/speech-to-text/api/v1/recognize",
               authenticate(username_STT,password_STT),
               add_headers("Content-Type"="audio/wav"),
               body = (file = upload_file(filename))
  )

  print(data$status_code) # print a 200 if all is well
  data <- httr::content(data,"text") # just text from JSON
  data <- as.data.frame(strsplit(as.character(data),"\\n"))
  data <- data[c(7), ] # for now, grab just what we want
  data <- paste(data) # kill levels, - fyi this nukes confidence % info (may want later)
  data <- gsub("  ","",data) # remove excessive whitespace  0 cannot use ALL [[punct]] here
  data <- gsub("\\\\","",data) # remove punct we dont like
  data <- gsub("\"","",data) # remove punct we dont like
  data <- gsub("transcript","",data) # remove excessive whitespace
  data <- gsub(":","",data) # remove excessive whitespace - later: Improve this tidy step.
  return(data)
}


#' WatsonR - Speech to Text (STT) TEST - WAV to Transcript
#'
#'  Speech to Text
#'  @param NONE - WAV file test is part of package
#'  @return Transcript (Vanilla) of WAV file; omits all other data
#'  @export

watson.stt.test <- function() {
  print("Speech to text Test using the speech_test.WAV Test file in the ")
  print("Sending Test WAV file to Speech to Text service for processing... ")
  data <- httr::POST(url="https://stream.watsonplatform.net/speech-to-text/api/v1/recognize",
               authenticate(username_STT,password_STT),
               add_headers("Content-Type"="audio/wav"),
               body = (file = upload_file("media/STT_speech_test.wav"))
  )

  print(data$status_code) # print a 200 if all is well
  data <- httr::content(data,"text") # just text from JSON
  data <- as.data.frame(strsplit(as.character(data),"\\n"))
  data <- data[c(7), ] # for now, grab just what we want
  data <- paste(data) # kill levels, - fyi this nukes confidence % info (may want later)
  data <- gsub("  ","",data) # remove excessive whitespace  0 cannot use ALL [[punct]] here
  data <- gsub("\\\\","",data) # remove punct we dont like
  data <- gsub("\"","",data) # remove punct we dont like
  data <- gsub("transcript","",data) # remove excessive whitespace
  data <- gsub(":","",data) # remove excessive whitespace - later: Improve this tidy step.
  return(data)
}

#
