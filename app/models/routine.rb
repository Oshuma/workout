class Routine < ApplicationRecord
  belongs_to :workout_set
  belongs_to :routine_type

  def workout
    workout_set.workout
  end
end
