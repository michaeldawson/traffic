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

ActiveRecord::Schema.define(version: 20141018145122) do

  create_table "issues", force: true do |t|
    t.string   "uid"
    t.string   "original_text"
    t.string   "source"
    t.string   "suburb"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.string   "streets"
    t.datetime "issue_date"
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

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "age"
    t.string   "location"
    t.string   "address_state"
    t.string   "gender"
    t.string   "mobile"
    t.string   "provider"
    t.string   "uid"
    t.string   "state"
    t.string   "oauth_token"
    t.string   "oauth_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
