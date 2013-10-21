class RenameColumnsLatAndLongToLatitudeAndLongitude < ActiveRecord::Migration
  def up
    rename_column :searches, :lat, :latitude
    rename_column :searches, :long, :longitude
  end

  def down
    rename_column :searches, :latitude, :lat
    rename_column :searches, :longitude, :long
  end
end
