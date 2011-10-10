class CreateGroupsLocations < ActiveRecord::Migration
  def self.up
    create_table :groups_locations, :id => false do |t|
      t.integer :group_id
      t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :groups_locations
  end
end
