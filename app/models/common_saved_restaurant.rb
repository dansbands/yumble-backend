class CommonSavedRestaurant < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  belongs_to :saved_restaurant
end
