class WorkoutImportJob < ApplicationJob
  queue_as :default

  def perform(csv_file_path)
    # TODO: Parse CSV.

    # Delete the tmp file.
    FileUtils.rm(csv_file_path)
  end
end
