# frozen_string_literal: true

require "test_helper"

class SettingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = create(:admin_user)
    sign_in @user
  end
  test "get index" do
    get admin_settings_path
    assert_response :success
  end
end
