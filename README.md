# What's Happening?
> Your new favorite way to get today's top headlines!

## Table of contents
* [General info](#general-info)
* [Intro Video](#intro-video)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Inspiration](#inspiration)
* [Contact](#contact)
* [License](#license)

## General info
What's Happening is a CLI application that allows the user to search today's top news headlines by category, receive a random headline, link to the web to read full articles, and even save and remove articles from your favorites list. 

Dive in and find out What's Happening today!

## Intro Video
[What's Happening on YouTube](https://www.youtube.com/watch?v=cR0qsPMTY5E)

## Technologies
* Ruby - version 2.6.1
* ActiveRecord - version 6.0
* Sinatra - version 2.0
* Sinatra-activerecord - version 2.0
* SQLite3 - version 1.4
* JSON - version 2.3
* Rest-Client - version 2.1
* TTY-Font - version 0.5.0
* Colorize - version 0.8.1

## Setup
To try out this project: 
1. Open an account with https://newsapi.org/
1. Clone the GitHub repository locally to your computer
1. In the command line, navigate to the root directory of this repository, and enter the following: 
  $ bundle install 
  $ touch .env 
1. Navigate to the .env folder, and paste in the following: 
  export API_KEY=YOUR_API_KEY_HERE (e.g. export API_KEY=15151515)
1. In the command of the root directory of the project folder, run: 
  $ rake db:migrate
1. Now save all files, on Windows: (start + alt + s), on Macs: (command + alt +s)
1. Run the following code in the command line while being in the most root folder of this project: 
```ruby
ruby runner.rb
```

## Code Examples
```ruby
def welcome  
  font = TTY::Font.new(:doom)
  puts font.write("What's  Happening?")
  puts "Hello! What is your name?".colorize(:yellow)
  $user_name = gets.strip  
  $user = User.create(name: $user_name)
  Cli.choose_category
end 
```

```ruby
def self.top_five(stories, category)
  puts "Here are today's top 5 #{category} stories:".colorize(:yellow)
  counter = 1 
  result = stories["articles"].take(5).each do |key, value|
  puts "#{counter}. " + "#{key["title"]}"
  counter += 1
end  
```


## Features
* Full CRUD application 
* Browse today's top headlines by category
* Receive a random headline
* See more info on any headline (title, summary, link)
* Click on a link to open up the full article on the web
* Add articles to your favorites list
* Remove articles from your favorates list

## Status
Project is: finished with option to expand functionality and DRY out code.

## Inspiration
The inspiration for What's Happening came from our desire to quickly and easily see what's going on in the world today. We set out to build an application that would be fun, interactive, and highly practical. We hope you find using What's Happening as enjoyable and helpful as we do!

## Contact
Created by [Tony Kim](https://www.linkedin.com/in/hyung-kim/) and [Matt Long](https://www.linkedin.com/in/mattlong34/)

Feel free to contact us! 

## License
[Click to view](https://github.com/hjkmines/mod1_project/blob/master/LICENSE)