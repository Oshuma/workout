class WorkoutsController < ApplicationController

  before_action :set_workout, only: [:show, :destroy]

  def index
    start_date = params[:start_date].present? ? Date.parse(params[:start_date]).beginning_of_month : Date.today.beginning_of_month
    end_date = start_date.end_of_month

    @workouts = current_user.workouts.order_by_entry.where(date: start_date..end_date)
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
    if params[:routine_type_id].present?
      @routine_type = current_user.routine_types.find(params[:routine_type_id])
    end
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
    current_user.workouts.date_range(graph_date_range).order_by_entry.reverse_order.each do |workout|
      routine_data[workout.date] ||= 0
      routine_data[workout.date] += workout.routines.count
      if routine_data[workout.date] > 0
        @routine_count << [workout.date.strftime("%D"), routine_data[workout.date]]
      end
    end

    @routine_types = []
    @routine_types_weight = []
    @routine_types_time = []
    @routine_types_distance = []
    current_user.routine_types.order(name: :asc).each do |routine_type|
      @routine_types << [routine_type.name, routine_type.routines.count]

      if routine_type.metric_weight?
        data = routine_type.routines.date_range(graph_date_range).group_by_day(:created_at, format: "%D").count
          .reject { |date, value| value == 0 }

        @routine_types_weight << { name: routine_type.name, data: data }
      end

      if routine_type.metric_time?
        data = routine_type.routines.date_range(graph_date_range).group_by_day(:created_at, format: "%D").count
        @routine_types_time << { name: routine_type.name, data: data }
      end

      if routine_type.metric_distance?
        data = routine_type.routines.date_range(graph_date_range).group_by_day(:created_at, format: "%D").count
        @routine_types_distance << { name: routine_type.name, data: data }
      end
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
