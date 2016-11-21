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

ActiveRecord::Schema.define(version: 20161119013736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instances", force: :cascade do |t|
    t.string  "name"
    t.string  "answin"
    t.integer "topic_id"
    t.index ["topic_id"], name: "index_instances_on_topic_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string  "question"
    t.integer "topic_id"
    t.string  "answers",  default: [], array: true
    t.index ["topic_id"], name: "index_questions_on_topic_id", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "party"
    t.string "picture"
    t.string "other_data"
    t.text   "dataset",    default: [], array: true
  end

  add_foreign_key "instances", "topics"
  add_foreign_key "questions", "topics"
end