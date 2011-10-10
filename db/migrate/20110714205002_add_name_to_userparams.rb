class AddNameToUserparams < ActiveRecord::Migration
  def self.up
    add_column :userparams, :name, :string
  end

  def self.down
    remove_column :userparams, :name
  end
end
