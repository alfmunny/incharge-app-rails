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

ActiveRecord::Schema.define(version: 20140918142213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charge_points", force: true do |t|
    t.string   "status"
    t.string   "charge_point_vendor"
    t.string   "charge_point_model"
    t.string   "charge_point_serial_number"
    t.string   "firmware_version"
    t.string   "iccid"
    t.string   "imsi"
    t.string   "meter_type"
    t.string   "meter_serial_number"
    t.integer  "heartbeat_interval"
    t.string   "charge_box_serial_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "charge_points_users", id: false, force: true do |t|
    t.integer "charge_point_id", null: false
    t.integer "user_id",         null: false
  end

  create_table "charge_points_vehicles", id: false, force: true do |t|
    t.integer "charge_point_id", null: false
    t.integer "vehicle_id",      null: false
  end

  create_table "connectors", force: true do |t|
    t.string   "name"
    t.integer  "charge_point_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "connectors", ["charge_point_id"], name: "index_connectors_on_charge_point_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.date     "published_at"
    t.text     "intro"
    t.text     "extended"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "records", force: true do |t|
    t.float    "power"
    t.float    "current"
    t.float    "voltage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trade_id"
  end

  add_index "records", ["trade_id"], name: "index_records_on_trade_id", using: :btree

  create_table "trades", force: true do |t|
    t.string   "transaction_id"
    t.string   "status"
    t.float    "energy"
    t.float    "bill"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "vehicle_id"
    t.integer  "charge_point_id"
    t.integer  "connector_id"
    t.integer  "meter_start"
    t.integer  "meter_stop"
    t.datetime "timestamp"
  end

  add_index "trades", ["charge_point_id"], name: "index_trades_on_charge_point_id", using: :btree
  add_index "trades", ["connector_id"], name: "index_trades_on_connector_id", using: :btree
  add_index "trades", ["user_id"], name: "index_trades_on_user_id", using: :btree
  add_index "trades", ["vehicle_id"], name: "index_trades_on_vehicle_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.date     "expiry_date"
    t.string   "company"
    t.string   "id_tag"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "users_vehicles", id: false, force: true do |t|
    t.integer "vehicle_id", null: false
    t.integer "user_id",    null: false
  end

  create_table "vehicles", force: true do |t|
    t.string   "vehicle_type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
