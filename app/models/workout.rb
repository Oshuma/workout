class Workout < ApplicationRecord
  has_many :routines, dependent: :destroy

  validates :date, presence: true
end
