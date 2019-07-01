class Routine < ApplicationRecord
  belongs_to :workout_set

  validates :name, presence: true
end
