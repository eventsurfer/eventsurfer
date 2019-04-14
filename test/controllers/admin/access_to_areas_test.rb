# frozen_string_literal: true

require "test_helper"

class AccessToAreasTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "get access to admin area" do
    get admin_dashboards_path
    assert_redirected_to new_user_session_path
    sign_in create(:admin_user)
    get admin_dashboards_path
    assert_response :success
  end

  test "get access to area without permission" do
    user = [create(:admin_user2), create(:admin_user3)]
    user.each do |u|
      sign_in u
      get costumer_admin_users_path
      assert_response :redirect
      get employer_admin_users_path
      assert_response :redirect
    end
    sign_in user[0]
    get admin_api_clients_path
    assert_response :redirect
    get admin_tickets_path
    assert_response :redirect
    get admin_settings_path
    assert_response :redirect
  end

  test "get costumer view" do
    sign_in create(:admin_user)
    get costumer_admin_users_path
    assert_response :success
  end
  test "get employer view" do
    sign_in create(:admin_user)
    get employer_admin_users_path
    assert_response :success
  end
end
