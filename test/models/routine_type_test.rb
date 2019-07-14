require 'test_helper'

class RoutineTypeTest < ActiveSupport::TestCase
  test "time_based?" do
    heavy_bag = routine_types(:one)
    bench_press = routine_types(:two)

    assert_equal(true, heavy_bag.time_based?)
    assert_equal(false, bench_press.time_based?)
  end

  test "weight_based?" do
    heavy_bag = routine_types(:one)
    bench_press = routine_types(:two)

    assert_equal(false, heavy_bag.weight_based?)
    assert_equal(true, bench_press.weight_based?)
  end
end
