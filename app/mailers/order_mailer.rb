# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)
  default from: "no-reply@eventsurfer.online"

  def entry_order(order)
    @info = DefaultInformation.first
    @groupTickets = []
    @order = Order.find(order.id)
    @performances = Performance.all
    @user = User.find(@order.user_id)
    GroupTicket.where(order_id: order.id).each {|group| @groupTickets.push(group)}
    attachments["order.pdf"] = WickedPdf.new.pdf_from_string(render_to_string(pdf: "order", template: "layouts/pdf/order", layout: "pdf/general.erb"), viewport_size: "1280x1024", page_size: "A4", width: 1280, height: 1024)
    mail(subject: "Your order confirmation", to: @user.email, template_path: "layouts/mailer", template_name: "entry_order")
  end

  def user_have_to_pay(order, user)
    @order = order
    @groupTickets = GroupTicket.where(order_id: order.id)
    @user = user
  end

  def sendTickets(order)
    tmp = []
    @order = order
    @groupTickets = GroupTicket.where(order_id: order.id)
    @tickets = Ticket.getAllOrderedTickets(@groupTickets)
    @tickets.each {|ticket| ticket[1].each {|tick| tmp.push(RQRCode::QRCode.new(tick.validate_id.to_s))}    }
    @qrs = tmp
    @user = User.find(@order.user_id)
    mail(subject: "Your tickets", to: @user.email, template_path: "layouts/mailer", template_name: "sendTickets")
  end
end
