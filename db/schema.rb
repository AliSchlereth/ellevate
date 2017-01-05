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

ActiveRecord::Schema.define(version: 20170105025807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pass_imgs", force: :cascade do |t|
    t.string   "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sentences", force: :cascade do |t|
    t.string   "sentence_frame"
    t.integer  "level"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.integer  "level"
    t.string   "language"
    t.integer  "teacher_id"
    t.integer  "pass_img_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["pass_img_id"], name: "index_students_on_pass_img_id", using: :btree
    t.index ["teacher_id"], name: "index_students_on_teacher_id", using: :btree
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "token"
    t.string   "refresh_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "students", "pass_imgs"
  add_foreign_key "students", "teachers"
end
