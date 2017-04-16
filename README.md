# insiderOverflow

Team Members

La-Keisha Towner, Jordany Rosas, Gurkanver Brar, & Michael Mercuro

___

# Summary

This is over version of stackOverflow. Our goal was to make replica of the website using technologies that we've learned.
We spent two work days working on this project

The technologies that we used were:
1. Sinatra
2. PostgreSQL
3. ActiveRecord
4. JavaScript
5. AJAX
6. Ruby
7. Agile workflow using Trello

___

# Features

* Users can post questions. Other users can answer them.
* Users can comment on both questions and answers.
* The comments are displayed in a flat list.
* Users can upvote and downvote questions, answers, and comments—only one vote per user for each question, answer, and comment.
* Users cannot add a question, answer, or comment or vote unless they're logged in.
* But they can view all of the above when logged out.

--

# Getting Started
In your terminal do the following:

Clone repo in your terminal
1. git clone https://github.com/LM-Towner/insiderOverflow.git

Change directory into the insiderOverFlow directory
2. cd insiderOverFlow

Install necessary gems
3. bundle install
if you do not have the bundler gem installed, type gem install bundler, then try bundle install again

Setup environment, creating and migrating the data into the database
4. bundle exec rake db:reset

Seed the database with dummy data
5. bundle exec rake db:seed

Start server
6. shotgun

Navigate to your favorite web browser and type:
7. localhost:9393

Enjoy!
