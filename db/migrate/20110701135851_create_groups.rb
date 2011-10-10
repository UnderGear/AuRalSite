class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.integer :synth_id
      t.integer :audio_id
      t.integer :synth_instance_id

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
