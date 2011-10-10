class CreateLocationsetsUsers < ActiveRecord::Migration
  def self.up
    create_table :locationsets_users, :id => false do |t|
      t.integer :locationset_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :locationsets_users
  end
end
