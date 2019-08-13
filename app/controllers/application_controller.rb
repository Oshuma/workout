class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def graph_date_range
    params[:date_range] ||= 'days_30'
    range = Workout::DATE_RANGES.select { |label, values| values.first == params[:date_range] }
      .try(:values).try(:flatten).try(:last)
  end
end
