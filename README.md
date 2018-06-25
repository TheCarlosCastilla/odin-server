# README #

This repository is the home of the Odin Research Project back-end.



### What is Odin? ###

One of the best ways to gather data from people is by directly asking questions that we think will give us insight into what we want to know. This has traditionally been done in the form of surveys that ask people questions and then attempt to use statistical analysis to extract some sort of quantitative value from the responses; however, this method depends on expecting survey participants to be willing and able to respond truthfully. Recent research suggests that by using  “simple dynamic, interactive questions” in a survey increases the fun for participants, lowers the difficulty of collecting data for researchers, and results in an overall increase in the quality of data collected.

The system consists of three distinct modules: 

- A mobile application for the Android OS which is capable of collecting data regarding social interactions in real time, as well as presenting study subjects with questions dynamically based on social interaction triggers; 
- A centralized data aggregation server implemented using the Ruby on Rails web framework and hosted in the cloud using Amazon Web Services; 
- An analytic engine which is able to mine the social interaction and dynamic survey data.

----------
###API Reference ###
An incomplete summary of currently supported operations follows.
#### Version 1 (current)####
*The Base URL is `https://www.bagezio.com`*

A complete REST operation is formed by combining an HTTP method (or “verb”) with the full URL to the resource you’re addressing. For example, here is the operation to create a new interaction:

    POST https://www.bagezio.com/interactions

To create a complete request, combine the operation with the appropriate HTTP headers and any required JSON payload.

# Operation Summary #
Here are the available REST API operations:

### Users ###
`GET` `/users.json`

`GET` `/users/<IMEI>`

### Interactions ###
`GET` `/interactions.json`

`POST` `/interactions`

### Questions ###
`GET` `/questions.json`

`POST` `/questions/new`
### Answers ###
`GET` `/answers.json`

`POST` `/answers`

### Schedules ###
`GET` `/schedules.json`

`POST` `/schedules/new`
### Rules ###
`GET` `/rules.json`

`POST` `/rules/new`

----------


### Who do I talk to? ###

* Anyone with questions can email me at the.carlos.castilla@gmail.com
