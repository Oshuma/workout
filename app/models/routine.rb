class Routine < ApplicationRecord
  belongs_to :workout
  belongs_to :routine_type

  validates :set_number, presence: true
  validate :ensure_at_least_one_metric

  def full_title
    [
      workout.date,
      routine_type.name,
      set_number
    ].join(' / ')
  end

  private

  def ensure_at_least_one_metric
    unless [lbs, reps, minutes].map { |a| a.present? }.any?
      errors[:base] << "must set either lbs, reps or minutes"
    end
  end
end
