# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)
  default from: "eventsurfer"

  def entry_order(order, user)
    @group_ticket = Order.find(order.id)
    @groupTicket = GroupTicket.where(order_id: order.id)
    @user = User.find(order.user_id)
    mail(subject: "Your order confirmation", to: user.email, template_path: "layouts/mailer", template_name: "entry_order")
  end

  def user_have_to_pay(order, user)
    @order = order
    @groupTickets = GroupTicket.where(order_id: order.id)
    @user = user
  end
end
