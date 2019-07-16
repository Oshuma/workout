require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  test "previous" do
    current = workouts(:two)
    previous = workouts(:one)
    assert_equal(previous, current.previous)
  end

  test "previous called on first record" do
    current = workouts(:one)
    assert_nil(current.previous)
  end
end
