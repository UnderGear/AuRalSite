class ReworkUserparams < ActiveRecord::Migration
  def self.up
    add_column :userparams, :value_1, :float
    add_column :userparams, :value_2, :float
    add_column :userparams, :value_3, :float
    remove_column :userparams, :value
    remove_column :userparams, :name
  end

  def self.down
    remove_column :userparams, :value_1
    remove_column :userparams, :value_2
    remove_column :userparams, :value_3
    add_column :userparams, :value, :float
    add_column :userparams, :name, :string
  end
end
