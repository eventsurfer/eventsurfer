# frozen_string_literal: true

require "test_helper"
class SettingTest < ActiveSupport::TestCase
  test "get mail addresses" do
    Setting.create(key: "MAILTO", value: "example@example.com")
    assert_equal "example@example.com", Setting.getMailAddresses[0]
  end

  test "get payment info" do
    Setting.create(key: "PAYMENT_INFO", value: "some funny payment_infos")
    assert_equal "somefunnypayment_infos", Setting.getPaymentInfo.first
  end

  test "empty settings" do
    assert_equal "root@localhost", Setting.getMailAddresses
    assert_equal "no configuration was set", Setting.getPaymentInfo
  end

end
