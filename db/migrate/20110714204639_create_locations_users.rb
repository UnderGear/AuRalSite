class CreateLocationsUsers < ActiveRecord::Migration
  def self.up
    create_table :locations_users, :id => false do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :locations_users
  end
end
