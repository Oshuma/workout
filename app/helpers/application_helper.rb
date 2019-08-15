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

  def graph_row(&block)
    tag.div(class: 'row mt-4') do
      tag.div(class: 'col') do
        yield
      end
    end
  end

  def options_for_routine_types(routine_types, selected = nil)
    options = []

    routine_types.each do |routine_type|
      opt = [routine_type.name, routine_type.id]

      opt << { 'data-metric' => routine_type.metric }

      opt << {
        'data-previous-lbs' => current_user.routines.previous_lbs(routine_type).try(:lbs),
        'data-previous-reps' => current_user.routines.previous_reps(routine_type).try(:reps),
        'data-previous-minutes' => current_user.routines.previous_minutes(routine_type).try(:minutes),
        'data-previous-distance' => current_user.routines.previous_distance(routine_type).try(:distance),
      }

      options << opt
    end

    options_for_select(options, selected)
  end

  def show_start_workout_button?
    [root_path, new_workout_path, workouts_path].any? { |p| current_page?(p) }
  end
end
