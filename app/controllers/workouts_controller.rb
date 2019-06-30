class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.order(date: :asc).page(params[:page])
  end

end
