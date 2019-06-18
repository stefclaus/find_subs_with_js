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

ActiveRecord::Schema.define(version: 2019_06_10_204209) do

  create_table "assistants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subrequests", force: :cascade do |t|
    t.string "comment"
    t.string "date"
    t.string "assistant_requesting"
    t.string "assistant_covering"
    t.integer "assistant_id"
    t.integer "yogaclass_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "yogaclasses", force: :cascade do |t|
    t.string "name"
    t.string "time"
    t.string "weekday"
    t.string "instructor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
