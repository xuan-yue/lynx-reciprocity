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

ActiveRecord::Schema.define(version: 20170410195619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "ask"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "asks", ["event_id"], name: "index_asks_on_event_id", using: :btree
  add_index "asks", ["user_id"], name: "index_asks_on_user_id", using: :btree

  create_table "attendance_histories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendance_histories", ["event_id"], name: "index_attendance_histories_on_event_id", using: :btree
  add_index "attendance_histories", ["user_id"], name: "index_attendance_histories_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "picture"
    t.string   "url"
    t.string   "access_code"
    t.datetime "startDate"
    t.datetime "endDate"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "linkedin_profiles", force: :cascade do |t|
    t.string   "email"
    t.string   "image_url"
    t.string   "profile_url"
    t.text     "raw_data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ask_id"
    t.string   "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "responses", ["ask_id"], name: "index_responses_on_ask_id", using: :btree
  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "username"
    t.string   "phone"
    t.string   "email"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "profession"
    t.string   "company"
    t.string   "description"
    t.string   "picture"
    t.string   "linkedin_url"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "remember_digest"
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "asks", "events"
  add_foreign_key "asks", "users"
  add_foreign_key "attendance_histories", "events"
  add_foreign_key "attendance_histories", "users"
  add_foreign_key "events", "users"
  add_foreign_key "responses", "asks"
  add_foreign_key "responses", "users"
end
