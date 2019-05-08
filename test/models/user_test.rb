# frozen_string_literal: true

require "test_helper"
class UserTest < ActiveSupport::TestCase
  test "create user" do
    user = create(:user)
    assert_equal user, User.find(user.id)
  end
end
