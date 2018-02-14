class AddOtherUsersToSavedRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :saved_restaurants, :other_users, :integer, array: true, default: []
  end
end
