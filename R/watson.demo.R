#' WatsonR - Demonstration of Alchemy, Personality Insights, Tone Analyzer and Natural Language Classifier
#'
#'  Demonstrates WatsonR - Multiple APIs.  Note NLC Natural Language Classifier takes time to complete training
#'  @param NONE
#'  @return NOTHING
#'  @export

watson.demo <- function() {
  print("FULL Demo that will do all available services - and also train NLC with Ground truth ")

  ## DEMO #1 - YOUTUBE - WatsonR Package - August 17,2016

  #library(devtools)
  #load_all()
  #library(WatsonR)

  # WATSON KEYS
  # watson.keys.load() # pulls keys an also hammers library - consider renaming INITIALIZE
  # watson.keys.display()  # Show What's Available with KEYS
  # watson.keys.enter()  # Manual Entry Option

  # WATSON.ALCHEMY
  watson.alchemy.test()  # Ping the service - OK?
  watson.alchemy.combined("I like hamburgers Kokanee beer in Raglan New Zealand")

  # WATSON.TONE
  watson.tone.demo() # speeding ticket, with optimism
  watson.tone.analyze("I am happy here, but not sure about next week.") # happy but tentative

  # WATSON.PI
  watson.pi.demo()  # Ronald Reagan speech example
  suppressWarnings(watson.pi.analyze("GANDHI Says: For more than twenty years past I have been paying special attention to the question of Health. While in England, I had to make my own arrangements for food and drink, and I can say, therefore, that my experience is quite reliable. I have arrived at certain definite conclusions from that experience, and I now set them down for the benefit of my readers. As the familiar saying goes, ‘Prevention is better than cure.’ It is far easier and safer to prevent illness by the observance of the laws of health than to set about curing the illness which has been brought on by our own ignorance and carelessness. Hence it is the duty of all thoughtful men to understand aright the laws of health, and the object of the following pages is to give an account of these laws. We shall also consider the best methods of cure for some of the most common diseases.As Milton says, the mind can make a hell of heaven or a heaven of hell. So heaven is not somewhere above the clouds, and hell somewhere [Pg 2] underneath the earth! We have this same idea expressed in the Sanskrit saying, Mana êva Manushayanâm Kâranam Bandha Mokshayoh—man’s captivity or freedom is dependant on the state of his mind. From this it follows that whether a man is healthy or unhealthy depends on himself. Illness is the result not only of our actions but also of our thoughts. As has been said by a famous doctor, more people die for fear of diseases like small-pox, cholera and plague than out of those diseases themselves.Ignorance is one of the root-causes of disease. Very often we get bewildered at the most ordinary diseases out of sheer ignorance, and in our anxiety to get better, we simply make matters worse. Our ignorance of the most elementary laws of health leads us to adopt wrong remedies or drives us into the hands of the veriest quacks. How strange (and yet how true) it is that we know much less about things near at hand than things at a distance. We know hardly anything of our own village, but we can give by rote the names of the rivers and mountains of England! We take so much trouble to learn the names of the stars in the sky, while we hardly think it worth while to know the things that are in our own homes! We never care a jot for the splendid pageantry of Nature before our very eyes, while we are so anxious to witness the [Pg 3] puerile mummeries of the theatre! And in the same way, we are not ashamed to be ignorant of the structure of our body, of the way in which the bones and muscles, grow, how the blood circulates and is rendered impure, how we are affected by evil thoughts and passions, how our mind travels over illimitable spaces and times while the body is at rest, and so on. There is nothing so closely connected with us as our body, but there is also nothing perhaps of which our ignorance is so profound, or our indifference so complete."))

  # WATSON.NLC
  NLC_name <- paste("sorting_hat_",sample(1:1000,1),sep="")
  watson.nlc.createnewclassifier("data/nlc_sortinghat.csv",NLC_name)
  watson.nlc.listallclassifiers()
  watson.nlc.checkclassifierstatus("33fffex86-nlc-1350") #
  watson.nlc.processtextreturnclass("33fffex86-nlc-1350","nasty jerk who screams at kids")
  watson.nlc.deleteclassifier("33fffex86-nlc-1350")

  # WATSON.STT
  watson.stt.test() # takes FOX.WAV file STT_speech_test.wav and sends to STT for transcript
  watson.stt.process("media/ryan_raspberry_pi_test.wav") # bigger sample

  # WATSON.TTS
  watson.tts.listvoices()
  watson.tts.demovoices()
  watson.tts.process("My name is Julia. Cambridge is better than Oxford. Do you agree?",1)



}




