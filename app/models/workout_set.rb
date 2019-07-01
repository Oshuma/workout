class WorkoutSet < ApplicationRecord
  belongs_to :workout
  has_many :routines

  validates :number, presence: true
end
