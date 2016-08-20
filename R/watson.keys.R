#' WatsonR - Load API Keys from KEYS.R file
#'
#' This Function will Load your API keys from KEYS.R file if it is in working directory
#' You can create / edit this file yourself
#'
#'  @param NONE
#'  @return NOTHING
#'  @export

watson.keys.load <- function() {
  library(RCurl) # install.packages("RCurl") # if the package is not already installed
  library(httr)
  library(audio)
  library(data.table)
  library(dplyr)
  library(reshape2)
  library(Rtts)
  library(splitstackshape)
  library(seewave) # need to play wav back?
  library(stringr)
  library(splitstackshape)
  library(tidyr)
  library(XML)
  library(png)
  print("This Function will Load your API keys from KEYS.R file if it is in working directory here:")
  print(getwd())
  source("R/keys.R") # this files is where you put your Access Credentials from Bluemix (username and password)
  # now print them to screen
  watson.keys.display()
}


#' WatsonR - Display API Key Info
#'
#'  Displays API Keys - Empty Slots and Full Slots
#'  @param NONE
#'  @return NOTHING
#'  @export

watson.keys.display <- function() {
      print("This Function Displays your Existing API Keys for the IBM Watson Services")
      # ALCHEMY Language -- AUTHENTICATION / CREDENTIALS  - Platinum
      print(paste("1 - Alchemy Key: " , username_password_ALCH))
      print(paste("2 - Tone Key: " , username_password_TON))
      print(paste("3 - Personality Insight Key: " , username_password_PI))
      print(paste("4 - NLC Key: " , username_password_NLC))
      print(paste("5 - Speech to Text Key: " , username_password_STT))
      print(paste("6 - Text to Speech Key: " , username_password_TTS))
      print("If any are NULL or Error, you will not have luck hitting services - edit keys.R file and LOAD - or modify")
}


#' WatsonR - Enter API Keys Info Manually
#'
#'  Prompts User to Enter in Keys.
#'  KEYS.R FILE load with watson.keys.load is alternate method
#'
#'  @param NONE
#'  @return NOTHING
#'  @export

watson.keys.enter <- function() {
  print("This Funtcion Helps you enter API Keys Manually for the IBM Watson Services")
  print("SELECT #1-6 - Which API Key TO ENTER? (Zero '0' Exits) ")

       print("1 - Alchemy Key")
       print("2 - Tone Analysis")
       print("3 - Personality Insight (PI)")
       print("4 - Natural Language Classifier (NLC)")
       print("5 - Speech to Text (STT)")
       print("6 - Text to Speech (TTS)")
       print("7 - Exit / Cancel")

      selection <- readline(prompt="Enter Selection 1-9: ")
      selection <- as.integer(selection)

      switch(selection,
             {username_password_ALCH <<- readline(prompt="Enter Alchemy Key: ")},
             {username_TON <<- readline(prompt="Enter Tone Username: ");
              password_TON <<- readline(prompt="Enter Tone Password: ");
              username_password_TON <<- paste(username_TON,":",password_TON,sep="")},
             {username_PI <<- readline(prompt="Enter PI Username: ");
              password_PI <<- readline(prompt="Enter PI Password: ");
              username_password_PI <<- paste(username_PI,":",password_PI,sep="")},
             {username_NLC <<- readline(prompt="Enter NLC Username: ");
              password_NLC <<- readline(prompt="Enter NLC Password: ");
              username_password_NLC <<- paste(username_NLC,":",password_NLC,sep="")},
             {username_STT <<- readline(prompt="Enter Speech to Text (STT) Username: ");
              password_STT <<- readline(prompt="Enter Speech to Text (STT) Password: ");
              username_password_STT <<- paste(username_STT,":",password_STT,sep="")},
             {username_TTS <<- readline(prompt="Enter Text to Speech (TTS) Username: ");
              password_TTS <<- readline(prompt="Enter Text to Speech (TTS) Password: ");
              username_password_TTS <<- paste(username_TTS,":",password_TTS,sep="")},
             {print("Exit")})

      watson.keys.display()

  # prompt for missing keys- then write over keys.R
}
