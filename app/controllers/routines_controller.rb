class RoutinesController < ApplicationController

  before_action :set_workout

  def create
    @routine = @workout.routines.new(routine_params)

    if @routine.save
      if params[:new_set]
        redirect_to workout_path(@routine.workout, routine_type_id: @routine.routine_type_id, set_number: @routine.set_number + 1)
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
