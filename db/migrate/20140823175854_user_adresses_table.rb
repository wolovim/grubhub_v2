class UserAdressesTable < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|
      t.integer :user_id
      t.integer :address_id

      t.timestamps
    end 
  end
end
