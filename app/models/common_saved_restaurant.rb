class CommonSavedRestaurant < ApplicationRecord
  belongs_to :user
  belongs_to :saved_restaurant
end
