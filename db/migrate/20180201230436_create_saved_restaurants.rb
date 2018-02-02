class CreateSavedRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :saved_restaurants do |t|
      t.belongs_to :user, foreign_key: true
      t.string :restaurant_id
      t.string :name
      t.string :image_url
      t.boolean :is_closed
      t.string :url
      t.integer :review_count
      t.string :categories
      t.float :rating
      t.text :latitude
      t.text :longitude
      t.text :transactions
      t.string :price
      t.text :location
      t.string :phone
      t.string :display_phone
      t.string :display_address_1
      t.string :display_address_2
      t.decimal :distance
      
      t.timestamps
    end
  end
end
