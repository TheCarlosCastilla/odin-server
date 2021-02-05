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

ActiveRecord::Schema.define(version: 2014_06_26_205809) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", force: :cascade do |t|
    t.string "time"
    t.string "user_id"
    t.string "question_id"
    t.string "choice_id"
  end

  create_table "calls", force: :cascade do |t|
    t.string "user_id"
    t.string "peer_id"
    t.string "time"
    t.string "duration"
    t.string "call_type"
  end

  create_table "choices", force: :cascade do |t|
    t.string "question_id"
    t.string "choice_id"
    t.string "choice_text"
  end

  create_table "interactions", force: :cascade do |t|
    t.string "user_id"
    t.string "peer_id"
    t.string "time"
    t.string "duration"
    t.string "rssi"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question_text"
  end

  create_table "rules", force: :cascade do |t|
    t.string "user_id"
    t.string "peer_id"
    t.string "delay"
    t.string "question_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "time"
    t.string "question_id"
    t.string "user_id"
    t.boolean "sent"
  end

  create_table "texts", force: :cascade do |t|
    t.string "user_id"
    t.string "peer_id"
    t.string "time"
    t.text "message"
    t.string "message_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id"
    t.string "hashed_number"
    t.integer "valid_user_id"
    t.boolean "is_claimed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "valid_users", force: :cascade do |t|
    t.string "imei"
    t.boolean "is_registered"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
