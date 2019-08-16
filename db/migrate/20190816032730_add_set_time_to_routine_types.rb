class AddSetTimeToRoutineTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :routine_types, :set_time, :integer
  end
end
