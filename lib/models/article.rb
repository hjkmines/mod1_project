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
    puts ""
    # puts "If you would like to read more, enter the number next to your chosen headline."
    puts "Type the number next to the headline you would like to read more about, or type '0' to go back."
    
    user_selected_input = gets.strip.to_i 
    puts ""
    if user_selected_input == 0
      Cli.choose_category
    else 
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
                  $user.articles << article 
                  puts ""
                  puts "Article has been saved!"
                else 
                  Cli.home_or_exit
                end 
          end 
        end 
      end 
      # user_selected_input = gets.strip
      # if user_selected_input == "home"
      #     Cli.choose_category
      # end
        
      # user_selected_input = gets.strip.to_i
      if user_selected_input != (1..5)
        puts "Sorry, I didn't understand that. Please try again."
        Article.categories(category)
      end
  
        Cli.home_or_exit
    end 

  def self.random 
  key = ENV["API_KEY"]
  response = RestClient.get ("https://newsapi.org/v2/top-headlines?country=us&apiKey=" + "#{key}")
  parsed_response = JSON.parse(response)
  puts parsed_response["articles"].sample["title"]
  puts ""
  puts "If you would like to read more, type 'more'."
  user_selected_input = gets.strip.to_s
  if user_selected_input == "more" || user_selected_input == "More"
    puts parsed_response["articles"].sample["title"]
    puts parsed_response["articles"].sample["description"]
    puts parsed_response["articles"].sample["url"]
  end
  puts ""
  Cli.home_or_exit
  # puts ""
  # puts "Want to save this story? Enter (Yes/No)"
  # user_response = gets.strip 
  #   if user_response == "Y" || user_response == "y" || user_response == "Yes" || user_response == "yes"
  #     article = Article.create(title: article["title"], summary: article["description"], category: category, time_stamp: Time.now)
  #     $user.articles << article
  #     # Feed.create(user_id: $user.id, article_id: article.id)
  #     puts ""
  #     puts "Article has been saved!"
  #   else 
  #     exit 
  #   end 
  # end 
  end 
end 

