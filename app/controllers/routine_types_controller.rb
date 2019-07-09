class RoutineTypesController < ApplicationController

  def index
    @routine_types = current_user.routine_types.order(name: :asc)
  end

  def new
    @routine_type = current_user.routine_types.new
  end

  def create
    @routine_type = current_user.routine_types.new(routine_type_params)

    if @routine_type.save
      redirect_to workout_path(params[:workout_id], routine_type_id: @routine_type.id)
    else
      redirect_back(fallback_location: root_path, alert: @routine_type.errors.full_messages.to_sentence)
    end
  end

  def edit
    @routine_type = current_user.routine_types.find(params[:id])
  end

  def update
    @routine_type = current_user.routine_types.find(params[:id])

    if @routine_type.update(routine_type_params)
      redirect_to(routine_types_path, notice: 'Routine type updated.')
    else
      redirect_to(routine_types_path, alert: 'Could not update routine type.')
    end
  end

  def destroy
    @routine_type = current_user.routine_types.find(params[:id])

    if @routine_type.destroy
      redirect_to(routine_types_path, notice: 'Routine type deleted.')
    else
      redirect_to(routine_types_path, alert: @routine_type.errors.full_messages.to_sentence)
    end
  end

  private

  def routine_type_params
    params.require(:routine_type).permit(:name)
  end

end
