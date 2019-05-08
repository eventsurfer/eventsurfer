# frozen_string_literal: true

require "test_helper"
class OrderTest < ActiveSupport::TestCase
  test "setPaid" do
    user = create(:user)
    order = create(:unpaid)
    order.setPaid(user)
    assert_equal true, Order.paid.include?(order)
    assert_equal user.id, order.changed_by
    assert_equal false, Order.unpaid.include?(order)
  end

  test "setUnPaid" do
    user = create(:user)
    order = create(:paid)
    order.setUnPaid(user)
    assert_equal false, Order.paid.include?(order)
    assert_equal user.id, order.changed_by
    assert_equal true, Order.unpaid.include?(order)
  end

end
