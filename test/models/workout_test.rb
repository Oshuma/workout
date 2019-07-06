require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  test "should create a new WorkoutSet on new record" do
    workout = Workout.create(date: Date.today)
    assert(workout.workout_sets.present?)
  end

  test "new_set! creates a new incremental WorkoutSet" do
    workout = Workout.create(date: Date.today)
    assert_equal(1, workout.workout_sets.count)
    assert_equal('1', workout.workout_sets.order(number: :asc).last.number)

    assert(workout.new_set!)
    assert_equal(2, workout.workout_sets.count)
    assert_equal('2', workout.workout_sets.order(number: :asc).last.number)
  end
end
