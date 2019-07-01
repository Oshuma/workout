class Workout < ApplicationRecord
  IMPORT_TMP_FILE = Rails.root.join('tmp', 'workout.csv').to_s

  has_many :workout_sets

  validates :date, presence: true
  validates :set, presence: true
end
