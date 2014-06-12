# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140612094614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "peer_groups", force: true do |t|
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "peers", force: true do |t|
    t.string   "contact_point"
    t.integer  "peer_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shared_contact_url"
  end

  add_index "peers", ["peer_group_id"], name: "index_peers_on_peer_group_id", using: :btree

end
