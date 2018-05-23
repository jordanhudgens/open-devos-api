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

ActiveRecord::Schema.define(version: 2018_05_23_162108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devos", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.integer "position"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plan_id"
    t.index ["plan_id"], name: "index_devos_on_plan_id"
    t.index ["user_id"], name: "index_devos_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.bigint "topic_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_plans_on_topic_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "devos", "plans"
  add_foreign_key "devos", "users"
  add_foreign_key "plans", "topics"
  add_foreign_key "plans", "users"
end
