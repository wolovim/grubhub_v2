class AddOrdersTable < ActiveRecord::Migration
  def change
  	create_table :orders do |t|
      t.integer :user_id
      t.string :order_type
      t.integer :address_id
      t.string :status
      t.integer :total

      t.timestamps
    end
  end
end
