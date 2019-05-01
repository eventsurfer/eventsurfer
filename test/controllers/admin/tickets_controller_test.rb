# frozen_string_literal: true

require "test_helper"
class TicketsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @admin_user = create(:admin_user)
  end


  test "get index" do
    sign_in @admin_user
    get admin_tickets_path
    assert_response :success
  end

  test "get view of one ticket" do
    sign_in @admin_user
    ticket = create(:ticket)
    get admin_ticket_path(ticket.id)
    assert_response :success
  end

end
