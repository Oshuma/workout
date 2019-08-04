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

  test "ensure lbs has reps" do
    routine = routines(:one)
    routine.minutes = nil  # only applies to weight based routines

    routine.lbs = 10
    routine.reps = nil

    assert_raises ActiveRecord::RecordInvalid do
      routine.save!
    end

    assert_not_empty(routine.errors[:base])
  end

  test "ensure reps has lbs" do
    routine = routines(:one)
    routine.minutes = nil  # only applies to weight based routines

    routine.lbs = nil
    routine.reps = 5

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
