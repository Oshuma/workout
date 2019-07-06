class WorkoutSetsController < ApplicationController

  def create
    @workout = Workout.find(params[:workout_id])

    if @workout.new_set!
      redirect_to(@workout)
    else
      redirect_to(@workout, alert: 'Could not create new set.')
    end
  end

end
