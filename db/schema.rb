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

ActiveRecord::Schema.define(version: 2021_06_17_181047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boardgames", force: :cascade do |t|
    t.string "title"
    t.string "manufacturer"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "upc_code"
    t.string "image"
  end

  create_table "gameowners", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "boardgame_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boardgame_id"], name: "index_gameowners_on_boardgame_id"
    t.index ["user_id"], name: "index_gameowners_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "overall_rating"
    t.integer "replayability"
    t.integer "first_time_difficulty"
    t.bigint "user_id", null: false
    t.bigint "boardgame_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boardgame_id"], name: "index_reviews_on_boardgame_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "date"
    t.bigint "boardgame_id", null: false
    t.integer "winner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boardgame_id"], name: "index_sessions_on_boardgame_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "profile_picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "usersessions", force: :cascade do |t|
    t.string "date"
    t.bigint "session_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_usersessions_on_session_id"
    t.index ["user_id"], name: "index_usersessions_on_user_id"
  end

  add_foreign_key "gameowners", "boardgames"
  add_foreign_key "gameowners", "users"
  add_foreign_key "reviews", "boardgames"
  add_foreign_key "reviews", "users"
  add_foreign_key "sessions", "boardgames"
  add_foreign_key "usersessions", "sessions"
  add_foreign_key "usersessions", "users"
end
