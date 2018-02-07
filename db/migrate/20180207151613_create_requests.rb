class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.belongs_to :user,
      foreign_key: true
      t.string :params
      t.timestamps
    end
  end
end
