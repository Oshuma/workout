class RoutineType < ApplicationRecord
  belongs_to :user
  has_many :routines, dependent: :restrict_with_error

  validates :name,
    presence: true,
    uniqueness: { scope: :user_id }

  def time_based?
    routines.pluck(:minutes).any?
  end

  def weight_based?
    routines.pluck(:lbs).any?
  end
end
