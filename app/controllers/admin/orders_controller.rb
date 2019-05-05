# frozen_string_literal: true

class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  before_action :checkPermission!
  layout "adminDash"

  def index
    @groupeTicket = GroupTicket.all
    @orders = Order.all
    @paid = Order.paid
    @unpaid = Order.unpaid
    @user = User.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def getDetailedInfo
    @order = Order.find(params[:id])
    @groupTickets = GroupTicket.where(order_id: @order.id)
  end

  def destroy
    @groupeTicket = GroupTicket.where(order_id: params[:id])
    if @groupeTicket.destroy
      flash[:success] = "Order was destroyed successfull"
      redirect_to admin_orders_path
    end
  end


  private

  begin
    def api_client_params
      params.require(:order).permit()
    end

    def checkPermission!
      if current_user.rank >= 2

      else
        redirect_to admin_dashboards_path
      end
    end
  end
end