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

ActiveRecord::Schema.define(version: 20170505170831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_franchises", force: :cascade do |t|
    t.integer "category_id"
    t.integer "franchise_id"
  end

  add_index "categories_franchises", ["category_id"], name: "index_categories_franchises_on_category_id", using: :btree
  add_index "categories_franchises", ["franchise_id"], name: "index_categories_franchises_on_franchise_id", using: :btree

  create_table "franchises", force: :cascade do |t|
    t.string   "name"
    t.text     "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infos", force: :cascade do |t|
    t.string   "title"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infos_places", force: :cascade do |t|
    t.integer "info_id"
    t.integer "place_id"
  end

  add_index "infos_places", ["info_id"], name: "index_infos_places_on_info_id", using: :btree
  add_index "infos_places", ["place_id"], name: "index_infos_places_on_place_id", using: :btree

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "neighborhood_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "places", ["neighborhood_id"], name: "index_places_on_neighborhood_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "slogan"
    t.string   "address"
    t.string   "phone"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "franchise_id"
    t.integer  "neighborhood_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "restaurants", ["franchise_id"], name: "index_restaurants_on_franchise_id", using: :btree
  add_index "restaurants", ["neighborhood_id"], name: "index_restaurants_on_neighborhood_id", using: :btree

  add_foreign_key "categories_franchises", "categories"
  add_foreign_key "categories_franchises", "franchises"
  add_foreign_key "infos_places", "infos"
  add_foreign_key "infos_places", "places"
  add_foreign_key "places", "neighborhoods"
  add_foreign_key "restaurants", "franchises"
  add_foreign_key "restaurants", "neighborhoods"
end
