class User < ApplicationRecord
  # has_many :restaurants
  has_many :saved_restaurants
  # has_many :discarded_restaurants
end
