class CreateRoutines < ActiveRecord::Migration[5.2]
  def change
    create_table :routines do |t|
      t.references :workout_set, foreign_key: true
      t.string :name
      t.string :lbs
      t.string :reps

      t.timestamps
    end
  end
end
