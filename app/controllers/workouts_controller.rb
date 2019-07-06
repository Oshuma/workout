class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.order(date: :asc).page(params[:page])
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      redirect_to(workout_path(@workout))
    else
      redirect_to(new_workout_path, alert: 'Could not start routine.')
    end
  end

  def show
    @routine_types = RoutineType.order(name: :asc)
    @workout = Workout.find(params[:id])
    @workout_sets = @workout.workout_sets.order(number: :asc)
    @workout_set = @workout_sets.last
    @routine = @workout_set.routines.new
  end

  private

  def workout_params
    params.require(:workout).permit(:date)
  end

end
