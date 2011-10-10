class AccomodatePoints < ActiveRecord::Migration
  def self.up
    add_column :points, :location_id, :integer
    add_column :points, :latitude, :float
    add_column :points, :longitude, :float
    #remove_column :locations, :latitude
    #remove_column :locations, :longitude
  end

  def self.down
    #add_column :locations, :latitude, :float
    #add_column :locations, :longitude, :float
    remove_column :points, :location_id
    remove_column :points, :latitude
    remove_column :points, :longitude
  end
end
