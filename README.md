# WatsonR
A package for R to engage Watson Developer Cloud Services  

# Status - Aug 16th
    Status  AUG 16th 2015 - Package is Partially Complete 
    DONE:   Alchemy, Tone, Personality Insights, Speech to Text, and Text to Speech (basics);
            Natural Language Classifier (NLC);  
    SOON:   DEMO At Aggregate; and being less ham fisted with loading libraries & credentials
    FIX:    Build error that looks related to PI Text import
    Q4:     Once functionality is established across features, will code review with an R Guru and tighten up

# Objective
To create a WatsonR package that is available for the R Programming language that can be used by R programmers to access IBM Watson Developer Cloud (WDC) Services.  
https://www.ibm.com/watson/developercloud/services-catalog.html

![alt tag](https://dreamtolearn.com/internal/doc-asset/CLEWIK5HHUM3CW8RHNAGNN75W/RRR.png)


# watson.keys 
enter in keys / authenticate
API keys are needed for EACH service - so building out a few ways to check and enter KEYS
Free Trial here: https://console.ng.bluemix.net/  Register, Login and
Step-By-Step instructions here https://dreamtolearn.com/ryan/r_journey_to_watson/43
List of Services here: https://www.ibm.com/watson/developercloud/services-catalog.html
(these are just the WDC services, there are heaps of other IBM Watson technologies around)

# watson.demo 
including NLC/Harry potter (needs keys, alerts if no keys in)
MACRO Demo - There are a bunch of other little demos, so probably just calls them

# watson.status 
What's happening. May not keep this - but there are some things that take time - like NLC training.
May also holler out to API's it has creds for

-----------------

# watson.alchemy
https://www.ibm.com/watson/developercloud/alchemy-language.html
AlchemyLanguage is a collection of APIs that offer text analysis through natural language processing. The AlchemyLanguage APIs can analyze text and help you to understand its sentiment, keywords, entities, high-level concepts and more.

# watson.tone
https://www.ibm.com/watson/developercloud/tone-analyzer.html
Discover, understand, and revise the language tones in text. 
one Analyzer Service uses linguistic analysis to detect three types of tones from text: emotion, social tendencies, and language style. Emotions identified include things like anger, fear, joy, sadness, and disgust. Identified social tendencies include things from the Big Five personality traits used by some psychologists. These include openness, conscientiousness, extroversion, agreeableness, and emotional range. Identified language styles include confident, analytical, and tentative.

# watson.pi
https://www.ibm.com/watson/developercloud/personality-insights.html
Uncover a deeper understanding of people's personality characteristics, needs, and values to drive personalization. 
Personality Insights extracts and analyzes a spectrum of personality attributes to help discover actionable insights about people and entities, and in turn guides end users to highly personalized interactions. The service outputs personality characteristics that are divided into three dimensions: the Big 5, Values, and Needs

# watson.nlc
https://www.ibm.com/watson/developercloud/nl-classifier.html
Interpret and classify natural language with confidence. 
The service enables developers without a background in machine learning or statistical algorithms to create natural language interfaces for their applications. The service interprets the intent behind text and returns a corresponding classification with associated confidence levels. The return value can then be used to trigger a corresponding action, such as redirecting the request or answering a question.
THIS IS A REALLY POWERFUL SERVICE. (My fave)

# watson.stt
https://www.ibm.com/watson/developercloud/speech-to-text.html
The Speech to Text service converts the human voice into the written word.
The Speech to Text service can be used anywhere voice-interactivity is needed. The service is great for mobile experiences, transcribing media files, call center transcriptions, voice control of embedded systems, or converting sound to text to then make data searchable. Supported languages include US English, UK English, Japanese, Spanish, Brazilian Portuguese, Modern Standard Arabic, and Mandarin. The Speech to Text service now provides the ability to detect the presence of specific keywords or key phrases in the input stream.

# watson.tts
https://www.ibm.com/watson/developercloud/text-to-speech.html
Designed for streaming low-latency synthesis of audio from written text. The service synthesizes natural-sounding speech from input text in a variety of languages and voices that speak with appropriate cadence and intonation.
    Brazilian Portuguese speech (1 female voice)
    US English speech (choose between 3 voices: 2 female, 1 male)
    UK English speech (1 female voice)
    French speech (1 female voice)
    German speech (choose between 2 voices: 1 female, 1 male)
    Japanese speech (1 female voice)
    Italian speech (1 female voice)
    Castilian Spanish speech (choose between 2 voices: 1 female, 1 male)
    North American Spanish speech (1 female voice)

![alt tag](https://www.youtube.com/watch?v=hpcmyj5cT18)

# R Consortium
Early June 2016, IBM announced it joined the R Consortium – an open-source foundation launched by the Linux Foundation in 2015 to support the R programming language and its user community. 
IBM joined Microsoft and R-Studio as platinum members.  
R is a free programming language and software environment for statistical computing and graphics - widely used among statisticians and data miners for developing statistical software and data analysis.  
R provides an interactive environment for data analysis, modeling and visualization.


# Other Notes
1)  API KEYS ARE REQUIRED TO ACCESS EACH SERVICE- FREE 30 DAY TRIAL here: https://console.ng.bluemix.net/
2)  These are the services in this version
    AlchemyLanguage
    Natural Language Classifier 
    Personality Insights
    Tone Analyzer
    Speech to Text
    Text to Speech
3)  Code Was largely derived from 
    https://github.com/rustyoldrake/R_Scripts_for_Watson and
    https://dreamtolearn.com/ryan/r_journey_to_watson/ projects

