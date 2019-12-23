require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "ensure Settings created with new User" do
    user = User.new(email: 'test@example.com', password: 'Foobar123')
    assert(user.save)
    assert_not_nil(user.settings)
  end
end
