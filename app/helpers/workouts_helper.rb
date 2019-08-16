module WorkoutsHelper

  def graph_date_range_options
    options_for_select(
      Workout::DATE_RANGES.transform_values { |v| v.first },
      params[:date_range]
    )
  end

  def link_to_set_timer
    link_to 'Start Timer', '#',
            id: 'set_timer_button',
            class: "btn btn-lg btn-primary #{'d-none' unless @routine_type.try(:metric_time?)}",
            data: { set_time: @routine_type.try(:set_time) }
  end

end
