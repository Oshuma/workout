class Workout < ApplicationRecord
  has_many :workout_sets, dependent: :destroy

  validates :date, presence: true

  after_create { |w| w.workout_sets.create(number: '1') }

  def new_set!
    number = workout_sets.order(number: :asc).last.number.to_i
    workout_sets.create(number: number + 1)
  end
end
