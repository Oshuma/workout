class AddDistanceToRoutines < ActiveRecord::Migration[5.2]
  def change
    add_column :routines, :distance, :float
  end
end
