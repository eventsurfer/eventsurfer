# frozen_string_literal: true

require "test_helper"
class TicketsTest < ActiveSupport::TestCase
  setup do
    @ticket = build(:ticket)
    @user = create(:user)
  end

  teardown do
    @user.destroy
  end

  test "use ticket" do
    @ticket.use_ticket(@user.id)
    assert_equal(false, @ticket.valid_)
    assert_equal(DateTime.now.to_date, @ticket.used_at.to_date)
    assert_equal(@user.id, @ticket.changed_by)
  end

  test "create tickets for performance" do
    per = create(:performance)
    Ticket.createTicketsForPerformance(per,@user_id, 20)
    assert_equal 20, PerformanceTicket.where(performance_id: per.id).size
  end

end
