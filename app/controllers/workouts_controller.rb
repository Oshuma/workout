class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.order(date: :desc).page(params[:page])
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
  end

  def destroy
    @workout = Workout.find(params[:id])

    if @workout.destroy
      redirect_to(root_path, notice: "Workout #{@workout.date} deleted.")
    else
      redirect_to(root_path, alert: 'Could not delete workout.')
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:date)
  end

end
