class AddMetricToRoutineTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :routine_types, :metric, :integer
  end
end
