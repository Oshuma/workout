class Workout < ApplicationRecord
  belongs_to :user
  has_many :routines, -> { order(created_at: :asc).includes(:routine_type) },
                      dependent: :destroy

  validates :date, presence: true

  scope :order_by_entry, -> { order(date: :desc).order(created_at: :desc) }

  def previous
    # If there is no previous, return nil.
    return nil if Workout.order(created_at: :asc).first == self

    prev_date = self.date - 1
    loop do
      workout = Workout.find_by(date: prev_date)
      break workout if workout.present?
      prev_date -= 1
    end
  end
end
