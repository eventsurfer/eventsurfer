# frozen_string_literal: true

class Admin::TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  before_action :checkPermission!
  layout "adminDash"
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.changed_by = current_user.id
    if @ticket.save
      redirect_to(admin_tickets_path)
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    if (@ticket.destroy)
      flash[:success] = "Ticket was deleted successful"
      redirect_to(admin_tickets_path)
    else
      flash[:danger] = "Something went wrong"
    end
  end

  def update
    @ticket = Ticket.find(params[:id])
    if (@ticket.update(ticket_params))
      flash[:success] = "Ticket was edited successful"
      redirect_to(admin_tickets_path)
    else
      flash[:danger] = "Something went wrong"
      # redirect_to(edit_admin_location_path(params[:id]))
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    if (@ticket.destroy)
      redirect_to(admin_tickets_path)
    end
  end


  private

    begin
      def ticket_params
        params.require(:ticket).permit(

        )
      end
      def checkPermission!
        if current_user.rank >= 4

        else
          redirect_to admin_dashboards_path
        end
      end
    end
end
