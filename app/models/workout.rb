class Workout < ApplicationRecord

  validates :date, presence: true
  validates :set, presence: true
  validates :heavy_bag_minutes, presence: true
  validates :bench_press_lbs, presence: true
  validates :bench_press_reps, presence: true
  validates :arm_curl_lbs, presence: true
  validates :arm_curl_reps, presence: true
  validates :leg_curl_lbs, presence: true
  validates :leg_curl_reps, presence: true
  validates :leg_curl_laying_lbs, presence: true
  validates :leg_curl_laying_reps, presence: true

end
