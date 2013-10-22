class RemoveIPaddressFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :ip_address
  end
  def down
    add_column :users, :ip_address, :binary
  end
end
