class AddCategoryIdToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :category_id, :integer
  end
end
