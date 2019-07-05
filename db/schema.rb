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

ActiveRecord::Schema.define(version: 2019_07_03_012619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "routine_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routines", force: :cascade do |t|
    t.bigint "workout_set_id"
    t.bigint "routine_type_id"
    t.string "lbs"
    t.string "reps"
    t.string "minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["routine_type_id"], name: "index_routines_on_routine_type_id"
    t.index ["workout_set_id"], name: "index_routines_on_workout_set_id"
  end

  create_table "workout_sets", force: :cascade do |t|
    t.bigint "workout_id"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_id"], name: "index_workout_sets_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "routines", "routine_types"
  add_foreign_key "routines", "workout_sets"
  add_foreign_key "workout_sets", "workouts"
end
