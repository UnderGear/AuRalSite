class CreateLocationsLocationsets < ActiveRecord::Migration
  def self.up
    create_table :locations_locationsets, :id => false do |t|
      t.integer :location_id
      t.integer :locationset_id

      t.timestamps
    end
  end

  def self.down
    drop_table :locations_locationsets
  end
end
