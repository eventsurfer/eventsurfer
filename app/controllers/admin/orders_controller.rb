# frozen_string_literal: true

class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  before_action :checkPermission!
  layout "adminDash"

  def index
    @groupeTicket = GroupTicket.all
    @orders = Order.all
    @paid = Order.paid_grouped
    @unpaid = Order.unpaid_grouped
    @user = User.all
  end

  def show
    @order = Order.find(params[:id])
    @groupTickets = GroupTicket.where(order_id: @order.id)
    @performances = Performance.all
    @user = User.find(@order.user_id)
  end

  def destroy
    @order = Order.find(params[:id])
    @groupeTicket = GroupTicket.where(order_id: params[:id])
    if @groupeTicket.each {|order| order.destroy} && @order.destroy
      flash[:success] = "Order was destroyed successfull"
      redirect_to admin_orders_path
    end
  end

  def setPaid
    @order = Order.find(params[:id])
    @order.setPaid(current_user)
    OrderMailer.sendTickets(@order).deliver
    redirect_to admin_orders_path
  end

  def setUnPaid
    @order = Order.find(params[:id])
    @order.setUnPaid(current_user)
    redirect_to admin_orders_path
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
