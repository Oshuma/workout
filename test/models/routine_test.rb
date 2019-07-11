require 'test_helper'

class RoutineTest < ActiveSupport::TestCase
  test "ensure at least one metric" do
    routine = routines(:one)
    routine.lbs = nil
    routine.reps = nil
    routine.minutes = nil

    assert_raises ActiveRecord::RecordInvalid do
      routine.save!
    end

    assert_not_empty(routine.errors[:base])
  end

  test "#full_title returns an expected value" do
    routine = routines(:one)

    title = [
      routine.workout.date,
      routine.routine_type.name,
      routine.set_number
    ].join(' / ')

    assert_equal(title, routine.full_title)
  end
end
