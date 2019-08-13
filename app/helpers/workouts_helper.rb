module WorkoutsHelper

  def graph_date_range_options
    options_for_select(
      Workout::DATE_RANGES.transform_values { |v| v.first },
      params[:date_range]
    )
  end

end
