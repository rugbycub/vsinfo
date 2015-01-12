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

ActiveRecord::Schema.define(version: 20150104222244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adhoc_cancellations", force: true do |t|
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airplanes", force: true do |t|
    t.string   "reg",            null: false
    t.string   "ac_type"
    t.string   "name"
    t.integer  "j_capacity"
    t.integer  "w_capacity"
    t.integer  "y_capacity"
    t.integer  "total_capacity"
    t.string   "ife"
    t.boolean  "new_livery"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "airplanes", ["reg"], name: "index_airplanes_on_reg", unique: true, using: :btree

  create_table "airports", id: false, force: true do |t|
    t.string   "code",       null: false
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.string   "latlon"
    t.string   "timezone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "airports", ["code"], name: "index_airports_on_code", unique: true, using: :btree

  create_table "arrivals", force: true do |t|
    t.string   "flight_number"
    t.time     "sta"
    t.time     "eta"
    t.string   "captain"
    t.string   "fsm"
    t.integer  "j_booked",      default: 0
    t.integer  "w_booked",      default: 0
    t.integer  "y_booked",      default: 0
    t.integer  "total_booked"
    t.text     "specials"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "departures", force: true do |t|
    t.string   "flight_number"
    t.time     "std"
    t.time     "etd"
    t.string   "captain"
    t.string   "fsm"
    t.integer  "j_booked",      default: 0
    t.integer  "w_booked",      default: 0
    t.integer  "y_booked",      default: 0
    t.integer  "total_booked"
    t.integer  "j_meals",       default: 0
    t.integer  "w_meals",       default: 0
    t.integer  "y_meals",       default: 0
    t.integer  "total_meals"
    t.integer  "j_sby",         default: 0
    t.integer  "w_sby",         default: 0
    t.integer  "y_sby",         default: 0
    t.integer  "total_sby"
    t.text     "specials"
    t.date     "date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "flight_schedules", force: true do |t|
    t.string   "flight_number"
    t.time     "departure"
    t.time     "arrival"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "ac_type"
  end

  create_table "flights", force: true do |t|
    t.string   "flight_number", null: false
    t.string   "origin"
    t.string   "destination"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "flights", ["flight_number"], name: "index_flights_on_flight_number", unique: true, using: :btree

  create_table "operations", force: true do |t|
    t.string   "airport_id"
    t.date     "date"
    t.integer  "staff_assignment"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "positions", force: true do |t|
    t.string   "name"
    t.boolean  "certification"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "turns", force: true do |t|
    t.string   "reg"
    t.string   "airport"
    t.integer  "arrival_id"
    t.integer  "departure_id"
    t.string   "gate"
    t.date     "date"
    t.integer  "operation_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
