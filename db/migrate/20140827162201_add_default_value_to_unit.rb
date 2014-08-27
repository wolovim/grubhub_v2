class AddDefaultValueToUnit < ActiveRecord::Migration
  def change
    change_column :addresses, :unit, :string, default: ''
  end
end
