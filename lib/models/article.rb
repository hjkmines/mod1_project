require 'news-api'

class Article < ActiveRecord::Base 
  has_many :feeds 
  has_many :users, through: :feeds
  
  def self.output 
  n = News.new("≈≈≈≈≈≈≈≈≈≈≈≈≈")
  n.get_sources(country: 'us', language: 'en')
  output = n.get_everything(q: "apple", from: "2020-07-01&to=2020-07-07", sortBy: "popularity")
  end 
end 