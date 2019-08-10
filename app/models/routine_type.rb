class RoutineType < ApplicationRecord
  belongs_to :user
  has_many :routines, dependent: :restrict_with_error

  enum metric: [:distance, :time, :weight], _prefix: true

  validates :name,
    presence: true,
    uniqueness: { scope: :user_id }

  validates :metric, presence: true, inclusion: { in: metrics.keys }

  def distance_based?
    routines.pluck(:distance).any?
  end

  def time_based?
    routines.pluck(:minutes).any?
  end

  def weight_based?
    routines.pluck(:lbs).any?
  end
end
