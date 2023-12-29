class AddLatLonToDestinations < ActiveRecord::Migration[7.0]
  def change
    add_column :destinations, :lat, :float
    add_column :destinations, :lon, :float
  end
end
