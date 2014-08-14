class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :quantity
      t.integer :unit_price
      t.integer :order_id

      t.timestamps
    end
  end
end
