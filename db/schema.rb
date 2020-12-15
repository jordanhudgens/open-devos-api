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

ActiveRecord::Schema.define(version: 2020_12_15_170046) do

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
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_bookmarks_on_plan_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "devo_completions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "devo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["devo_id"], name: "index_devo_completions_on_devo_id"
    t.index ["user_id"], name: "index_devo_completions_on_user_id"
  end

  create_table "devos", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "position"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plan_id"
    t.string "slug"
    t.index ["plan_id"], name: "index_devos_on_plan_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "plan_assignments", force: :cascade do |t|
    t.bigint "plan_id"
    t.bigint "user_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "devo_id"
    t.index ["devo_id"], name: "index_plan_assignments_on_devo_id"
    t.index ["plan_id"], name: "index_plan_assignments_on_plan_id"
    t.index ["user_id"], name: "index_plan_assignments_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.bigint "topic_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.text "summary"
    t.integer "plan_assignments_count", default: 0
    t.index ["topic_id"], name: "index_plans_on_topic_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "thumbnail"
    t.string "banner"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_slug"
    t.string "slug"
    t.string "full_name"
  end

  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookmarks", "plans"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "devo_completions", "devos"
  add_foreign_key "devo_completions", "users"
  add_foreign_key "devos", "plans"
  add_foreign_key "plan_assignments", "devos"
  add_foreign_key "plan_assignments", "plans"
  add_foreign_key "plan_assignments", "users"
  add_foreign_key "plans", "topics"
  add_foreign_key "plans", "users"
end
