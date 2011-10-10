class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :ip
      t.boolean :active
      t.integer :synth_id
      t.integer :audio_id
      t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
