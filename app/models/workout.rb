class Workout < ApplicationRecord
  belongs_to :user
  has_many :routines, -> { order(created_at: :asc).includes(:routine_type) },
                      dependent: :destroy

  validates :date, presence: true

  scope :order_by_entry, -> { order(date: :desc).order(created_at: :desc) }
end
