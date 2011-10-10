class AddSynthToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :synth, :string
  end

  def self.down
    remove_column :locations, :synth
  end
end
