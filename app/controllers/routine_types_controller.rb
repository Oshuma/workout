class RoutineTypesController < ApplicationController

  def new
    @routine_type = RoutineType.new
  end

  def create
    @routine_type = RoutineType.new(routine_type_params)

    if @routine_type.save
      redirect_to workout_path(params[:workout_id], routine_type_id: @routine_type.id)
    else
      redirect_back(fallback_location: root_path, alert: @routine_type.errors.full_messages.to_sentence)
    end
  end

  private

  def routine_type_params
    params.require(:routine_type).permit(:name)
  end

end
