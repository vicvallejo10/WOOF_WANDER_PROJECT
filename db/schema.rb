# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_02_134325) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "place_id"
    t.index ["place_id"], name: "index_lists_on_place_id"
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "pet_name"
    t.date "birthdate"
    t.string "microchip_number"
    t.string "breed"
    t.string "size"
    t.string "color"
    t.string "sterilized"
    t.string "vaccine_card"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "place_name"
    t.string "place_description"
    t.string "place_type"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "zip_code"
    t.float "longitude"
    t.float "latitude"
    t.boolean "tag_offleash"
    t.boolean "tag_wateraccess"
    t.boolean "tag_outdoor"
    t.boolean "tag_indoor"
    t.boolean "tag_smallpet"
    t.boolean "tag_mediumpet"
    t.boolean "tag_largepet"
    t.boolean "tag_disposalstation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "description"
    t.integer "rating"
    t.index ["place_id"], name: "index_reviews_on_place_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lists", "users"
  add_foreign_key "pets", "users"
  add_foreign_key "reviews", "places"
  add_foreign_key "reviews", "users"
end
