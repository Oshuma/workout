class RoutinesController < ApplicationController

  def create
    @routine = Routine.new(routine_params)

    if @routine.save
      if params[:create_set]
        @routine.workout.new_set!
      end

      redirect_to workout_path(@routine.workout)
    else
      redirect_back(fallback_location: root_path, alert: 'Could not save routine.')
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:workout_set_id, :routine_type_id, :lbs, :reps, :minutes)
  end

end
