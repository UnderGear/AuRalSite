# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110717221913) do

  create_table "audiofiles", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "synth_id"
    t.integer  "audio_id"
    t.integer  "synth_instance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_locations", :id => false, :force => true do |t|
    t.integer  "group_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_users", :id => false, :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "param_1"
    t.float    "param_2"
    t.float    "param_3"
    t.string   "synth"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "locations_locationsets", :id => false, :force => true do |t|
    t.integer  "location_id"
    t.integer  "locationset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations_users", :id => false, :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.integer  "user_id"
  end

  create_table "locationsets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locationsets_users", :id => false, :force => true do |t|
    t.integer  "locationset_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "points", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "synthinstances", :force => true do |t|
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "synths", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "parameters"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userparams", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "value_1"
    t.float    "value_2"
    t.float    "value_3"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "ip"
    t.boolean  "active"
    t.integer  "synth_id"
    t.integer  "audio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "password"
  end

end
