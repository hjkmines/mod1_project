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
    puts "Here are today's top 5 #{category} stories:".colorize(:yellow)
      counter = 1 
      result = stories["articles"].take(5).each do |key, value|
        puts "#{counter}. " + "#{key["title"]}"
        counter += 1
      end  
    puts ""
    puts "Type the number next to the headline you would like to read more about, or type '0' to go back.".colorize(:yellow)
    
    user_selected_input = gets.strip.to_i 
    puts ""
    if user_selected_input == 0
      Cli.choose_category
    elsif user_selected_input == 1 || user_selected_input == 2 || user_selected_input == 3 || user_selected_input == 4 || user_selected_input == 5
      result.each do |article| 
          if result.index(article) == (user_selected_input - 1)
            puts article["title"]
            puts ""
            puts article["description"]
            puts ""
            puts article["url"]
            puts ""
            puts "Want to save this story? Enter (Yes/No)".colorize(:yellow)
              user_response = gets.strip 
                if user_response == "Y" || user_response == "y" || user_response == "Yes" || user_response == "yes"
                  article = Article.create(title: article["title"], summary: article["description"], category: category, time_stamp: Time.now)
                  $user.articles << article 
                  puts ""
                  puts "Article has been saved!".colorize(:yellow)
                else 
                  Cli.home_or_exit
                end 
          end 
        end 
    else 
      puts "Sorry, I didn't understand that. Please try again.".colorize(:yellow)
      Article.categories(category)
    end 
      Cli.home_or_exit
  end 

  def self.random 
    key = ENV["API_KEY"]
    response = RestClient.get ("https://newsapi.org/v2/top-headlines?country=us&apiKey=" + "#{key}")
    parsed_response = JSON.parse(response)
    random = parsed_response["articles"].sample
    puts random["title"]
    puts ""
    puts "If you would like to read more, type 'more'.".colorize(:yellow)
    user_selected_input = gets.strip.to_s
      if user_selected_input == "more" || user_selected_input == "More"
        puts ""
        puts random["title"]
        puts ""
        puts random["description"]
        puts ""
        puts random["url"]
        puts ""
        puts "Want to save this story? Enter (yes or no)".colorize(:yellow)
        user_response = gets.strip 
          if user_response == "Y" || user_response == "y" || user_response == "Yes" || user_response == "yes"
          article = Article.create(title: random["title"], summary: random["description"], category: nil, time_stamp: Time.now)
          Feed.create(user_id: $user.id, article_id: article.id)
      else 
        Cli.home_or_exit
      end 
    end
  puts ""
    Cli.home_or_exit
  end 
end 

