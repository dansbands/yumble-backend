class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :password_digest
      t.string :location
      t.float :latitude
      t.float :longitude
      t.string :photo_url

      t.timestamps
    end
  end
end
