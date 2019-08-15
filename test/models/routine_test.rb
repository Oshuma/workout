require 'test_helper'

class RoutineTest < ActiveSupport::TestCase
  test "ensure at least one metric" do
    routine = routines(:one)
    routine.lbs = nil
    routine.reps = nil
    routine.minutes = nil
    routine.distance = nil

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

  test ".previous_lbs" do
    workout = workouts(:one)
    user = workout.user
    routine_type = routine_types(:bench_press)
    attrs = {
      routine_type: routine_type,
      workout: workout,
      set_number: 1,
      lbs: 10,
      reps: 10,
    }
    prev = Routine.create!(attrs)

    assert_equal(prev, user.routines.previous_lbs(routine_type))
  end

  test ".previous_reps" do
    workout = workouts(:one)
    user = workout.user
    routine_type = routine_types(:bench_press)
    attrs = {
      routine_type: routine_type,
      workout: workout,
      set_number: 1,
      lbs: 10,
      reps: 10,
    }
    prev = Routine.create!(attrs)

    assert_equal(prev, user.routines.previous_reps(routine_type))
  end

  test ".previous_minutes" do
    workout = workouts(:one)
    user = workout.user
    routine_type = routine_types(:heavy_bag)
    attrs = {
      routine_type: routine_type,
      workout: workout,
      set_number: 1,
      minutes: 10,
    }
    prev = Routine.create!(attrs)

    assert_equal(prev, user.routines.previous_minutes(routine_type))
  end

  test ".previous_distance" do
    workout = workouts(:one)
    user = workout.user
    routine_type = routine_types(:treadmill)
    attrs = {
      routine_type: routine_type,
      workout: workout,
      set_number: 1,
      minutes: 10,
      distance: 0.5
    }
    prev = Routine.create!(attrs)

    assert_equal(prev, user.routines.previous_distance(routine_type))
  end
end
