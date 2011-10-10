class CreateSynthinstances < ActiveRecord::Migration
  def self.up
    create_table :synthinstances do |t|
      t.text :params

      t.timestamps
    end
  end

  def self.down
    drop_table :synthinstances
  end
end
