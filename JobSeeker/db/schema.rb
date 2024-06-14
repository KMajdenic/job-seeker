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

ActiveRecord::Schema[7.1].define(version: 2024_06_14_091752) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "classfield_id", null: false
    t.boolean "accepted", default: false
    t.string "status", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "review_id"
    t.index ["classfield_id"], name: "index_applications_on_classfield_id"
    t.index ["review_id"], name: "index_applications_on_review_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classfield_tags", force: :cascade do |t|
    t.bigint "classfield_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classfield_id"], name: "index_classfield_tags_on_classfield_id"
    t.index ["tag_id"], name: "index_classfield_tags_on_tag_id"
  end

  create_table "classfields", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "tags", default: [], array: true
    t.bigint "user_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_classfields_on_category_id"
    t.index ["user_id"], name: "index_classfields_on_user_id"
  end

  create_table "classfields_tags", id: false, force: :cascade do |t|
    t.bigint "classfield_id", null: false
    t.bigint "tag_id", null: false
    t.index ["classfield_id", "tag_id"], name: "index_classfields_tags_on_classfield_id_and_tag_id"
    t.index ["tag_id", "classfield_id"], name: "index_classfields_tags_on_tag_id_and_classfield_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "note"
    t.bigint "user_id", null: false
    t.bigint "classfield_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "application_id"
    t.integer "review_type", default: 0
    t.index ["application_id"], name: "index_reviews_on_application_id"
    t.index ["classfield_id"], name: "index_reviews_on_classfield_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "surname"
    t.string "phone_number"
    t.text "bio"
    t.boolean "setup_complete", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "classfields"
  add_foreign_key "applications", "reviews"
  add_foreign_key "applications", "users"
  add_foreign_key "classfield_tags", "classfields"
  add_foreign_key "classfield_tags", "tags"
  add_foreign_key "classfields", "categories"
  add_foreign_key "classfields", "users"
  add_foreign_key "reviews", "applications"
  add_foreign_key "reviews", "classfields"
  add_foreign_key "reviews", "users"
end
