class WorkoutsController < ApplicationController

  def index
    @workouts = current_user.workouts.order_by_entry.page(params[:page])
  end

  def new
    @workout = current_user.workouts.new
  end

  def create
    @workout = current_user.workouts.new(workout_params)

    if @workout.save
      redirect_to(workout_path(@workout))
    else
      redirect_to(new_workout_path, alert: 'Could not start routine.')
    end
  end

  def show
    @routine_types = current_user.routine_types.order(name: :asc)
    @workout = current_user.workouts.find(params[:id])
  end

  def destroy
    @workout = current_user.workouts.find(params[:id])

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
