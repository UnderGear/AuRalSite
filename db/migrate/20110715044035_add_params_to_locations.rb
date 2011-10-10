class AddParamsToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :param_1, :float
    add_column :locations, :param_2, :float
    add_column :locations, :param_3, :float
  end

  def self.down
    remove_column :locations, :param_1
    remove_column :locations, :param_2
    remove_column :locations, :param_3
  end
end
