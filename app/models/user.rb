class User < ActiveRecord::Base
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :groups
  has_one :synth
  has_one :userparam
  has_and_belongs_to_many :locationsets

  validates_uniqueness_of :name
end
