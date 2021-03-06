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

ActiveRecord::Schema.define(version: 2021_11_30_152408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "travelboard_id"
    t.index ["travelboard_id"], name: "index_chatrooms_on_travelboard_id"
  end

  create_table "experience_labels", force: :cascade do |t|
    t.bigint "experience_id", null: false
    t.bigint "label_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["experience_id"], name: "index_experience_labels_on_experience_id"
    t.index ["label_id"], name: "index_experience_labels_on_label_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.string "address"
    t.boolean "availability"
    t.string "price"
    t.string "city"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.string "description"
    t.boolean "booked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "experience_id", null: false
    t.bigint "travelday_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["experience_id"], name: "index_favorites_on_experience_id"
    t.index ["travelday_id"], name: "index_favorites_on_travelday_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "label_name"
    t.text "label_description"
    t.string "label_icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
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
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_travelboards_on_user_id"
  end

  create_table "traveldays", force: :cascade do |t|
    t.integer "day_number"
    t.bigint "travelboard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["travelboard_id"], name: "index_traveldays_on_travelboard_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "profile_photo", default: ""
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chatrooms", "travelboards"
  add_foreign_key "experience_labels", "experiences"
  add_foreign_key "experience_labels", "labels"
  add_foreign_key "favorites", "experiences"
  add_foreign_key "favorites", "traveldays"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "review_experiences", "experiences"
  add_foreign_key "review_experiences", "users"
  add_foreign_key "review_travelboards", "travelboards"
  add_foreign_key "review_travelboards", "users"
  add_foreign_key "travelboards", "users"
  add_foreign_key "traveldays", "travelboards"
end
