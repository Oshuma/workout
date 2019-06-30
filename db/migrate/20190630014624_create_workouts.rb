class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.date :date
      t.string :set
      t.string :heavy_bag_minutes
      t.string :bench_press_lbs
      t.string :bench_press_reps
      t.string :arm_curl_lbs
      t.string :arm_curl_reps
      t.string :leg_curl_lbs
      t.string :leg_curl_reps
      t.string :leg_curl_laying_lbs
      t.string :leg_curl_laying_reps

      t.timestamps
    end
  end
end
