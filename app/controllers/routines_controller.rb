class RoutinesController < ApplicationController

  def create
    @routine = Routine.new(routine_params)

    if @routine.save
      if params[:new_set]
        redirect_to workout_path(@routine.workout, routine_type_id: @routine.routine_type_id, set_number: @routine.set_number + 1)
      else
        redirect_to workout_path(@routine.workout)
      end
    else
      redirect_back(fallback_location: root_path, alert: @routine.errors.full_messages.to_sentence)
    end
  end

  def edit
    @routine_types = RoutineType.order(name: :asc)
    @routine = Routine.find(params[:id])
  end

  def update
    @routine = Routine.find(params[:id])

    if @routine.update(routine_params)
      redirect_to(workout_path(@routine.workout))
    else
      redirect_to(workout_path(@routine.workout, alert: 'Could not update routine.'))
    end
  end

  def destroy
    @routine = Routine.find(params[:id])

    if @routine.destroy
      redirect_to(workout_path(@routine.workout))
    else
      redirect_to(workout_path(@routine.workout, alert: 'Could not delete routine.'))
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:routine_type_id, :workout_id, :set_number, :lbs, :reps, :minutes)
  end

end
