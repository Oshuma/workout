module DateRanger
  extend ActiveSupport::Concern

  included do
    scope :date_range, ->(range) { range.present? ? where(created_at: range) : all }
  end
end
