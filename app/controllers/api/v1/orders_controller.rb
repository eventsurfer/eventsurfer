# frozen_string_literal: true

class Api::V1::OrdersController < Api::V1::BaseController
  # before_action :authenticate_client!

  def show
    respond_to :html, :pdf
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "test.pdf",
               template: "api/v1/orders/show.html.erb",
               layout: "pdf/general",
               page_size: "A4"

      end
    end
  end

  def order
    respond_to :html, :pdf
    @info = DefaultInformation.first
    p GroupTicket.where(order_id: params[:id])
    group = GroupTicket.where(order_id: params[:id]).first
    GroupTicket.where(order_id: params[:id]).each do |group|
      @groupTicket = group
      @user = User.find(Order.find(group.order_id).user_id)
      @perEve = PerformanceEvent.find_by(performance_id: group.performance_id)
      p PerformanceEvent.find_by(performance_id: group.performance_id).event
      # <%= "#{@perEve.event.name}, #{I18n.l(@perEve.performance.start, format: :shortest)}" %>
    end
    @order = Order.find(group.order_id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "order.pdf",
               template: "layouts/pdf/order.html.erb",
               layout: "pdf/general.erb",
               viewport_size: "1280x1024",
               page_size: "A4",
               width: 1280,
               height: 1024
      end
    end
    #end
  end

  def test1
    respond_to :html, :pdf
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "test.pdf", template: "api/v1/orders/test1.html.erb", layout: "pdf/general"
      end
    end
  end

end
