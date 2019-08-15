class Workout < ApplicationRecord
  include DateRanger

  DATE_RANGES = {
    'Last 30 Days' => ['days_30', 30.days.ago..Time.now],
    'Last 7 Days' => ['days_7', 7.days.ago..Time.now],
    'This Month' => ['month', Time.now.beginning_of_month..Time.now],
    'All Time' => ['all_time', nil],
  }

  belongs_to :user
  has_many :routines, -> { order(created_at: :asc).includes(:routine_type) },
                      dependent: :destroy

  validates :date, presence: true

  scope :order_by_entry, -> { order(date: :desc).order(created_at: :desc) }
end
