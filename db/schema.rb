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

ActiveRecord::Schema.define(version: 20140327021548) do

  create_table "admins", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", force: true do |t|
    t.string "time"
    t.string "user_id"
    t.string "question_id"
    t.string "choice_id"
  end

  create_table "choices", force: true do |t|
    t.string "question_id"
    t.string "choice_id"
    t.string "choice_text"
  end

  create_table "interactions", force: true do |t|
    t.string "user_id"
    t.string "peer_id"
    t.string "time"
    t.string "duration"
  end

  create_table "questions", force: true do |t|
    t.string "question_text"
  end

  create_table "rules", force: true do |t|
    t.string "user_id"
    t.string "peer_id"
    t.string "delay"
    t.string "question_id"
  end

  create_table "schedules", force: true do |t|
    t.string  "time"
    t.string  "question_id"
    t.string  "user_id"
    t.boolean "sent"
  end

  create_table "users", force: true do |t|
    t.string  "user_id"
    t.string  "imei"
    t.boolean "is_claimed"
  end

  create_table "valid_users", force: true do |t|
    t.string   "imei"
    t.boolean  "is_registered"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
