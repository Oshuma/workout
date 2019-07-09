class AddUserIdToRoutineTypes < ActiveRecord::Migration[5.2]
  def change
    add_reference :routine_types, :user, foreign_key: true
  end
end
