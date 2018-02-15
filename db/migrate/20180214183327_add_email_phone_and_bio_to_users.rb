class AddEmailPhoneAndBioToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string
    add_column :users, :phone, :string
    add_column :users, :bio, :string
  end
end
