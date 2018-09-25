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

ActiveRecord::Schema.define(version: 2018_09_24_161829) do

  create_table "movees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.integer "age"
    t.string "occupation"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_movees_on_email", unique: true
  end

  create_table "movers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.boolean "van"
    t.integer "age"
    t.string "email"
    t.integer "rating"
    t.integer "karma_points"
    t.string "occupation"
    t.text "bio"
    t.integer "moving_event_id"
    t.integer "movee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movee_id"], name: "index_movers_on_movee_id"
    t.index ["moving_event_id"], name: "index_movers_on_moving_event_id"
  end

  create_table "moving_events", force: :cascade do |t|
    t.string "name"
    t.string "old_location"
    t.string "new_location"
    t.text "description"
    t.integer "amount_of_furniture"
    t.string "difficulty"
    t.integer "movers_needed"
    t.date "start_time"
    t.date "end_time"
    t.integer "mover_id"
    t.integer "movee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movee_id"], name: "index_moving_events_on_movee_id"
    t.index ["mover_id"], name: "index_moving_events_on_mover_id"
  end

end
