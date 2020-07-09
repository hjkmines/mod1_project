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

  def self.top_five(stories, category)
  puts ""
  puts "Here are today's top 5 #{category} stories:"
    counter = 1 
    result = stories["articles"].take(5).each do |key, value|
      puts "#{counter}. " + "#{key["title"]}"
      counter += 1
    end  
  puts "If you would like to read more, enter the number next to your chosen headline."
  user_selected_input = gets.strip.to_i 
  puts ""
    result.each do |article| 
        if result.index(article) == (user_selected_input - 1)
          puts article["title"]
          puts ""
          puts article["description"]
          puts ""
          puts article["url"]
          puts ""
          puts "Want to save this story? Enter (Yes/No)"
            user_response = gets.strip 
              if user_response == "Y" || user_response == "y" || user_response == "Yes" || user_response == "yes"
                article = Article.create(title: article["title"], summary: article["description"], category: category, time_stamp: Time.now)
                Feed.create(user_id: $user.id, article_id: article.id)
                puts ""
                puts "Article has been saved!"
              else 
                exit 
              end 
          return 
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

