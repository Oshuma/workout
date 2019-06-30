class Workout < ApplicationRecord

  validates :date, presence: true
  validates :set, presence: true

end
