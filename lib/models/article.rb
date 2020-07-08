require 'news-api'
require 'dotenv/load'

class Article < ActiveRecord::Base 
  has_many :feeds 
  has_many :users, through: :feeds


  def self.categories(category) 
  key = ENV["API_KEY"]
  response = RestClient.get ("https://newsapi.org/v2/top-headlines?country=us&category=" + "#{category}" + "&apiKey=#{key}")
  parsed_response = JSON.parse(response)
  Article.top_five(parsed_response, category)
  end 


  ##WORKING ON THIS!!!!!!!!!!!!!!!!!!!!
  def self.top_five(stories, category)
  puts "Here are today's top 5 #{category} stories:"
    counter = 1 
    stories["articles"].take(5).each do |key, value|
      puts "#{counter}. " + "#{key["title"]}"
      counter += 1
    end 
  puts "If you would like to read more, enter the number next to your chosen headline."
  user_selected_input = gets.strip.to_i 
    stories["articles"].take(5).each do |key, value| 
      if counter == user_selected_input
        puts "#{key["title"]}"
        puts "#{key["description"]}"
        puts "#{key["url"]}"
      else 
        puts "Sorry, I didn't understand that. Please try again."
      end
    end 
  end 

  def self.random 
  key = ENV["API_KEY"]
  response = RestClient.get ("https://newsapi.org/v2/top-headlines?country=us&apiKey=" + "#{key}")
  parsed_response = JSON.parse(response)
  puts parsed_response["articles"].sample["title"]
  end 

end 

