# frozen_string_literal: true

require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "shouldn't sign in" do
    # post "/api/v1/users/sign_in", params: {}
    # assert_response :bad_request
  end
end
