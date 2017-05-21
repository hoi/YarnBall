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

ActiveRecord::Schema.define(version: 20170520000829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "knots", force: :cascade do |t|
    t.integer  "yarn_id",                      null: false
    t.string   "details",                      null: false
    t.datetime "happens_at"
    t.string   "repeat",     default: "never", null: false
    t.boolean  "done"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["yarn_id"], name: "index_knots_on_yarn_id", using: :btree
  end

  create_table "tests", force: :cascade do |t|
    t.string   "name"
    t.datetime "when"
    t.boolean  "maybe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "yarns", force: :cascade do |t|
    t.integer  "pid"
    t.integer  "user_id"
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_yarns_on_user_id", using: :btree
  end

  add_foreign_key "knots", "yarns"
  add_foreign_key "yarns", "users"
end
