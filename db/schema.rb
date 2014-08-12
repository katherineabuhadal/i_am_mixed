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

ActiveRecord::Schema.define(version: 20140812181715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forums", force: true do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "forums", ["name"], name: "index_forums_on_name", unique: true, using: :btree
  add_index "forums", ["user_id"], name: "index_forums_on_user_id", using: :btree

  create_table "likes", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "story_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["user_id", "story_id"], name: "index_likes_on_user_id_and_story_id", unique: true, using: :btree

  create_table "messages", force: true do |t|
    t.text     "body",        null: false
    t.integer  "sender_id",   null: false
    t.integer  "receiver_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

  create_table "posts", force: true do |t|
    t.text     "body",                         null: false
    t.integer  "user_id",                      null: false
    t.integer  "topic_id",                     null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "spam_counter", default: 0,     null: false
    t.boolean  "spam",         default: false, null: false
  end

  add_index "posts", ["topic_id"], name: "index_posts_on_topic_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id",                                    null: false
    t.date     "birthday",            default: '1900-01-01', null: false
    t.text     "description",         default: "",           null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", unique: true, using: :btree

  create_table "responses", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "story_id",   null: false
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "responses", ["story_id"], name: "index_responses_on_story_id", using: :btree
  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree

  create_table "stories", force: true do |t|
    t.string   "image",        default: "",    null: false
    t.integer  "user_id",                      null: false
    t.string   "title",                        null: false
    t.text     "body",                         null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "spam",         default: false, null: false
    t.integer  "spam_counter", default: 0,     null: false
  end

  add_index "stories", ["user_id"], name: "index_stories_on_user_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer "taggable_id",   null: false
    t.string  "taggable_type", null: false
    t.integer "tag_id",        null: false
  end

  add_index "taggings", ["taggable_id", "tag_id"], name: "index_taggings_on_taggable_id_and_tag_id", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "topics", force: true do |t|
    t.string   "name",                         null: false
    t.integer  "user_id",                      null: false
    t.integer  "forum_id",                     null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "spam_counter", default: 0,     null: false
    t.boolean  "spam",         default: false, null: false
  end

  add_index "topics", ["forum_id"], name: "index_topics_on_forum_id", using: :btree
  add_index "topics", ["user_id"], name: "index_topics_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "username",        default: "",    null: false
    t.boolean  "admin",           default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
