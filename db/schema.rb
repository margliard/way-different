# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_23_135659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiences", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.string "address"
    t.boolean "availability"
    t.integer "price"
    t.string "city"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.string "description"
    t.boolean "booked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.date "assigned_day"
    t.bigint "experience_id", null: false
    t.bigint "travelboard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["experience_id"], name: "index_favorites_on_experience_id"
    t.index ["travelboard_id"], name: "index_favorites_on_travelboard_id"
  end

  create_table "review_experiences", force: :cascade do |t|
    t.text "comment"
    t.float "rating"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "experience_id"
    t.index ["experience_id"], name: "index_review_experiences_on_experience_id"
    t.index ["user_id"], name: "index_review_experiences_on_user_id"
  end

  create_table "review_travelboards", force: :cascade do |t|
    t.text "comment"
    t.float "rating"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "travelboard_id"
    t.index ["travelboard_id"], name: "index_review_travelboards_on_travelboard_id"
    t.index ["user_id"], name: "index_review_travelboards_on_user_id"
  end

  create_table "travelboards", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.date "start_date"
    t.date "end_date"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_travelboards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "experiences"
  add_foreign_key "favorites", "travelboards"
  add_foreign_key "review_experiences", "experiences"
  add_foreign_key "review_experiences", "users"
  add_foreign_key "review_travelboards", "travelboards"
  add_foreign_key "review_travelboards", "users"
  add_foreign_key "travelboards", "users"
end
