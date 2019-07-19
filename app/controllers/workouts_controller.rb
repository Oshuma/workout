class WorkoutsController < ApplicationController

  before_action :set_workout, only: [:show, :destroy]

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
    @previous_workout = @workout.previous
  end

  def destroy
    if @workout.destroy
      redirect_to(root_path, notice: "Workout #{@workout.date} deleted.")
    else
      redirect_to(root_path, alert: 'Could not delete workout.')
    end
  end

  def graphs
    @routine_count = []
    routine_data = {}
    current_user.workouts.order_by_entry.each do |workout|
      routine_data[workout.date] ||= 0
      routine_data[workout.date] += workout.routines.count
      @routine_count << [workout.date.to_formatted_s(:graph_date), routine_data[workout.date]]
    end

    @routine_types = []
    current_user.routine_types.each do |routine_type|
      @routine_types << [routine_type.name, routine_type.routines.count]
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:date)
  end

  def set_workout
    @workout = current_user.workouts.find(params[:id])
  end

end
