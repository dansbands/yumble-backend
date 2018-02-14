class User < ApplicationRecord
  has_secure_password
  has_many :common_saved_restaurants, dependent: :destroy
  has_many :common_saved_restaurants, :foreign_key => 'friend_id'
  has_many :saved_restaurants, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :restaurants, dependent: :destroy
  # has_many :discarded_restaurants
end
