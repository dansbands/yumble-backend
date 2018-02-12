class AddYelpIdToSavedRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :saved_restaurants, :yelp_id, :string
  end
end
