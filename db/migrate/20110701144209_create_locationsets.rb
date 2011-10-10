class CreateLocationsets < ActiveRecord::Migration
  def self.up
    create_table :locationsets do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :locationsets
  end
end
