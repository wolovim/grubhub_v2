class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :unit
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
