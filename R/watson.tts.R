#' WatsonR - Text to Speech (TTS) - Speechify the Transcript; demand the voice you want
#'
#' Text to Speech
#' @param creds the name of the credentials file in json format
#' @param transcript TEXT to be made into audio;
#' @param voice_number Index 1-12 of Voice (see watson.tts.listvoices() for list)
#' @return NOTHING
#' @export

watson.tts.process <- function(creds,transcript,voice_number) {
      credentials = rjson::fromJSON(,creds)
      voice_list <- watson.tts.listvoices()
      print("Text to Speech - Sending Transcript to TTS service....")
      url <- "https://stream.watsonplatform.net/text-to-speech/api/v1/synthesize"
      ## transcript <- URLencode("The quick brown fox jumped over the lazy crazy dog that barked")
      transcript <- URLencode(transcript)
      voice <- "en-GB_KateVoice" # or en-US_LisaVoice
      filename <- "media/audio_file.wav"

      the_audio = RCurl::CFILE(filename, mode="wb")
      RCurl::curlPerform(url = paste(url,"?text=",transcript,"&voice=",voice_list[voice_number,],sep=""),
                  userpwd = paste(credentials$username,credentials$password,sep=":"),
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
#' @param creds the name of the credentials file in json format
#' @return list of voices from the TTS service
#' @export

watson.tts.listvoices <- function(creds)
{
  credentials = rjson::fromJSON(,creds)
  voices <- httr::GET(url=paste("https://stream.watsonplatform.net/text-to-speech/api/v1/voices"),
                      authenticate(credentials$username,credentials$password))
  data <- httr::content(voices,"text")
  data <- as.data.frame(strsplit(as.character(data),"name"))
  data <- data[-c(1:2), ] # remove dud first row
  data <- strsplit(as.character(data),",")
  data <- data.frame(matrix(data))
  colnames(data) <- "V1"
  data <- splitstackshape::cSplit(data, 'V1', sep="\"", type.convert=FALSE)
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
#' @param creds the name of the credentials file in json format
#' @return Everyone Talks
#' @export

watson.tts.demovoices <- function(creds)
{
  credentials = rjson::fromJSON(,creds)
  t <- 3 # time delay
  print("en-GB_KateVoice - UK")
  watson.tts.process(creds,"I am Kate from the United Kingdom",1)
  Sys.sleep(t)
  print("ja-JP_EmiVoice - Japan")
  watson.tts.process(creds,"ho Japan. Em i",2)
  Sys.sleep(t)
  print("en-US_AllisonVoice - USA")
  watson.tts.process(creds,"I am Allison from Boise, Idaho",3)
  Sys.sleep(t)
  print("fr-FR_ReneeVoice - France")
  watson.tts.process(creds,"Bonjour! Vive la France",4)
  Sys.sleep(t)
  print("it-IT_FrancescaVoice - Italy")
  watson.tts.process(creds,"Ciao! Io parlo Italiano.",5)
  Sys.sleep(t)
  print("es-ES_LauraVoice - Spain")
  watson.tts.process(creds,"Hola, Soy Laura, Espana",6)
  Sys.sleep(t)
  print("de-DE_BirgitVoice - Germany")
  watson.tts.process(creds,"Deutchland. Danka. Angela Merkel",7)
  Sys.sleep(t)
  print("es-ES_EnriqueVoice - Spain")
  watson.tts.process(creds,"Hola, Soy Enrique. Futbol",8)
  Sys.sleep(t)
  print("de-DE_DieterVoice - Germany")
  watson.tts.process(creds,"Deutchland. Danka David Hasselhoff",9)
  Sys.sleep(t)
  print("en-US_LisaVoice - USA")
  watson.tts.process(creds,"Good Afternoon. I'm your Boss Lisa from New York City",10)
  Sys.sleep(t)
  print("en-US_MichaelVoice - USA")
  watson.tts.process(creds,"Hello. I am Michael the Robot, From USA",11)
  Sys.sleep(t)
  print("es-US_SofiaVoice - US Spanish")
  watson.tts.process(creds,"Ola!  Soy Sofia.  Espanol",12)
  Sys.sleep(t)
}

