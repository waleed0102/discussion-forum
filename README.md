# README

# Tech Stack
  - Ruby 2.7.0
  - Rails 6.0.3.4
  - Database Postresql

# Database Tables
  - users
    Holding information for expert and novice such as title, profession, status

  - campaigns
    Holding information for campaigns such as title, durtation etc

  - discussion_topics
    Holdimg information to store discussion data for campaigns

  - tags
    Tags are here for campaigns

  - todos
    Todo list is for campaigns

  - comments
    Comments are here for campaigns and discussion topics

# Setup Instructions
  1- Clone the repo
  
  2- bundle install
  
  3- yarn install
  
  4- bundle exec rake db:create db:migrate db:seed
  
  5- rails s
  
  6- Browse http://localhost:3000/
