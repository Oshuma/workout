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

ActiveRecord::Schema.define(version: 2019_08_08_011855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "routine_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "rest_time", default: 30
    t.index ["user_id"], name: "index_routine_types_on_user_id"
  end

  create_table "routines", force: :cascade do |t|
    t.bigint "workout_id"
    t.bigint "routine_type_id"
    t.integer "set_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lbs"
    t.integer "reps"
    t.integer "minutes"
    t.float "distance"
    t.index ["routine_type_id"], name: "index_routines_on_routine_type_id"
    t.index ["workout_id"], name: "index_routines_on_workout_id"
  end

  create_table "settings", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "rest_timer", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "routine_types", "users"
  add_foreign_key "routines", "routine_types"
  add_foreign_key "routines", "workouts"
  add_foreign_key "settings", "users"
  add_foreign_key "workouts", "users"
end
