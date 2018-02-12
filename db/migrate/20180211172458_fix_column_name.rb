class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :restaurants, :restaurant_id, :yelp_id
  end
end
