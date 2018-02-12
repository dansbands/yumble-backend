class CreateCommonSavedRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :common_saved_restaurants do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :saved_restaurant, foreign_key: true

      t.timestamps
    end
  end
end
