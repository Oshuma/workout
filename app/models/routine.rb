class Routine < ApplicationRecord
  include DateRanger

  belongs_to :workout
  belongs_to :routine_type

  validates :set_number, presence: true
  validate :ensure_at_least_one_metric
  validate :ensure_lbs_has_reps

  scope :previous_lbs, ->(routine_type) { where(routine_type: routine_type).where('lbs IS NOT NULL').order(created_at: :asc).last }
  scope :previous_reps, ->(routine_type) { where(routine_type: routine_type).where('reps IS NOT NULL').order(created_at: :asc).last }
  scope :previous_minutes, ->(routine_type) { where(routine_type: routine_type).where('minutes IS NOT NULL').order(created_at: :asc).last }
  scope :previous_distance, ->(routine_type) { where(routine_type: routine_type).where('distance IS NOT NULL').order(created_at: :asc).last }

  def full_title
    [
      workout.date,
      routine_type.name,
      set_number
    ].join(' / ')
  end

  private

  def ensure_at_least_one_metric
    unless [lbs, reps, minutes, distance].map { |a| a.present? }.any?
      errors[:base] << "must set either lbs, reps, minutes or distance"
    end
  end

  def ensure_lbs_has_reps
    return if minutes.present?

    unless lbs.present? && reps.present?
      errors[:base] << "must include lbs and reps"
    end
  end
end
