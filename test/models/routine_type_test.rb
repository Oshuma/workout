require 'test_helper'

class RoutineTypeTest < ActiveSupport::TestCase
  test "distance_based?" do
    heavy_bag = routine_types(:heavy_bag)
    treadmill = routine_types(:treadmill)

    assert_equal(true, treadmill.distance_based?)
    assert_equal(false, heavy_bag.distance_based?)
  end

  test "time_based?" do
    heavy_bag = routine_types(:heavy_bag)
    bench_press = routine_types(:bench_press)

    assert_equal(true, heavy_bag.time_based?)
    assert_equal(false, bench_press.time_based?)
  end

  test "weight_based?" do
    heavy_bag = routine_types(:heavy_bag)
    bench_press = routine_types(:bench_press)

    assert_equal(false, heavy_bag.weight_based?)
    assert_equal(true, bench_press.weight_based?)
  end
end
