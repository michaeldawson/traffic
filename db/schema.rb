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

ActiveRecord::Schema.define(version: 20141018113951) do

  create_table "issues", force: true do |t|
    t.string   "uid"
    t.string   "original_text"
    t.string   "suburb"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.string   "streets"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues_streets", id: false, force: true do |t|
    t.integer "issue_id"
    t.integer "street_id"
  end

  add_index "issues_streets", ["issue_id", "street_id"], name: "index_issues_streets_on_issue_id_and_street_id"
  add_index "issues_streets", ["street_id"], name: "index_issues_streets_on_street_id"

  create_table "streets", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
