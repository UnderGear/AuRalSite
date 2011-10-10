class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :locations
  has_one :synthinstance
  has_one :synth
end
