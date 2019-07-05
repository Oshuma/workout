class CreateWorkoutSets < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_sets do |t|
      t.references :workout, foreign_key: true
      t.string :number

      t.timestamps
    end
  end
end
