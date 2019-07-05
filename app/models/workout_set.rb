class WorkoutSet < ApplicationRecord
  belongs_to :workout
  has_many :routines, dependent: :destroy

  validates :number, presence: true
end
