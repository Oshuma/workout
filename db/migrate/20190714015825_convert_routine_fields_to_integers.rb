class ConvertRoutineFieldsToIntegers < ActiveRecord::Migration[5.2]
  def up
    add_column :routines, :lbs_tmp, :integer
    add_column :routines, :reps_tmp, :integer
    add_column :routines, :minutes_tmp, :integer

    Routine.find_each do |routine|
      routine.lbs_tmp = (routine.lbs.to_i == 0 ? nil : routine.lbs.to_i)
      routine.reps_tmp = (routine.reps.to_i == 0 ? nil : routine.reps.to_i)
      routine.minutes_tmp = (routine.minutes.to_i == 0 ? nil : routine.minutes.to_i)
      routine.save!
    end

    remove_column :routines, :lbs
    remove_column :routines, :reps
    remove_column :routines, :minutes

    rename_column :routines, :lbs_tmp, :lbs
    rename_column :routines, :reps_tmp, :reps
    rename_column :routines, :minutes_tmp, :minutes
  end

  def down
    change_column :routines, :lbs, :string
    change_column :routines, :reps, :string
    change_column :routines, :minutes, :string
  end
end
