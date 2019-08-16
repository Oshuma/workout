class RoutineTypesController < ApplicationController

  before_action :set_routine_type, only: [:show, :edit, :update, :destroy]

  def index
    @routine_types = current_user.routine_types.order(name: :asc)
  end

  def new
    @routine_type = current_user.routine_types.new
  end

  def create
    @routine_type = current_user.routine_types.new(routine_type_params)

    if @routine_type.save
      if params[:workout_id].present?
        redirect_to workout_path(params[:workout_id], routine_type_id: @routine_type.id)
      else
        redirect_to routine_types_path, notice: 'Routine type saved.'
      end
    else
      redirect_back(fallback_location: root_path, alert: @routine_type.errors.full_messages.to_sentence)
    end
  end

  def show
    @weight_progression = []
    @reps_progression = []
    @minutes_progression = []
    @distance_progression = []

    @routine_type.routines.date_range(graph_date_range).order(created_at: :asc).includes(:workout).each do |routine|
      @weight_progression << [routine.created_at.to_formatted_s(:graph_date_and_time), routine.lbs]
      @reps_progression << [routine.created_at.to_formatted_s(:graph_date_and_time), routine.reps]
      @minutes_progression << [routine.created_at.to_formatted_s(:graph_date_and_time), routine.minutes]
      @distance_progression << [routine.created_at.to_formatted_s(:graph_date_and_time), routine.distance]
    end

    @set_progression = []
    current_user.workouts.date_range(graph_date_range).order_by_entry.reverse_order.includes(:routines).where(routines: { routine_type_id: @routine_type.id }).each do |workout|
      @set_progression << [workout.created_at.to_formatted_s(:graph_date_and_time), workout.routines.maximum(:set_number)]
    end
  end

  def edit
  end

  def update
    if @routine_type.update(routine_type_params)
      redirect_to(routine_types_path, notice: 'Routine type updated.')
    else
      redirect_to(routine_types_path, alert: 'Could not update routine type.')
    end
  end

  def destroy
    if @routine_type.destroy
      redirect_to(routine_types_path, notice: 'Routine type deleted.')
    else
      redirect_to(routine_types_path, alert: @routine_type.errors.full_messages.to_sentence)
    end
  end

  private

  def routine_type_params
    params.require(:routine_type).permit(:name, :rest_time, :set_time, :metric)
  end

  def set_routine_type
    @routine_type = current_user.routine_types.find(params[:id])
  end

end
