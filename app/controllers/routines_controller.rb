class RoutinesController < ApplicationController

  before_action :set_workout

  def create
    @routine = @workout.routines.new(routine_params)

    if @routine.save
      if params[:new_set]
        redirect_params = {
          routine_type_id: @routine.routine_type_id,
          lbs: @routine.lbs,
          reps: @routine.reps,
          minutes: @routine.minutes,
          set_number: (@routine.set_number + 1),
        }

        if current_user.settings.rest_timer? && @routine.routine_type.rest_time?
          redirect_params[:rest_timer] = true
          redirect_params[:rest_time] = @routine.routine_type.rest_time
        end

        redirect_to workout_path(@routine.workout, redirect_params)
      else
        redirect_to workout_path(@routine.workout)
      end
    else
      redirect_back(fallback_location: root_path, alert: @routine.errors.full_messages.to_sentence)
    end
  end

  def edit
    @routine_types = current_user.routine_types.order(name: :asc)
    @routine = @workout.routines.find(params[:id])
  end

  def update
    @routine = @workout.routines.find(params[:id])

    if @routine.update(routine_params)
      redirect_to(workout_path(@routine.workout))
    else
      redirect_to(workout_path(@routine.workout, alert: 'Could not update routine.'))
    end
  end

  def destroy
    @routine = @workout.routines.find(params[:id])

    if @routine.destroy
      redirect_to(workout_path(@routine.workout))
    else
      redirect_to(workout_path(@routine.workout, alert: 'Could not delete routine.'))
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:routine_type_id, :workout_id, :set_number, :lbs, :reps, :minutes)
  end

  def set_workout
    @workout = current_user.workouts.find(params[:workout_id])
  end

end
