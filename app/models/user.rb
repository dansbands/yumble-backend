class User < ApplicationRecord
  has_secure_password
  has_many :saved_restaurants
  has_many :requests
  # has_many :restaurants
  # has_many :discarded_restaurants
end
