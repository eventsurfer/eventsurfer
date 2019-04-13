# frozen_string_literal: true
require "test_helper"

class AccessToAreasTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "get access to admin area without login" do
    get admin_dashboards_path
    assert_redirected_to new_user_session_path
    sign_in create(:admin_user)
    get admin_dashboards_path
    assert_response :success
  end
end
