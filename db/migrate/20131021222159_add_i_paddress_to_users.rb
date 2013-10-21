class AddIPaddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ip_address, :binary
  end
end
