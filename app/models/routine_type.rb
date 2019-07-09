class RoutineType < ApplicationRecord
  belongs_to :user
  has_many :routines

  validates :name,
    presence: true,
    uniqueness: { scope: :user_id }
end
