module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type
    when 'success'
      'alert-success'
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-danger'
    when 'notice'
      'alert-success'
    else
      flash_type.to_s
    end
  end

  def options_for_routine_types(routine_types, selected = nil, previous_workout = nil)
    options = []

    routine_types.each do |routine_type|
      opt = [routine_type.name, routine_type.id]

      opt << { 'data-metric' => routine_type.metric }

      if previous_workout.present?
        previous = previous_workout.routines.where(routine_type_id: routine_type.id)
        opt << {
          'data-previous-lbs' => previous.maximum(:lbs),
          'data-previous-reps' => previous.maximum(:reps),
          'data-previous-minutes' => previous.maximum(:minutes),
          'data-previous-distance' => previous.maximum(:distance),
        }
      end

      options << opt
    end

    options_for_select(options, selected)
  end
end
