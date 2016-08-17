#' WatsonR - Text to Speech (TTS) - Speechify the Transcript; demand the voice you want
#'
#' Text to Speech
#' @param TEXT to be made into audio; and Index 1-12 of Voice (see watson.tts.listvoices() for list)
#' @return NOTHING
#' @export

watson.tts.process <- function(transcript,voice_number) {
      library(RCurl) # install.packages("RCurl") # if the package is not already installed
      library(httr)
      library(audio)
      library(splitstackshape)

      voice_list <- watson.tts.listvoices()

      print("Text to Speech - Sending Transcript to TTS service....")

      url <- "https://stream.watsonplatform.net/text-to-speech/api/v1/synthesize"
      #transcript <- URLencode("The quick brown fox jumped over the lazy crazy dog that barked")
      transcript <- URLencode(transcript)
      voice <- "en-GB_KateVoice" # or en-US_LisaVoice
      filename <- "audio_file.wav"

      the_audio = CFILE(filename, mode="wb")
      curlPerform(url = paste(url,"?text=",transcript,"&voice=",voice_list[voice_number,],sep=""),
                  userpwd = username_password_TTS,
                  httpheader=c(accept="audio/wav"),
                  writedata = the_audio@ref)


      print("now playing the WAV file on your computer... open filename.WAV....")
      system(paste("open",filename,"-a vlc"))

      #close(the_audio) # would rather close earlier - but errored out
      closeAllConnections()
}



#' WatsonR - Text to Speech (TTS) - List Voices Available From services
#'
#' Text to Speech - LIst of Voices
#' @param NONE
#' @return list of voices from the TTS service
#' @export

watson.tts.listvoices <- function()
{
  library(RCurl) # install.packages("RCurl") # if the package is not already installed
  library(httr)
  library(splitstackshape)

  voices <- GET(url=paste("https://stream.watsonplatform.net/text-to-speech/api/v1/voices"),authenticate(username_TTS,password_TTS))
  data <- content(voices,"text")
  data <- as.data.frame(strsplit(as.character(data),"name"))
  data <- data[-c(1:2), ] # remove dud first row
  data <- strsplit(as.character(data),",")
  data <- data.frame(matrix(data))
  colnames(data) <- "V1"
  data <- cSplit(data, 'V1', sep="\"", type.convert=FALSE)
  data <- data.frame(data$V1_04)
  data[,1]  <- gsub("\\\\","",data[,1] )
  return(data)
}

# VOICES
# 1       en-GB_KateVoice
# 2        ja-JP_EmiVoice
# 3    en-US_AllisonVoice
# 4      fr-FR_ReneeVoice
# 5  it-IT_FrancescaVoice
# 6      es-ES_LauraVoice
# 7     de-DE_BirgitVoice
# 8    es-ES_EnriqueVoice
# 9     de-DE_DieterVoice
# 10      en-US_LisaVoice
# 11   en-US_MichaelVoice
# 12     es-US_SofiaVoice


#' WatsonR - Text to Speech (TTS) - Round The World Introductions -
#'
#' Text to Speech - LIst of Voices
#' @param NONE
#' @return Everyone Talks
#' @export

watson.tts.demovoices <- function()
{
  t <- 3 # time delay
  print("en-GB_KateVoice")
  watson.tts.process("I am Kate from the United Kingdom",1)
  wait(t)
  print("ja-JP_EmiVoice")
  watson.tts.process("ho Japan. Em i",2)
  wait(t)
  print("en-US_AllisonVoice")
  watson.tts.process("I am Allison from Boise, Idaho",3)
  wait(t)
  print("fr-FR_ReneeVoice")
  watson.tts.process("Bonjour! Vive la France",4)
  wait(t)
  print("it-IT_FrancescaVoice")
  watson.tts.process("Ciao! Io parlo Italiano.",5)
  wait(t)
  print("es-ES_LauraVoice")
  watson.tts.process("Hola, Soy Laura, Espana",6)
  wait(t)
  print("de-DE_BirgitVoice")
  watson.tts.process("Deutchland. Danka. Angela Merkel",7)
  wait(t)
  print("es-ES_EnriqueVoice")
  watson.tts.process("Hola, Soy Enrique. Futbol",8)
  wait(t)
  print("de-DE_DieterVoice")
  watson.tts.process("Deutchland. Danka David Hasselhoff",9)
  wait(t)
  print("en-US_LisaVoice")
  watson.tts.process("Good Afternoon. I'm your Boss Lisa from New York City",10)
  wait(t)
  print("en-US_MichaelVoice")
  watson.tts.process("Hello. I am Michael the Robot, From USA",11)
  wait(t)
  print("es-US_SofiaVoice")
  watson.tts.process("Ola!  Soy Sofia.  Espanol",12)
  wait(t)
}

