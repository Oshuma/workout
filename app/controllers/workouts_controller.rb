class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.order(date: :asc).page(params[:page])
  end

  def import
  end

  def upload
    unless params[:csv_file].present?
      return redirect_to(import_workouts_path, alert: 'Must provide a .csv file.')
    end

    FileUtils.cp(params[:csv_file].path, Workout::IMPORT_TMP_FILE)
    WorkoutImportJob.perform_later(Workout::IMPORT_TMP_FILE)

    redirect_to root_path, notice: 'Importer running.'
  end

end
