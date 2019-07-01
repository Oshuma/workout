class Workout < ApplicationRecord
  has_many :workout_sets

  validates :date, presence: true
end
