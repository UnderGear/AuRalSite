class ModifyUserParams < ActiveRecord::Migration
  def self.up
    remove_column :userparams, :param_id
    remove_column :userparams, :synth_id
  end

  def self.down
    add_column :userparams, :param_id, :integer
    add_column :userparams, :synth_id, :integer
  end
end
