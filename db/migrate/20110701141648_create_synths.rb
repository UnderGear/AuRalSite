class CreateSynths < ActiveRecord::Migration
  def self.up
    create_table :synths do |t|
      t.string :name
      t.string :url
      t.text :parameters
      t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :synths
  end
end
