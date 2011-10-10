require 'rubygems'
require 'osc'
include OSC

class Location < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :locationsets
  has_many :points

  
  @c = OSC::UDPSocket.new
  validates_uniqueness_of :name
  #call me when a user enters/exits the location or changes params
  def self.aggregate_params(user)
    
    @locations = user.locations.readonly(false)
    @locations.each do |location|
      aggregate_params_location(location)
    end
  end

  def self.aggregate_params_location(location)
    users = User.find(:all, :conditions => {:active => true, :id => location.user_ids})
    params = Userparam.where(:user_id => users)
    location.param_1 = params.average("value_1")
    location.param_2 = params.sum("value_2")
    location.param_3 = Math.log(params.sum("value_3")+1)
    #apply mathematical functions to the params.
    location.save
    users.each do |user|
      m = Message.new('/Server', 'sfff', location.name, location.param_1, location.param_2, location.param_3)
      puts "#{@c.inspect}"
      puts "#{m.inspect}"
      @c.send m, 0, user.ip, 8000
    end
  end

end
