class CreateAudiofiles < ActiveRecord::Migration
  def self.up
    create_table :audiofiles do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :audiofiles
  end
end
