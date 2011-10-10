class AddIdsToLocationsUsers < ActiveRecord::Migration
  def self.up
    add_column :locations_users, :location_id, :integer
    add_column :locations_users, :user_id, :integer
  end

  def self.down
    remove_column :locations_users, :location_id
    remove_column :locations_users, :user_id
  end
end
