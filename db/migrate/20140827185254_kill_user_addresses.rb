class KillUserAddresses < ActiveRecord::Migration
  def change
    drop_table :user_addresses
  end
end
