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

ActiveRecord::Schema.define(version: 20140804182154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "likes", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "story_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["user_id", "story_id"], name: "index_likes_on_user_id_and_story_id", unique: true, using: :btree

  create_table "stories", force: true do |t|
    t.string   "image",      default: "", null: false
    t.integer  "user_id",                 null: false
    t.string   "title",                   null: false
    t.text     "body",                    null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "stories", ["user_id"], name: "index_stories_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username",        null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
