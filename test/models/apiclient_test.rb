# frozen_string_literal: true

require "test_helper"
class ApiClientTest < ActiveSupport::TestCase
  test "check api key" do
    api = ApiClient.create(name: "testtest")
    api.generate_auth_key
    api.auth_key = "testtest"
    assert_equal true, api.authenticate("testtest")
    assert_equal false, api.authenticate("...")
  end

end
