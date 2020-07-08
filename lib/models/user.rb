class User < ActiveRecord::Base 
  has_many :feeds
  has_many :articles, through: :feeds
end 
