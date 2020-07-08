require 'news-api'
require 'dotenv/load'

class Article < ActiveRecord::Base 
  has_many :feeds 
  has_many :users, through: :feeds

  def self.categories(category) 
  key = ENV["API_KEY"]
  response = RestClient.get ("https://newsapi.org/v2/top-headlines?country=us&category=" + "#{category}" + "&apiKey=#{key}")
  parsed_response = JSON.parse(response)
  end 
  
end 