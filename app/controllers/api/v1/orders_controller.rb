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
    @groupTickets = []
    @order = Order.find(params[:id])
    @performances = Performance.all
    @user = User.find(@order.user_id)
    GroupTicket.where(order_id: params[:id]).each do |group|
      @groupTickets.push(group)
    end

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
