class RoutinesController < ApplicationController

  def create
    @routine = Routine.new(routine_params)

    if @routine.save
      redirect_to workout_path(@routine.workout)
    else
      redirect_back(fallback_location: root_path, alert: @routine.errors.full_messages.to_sentence)
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:routine_type_id, :workout_id, :set_number, :lbs, :reps, :minutes)
  end

end
