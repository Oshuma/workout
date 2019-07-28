class AddRestTimeToRoutineTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :routine_types, :rest_time, :integer, default: 30
  end
end
