class Routine < ApplicationRecord
  belongs_to :workout_set

  validates :name, presence: true
  validates :lbs, presence: true
  validates :reps, presence: true
end
