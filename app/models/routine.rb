class Routine < ApplicationRecord
  belongs_to :workout_set
  belongs_to :routine_type

  validate :ensure_at_least_one_metric

  def workout
    workout_set.workout
  end

  private

  def ensure_at_least_one_metric
    unless [lbs, reps, minutes].map { |a| a.present? }.any?
      errors[:base] << "must set either lbs, reps or minutes"
    end
  end
end
