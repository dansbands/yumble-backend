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

ActiveRecord::Schema.define(version: 20180212193416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "common_saved_restaurants", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "saved_restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saved_restaurant_id"], name: "index_common_saved_restaurants_on_saved_restaurant_id"
    t.index ["user_id"], name: "index_common_saved_restaurants_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.string "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "offset"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "yelp_id"
    t.string "name"
    t.string "image_url"
    t.boolean "is_closed"
    t.string "url"
    t.integer "review_count"
    t.string "categories"
    t.float "rating"
    t.text "latitude"
    t.text "longitude"
    t.text "transactions"
    t.string "price"
    t.text "location"
    t.string "phone"
    t.string "display_phone"
    t.string "display_address_1"
    t.string "display_address_2"
    t.decimal "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "saved_restaurants", force: :cascade do |t|
    t.bigint "user_id"
    t.string "restaurant_id"
    t.string "name"
    t.string "image_url"
    t.boolean "is_closed"
    t.string "url"
    t.integer "review_count"
    t.string "categories"
    t.float "rating"
    t.text "latitude"
    t.text "longitude"
    t.text "transactions"
    t.string "price"
    t.text "location"
    t.string "phone"
    t.string "display_phone"
    t.string "display_address_1"
    t.string "display_address_2"
    t.decimal "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "yelp_id"
    t.index ["user_id"], name: "index_saved_restaurants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.string "password_digest"
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_friend"
  end

  add_foreign_key "common_saved_restaurants", "saved_restaurants"
  add_foreign_key "common_saved_restaurants", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "restaurants", "users"
  add_foreign_key "saved_restaurants", "users"
end
