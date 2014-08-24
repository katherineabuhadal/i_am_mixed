#I am Mixed 

![Logo](https://raw.githubusercontent.com/katherineabuhadal/i_am_mixed/master/app/assets/images/i-am-mixed-logo.png)

I am Mixed is an online community for people of different ethnic backgrounds to talk about issues relevant to them. Users can share and tag stories, upload an image to their story, and respond to other users stories. Other features include a forum where users can post about topics and questions relevant to them, as well as user profiles.

You can see the live site here: [iammixed.com](http://www.iammixed.com).

##Technology
Rails, Javascript, JQuery, Bourbon, Neat, SASS, Paperclip, Heroku, Sphinx, Monban for user authentication

##Features

###Email and Password Confirmation
Standard user authentication is through Monban, but I added additional features including email and password confirmation.
Email confirmation was achieved by generating a secure token when a new user registers. After signing up successfully, an email is sent to their email address with a unique link including the token. The user can confirm his/her account by following the link and clicking the confirm button on the page.
Password confirmation required modifying the Monban user sign up service.

###Weighted search using Sphinx

Another unique feature of the application is a weighted search which uses Sphinx and the Thinking Sphinx gem. Users can search through stories by story title, body and also tags and responses. This gives robust and complete search results.

###Other Features

#####Image Upload with Paperclip
#####Polymorphic Tagging
#####Threaded Comments

##Limitations
Additional features which could improve the project are a secondary authentication which uses either Facebook or Google, giving people a quicker and frictionless authentication.
Items like nested commenting and forums which I built from scratch could be implemented using  pre-existing programs (e.g. disqus) which have more fully-developed features.
An advanced search form would be nice to have in order to sift through many user stories.

![Screenshot](https://raw.githubusercontent.com/katherineabuhadal/i_am_mixed/master/app/assets/images/home.png)
![Screenshot](https://raw.githubusercontent.com/katherineabuhadal/i_am_mixed/master/app/assets/images/forum.png)
