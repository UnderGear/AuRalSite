class CreateUserparams < ActiveRecord::Migration
  def self.up
    create_table :userparams do |t|
      t.integer :user_id
      t.integer :synth_id
      t.integer :param_id
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :userparams
  end
end
