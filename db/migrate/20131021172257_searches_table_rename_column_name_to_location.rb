class SearchesTableRenameColumnNameToLocation < ActiveRecord::Migration
  def up
    rename_column :searches, :name, :location
  end

  def down
    rename_column :searches, :location, :name
  end
end
