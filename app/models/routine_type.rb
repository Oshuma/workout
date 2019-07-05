class RoutineType < ApplicationRecord
  has_many :routines

  validates :name, presence: true
end
