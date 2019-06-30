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

ActiveRecord::Schema.define(version: 2019_06_30_014624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "workouts", force: :cascade do |t|
    t.date "date"
    t.string "set"
    t.string "heavy_bag_minutes"
    t.string "bench_press_lbs"
    t.string "bench_press_reps"
    t.string "arm_curl_lbs"
    t.string "arm_curl_reps"
    t.string "leg_curl_lbs"
    t.string "leg_curl_reps"
    t.string "leg_curl_laying_lbs"
    t.string "leg_curl_laying_reps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
