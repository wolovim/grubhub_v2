class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.column :items, :string
      t.column :user_id, :integer
      t.timestamps
    end
  end
end
