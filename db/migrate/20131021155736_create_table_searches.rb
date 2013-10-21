class CreateTableSearches < ActiveRecord::Migration
  def up
    create_table :searches do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.integer :user_id

      t.timestamps
    end
  end

  def down
    drop_table :searches
  end
end
