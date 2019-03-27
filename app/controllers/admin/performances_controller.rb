# frozen_string_literal: true

class Admin::PerformancesController < ApplicationController
  before_action :authenticate_user!
  layout "adminDash"

  def index
    @performances = Performance.all
  end

  def new
    @performance = Performance.new
  end

  def create
    @performance = Performance.new(performance_params)
    @locations = Location.getLocationsNames
    if @performance.save
      redirect_to(admin_event_path(session[:tmp_event_id]))
    else
      render :new
    end
  end

  def edit
    @performance = Performance.find(params[:id])
  end

  def update
    @performance = Performance.find(params[:id])
    if @performance.update(performance_params)
      flash[:success] = "performances was edited successful"
      redirect_to(admin_event_path(session[:tmp_event_id]))
    else
      flash[:danger] = "Something went wrong"
      # redirect_to(edit_admin_performance_path(params[:id]))
    end
  end

  def destroy
    @performance = Performance.find(params[:id])
    if @performance.destroy
      flash[:success] = "performances was destroyed successful"
      redirect_to admin_performances_path
    else
      flash[:danger] = "Something went wrong "
    end
  end

  def show
    @performance = Performance.find(params[:id])
  end

  private
    begin
      def performance_params
        params.require(:performance).permit(:start,
                                             :stop,
                                             :prize,
                                             :sell_allowed,
                                             :stop_selling,
                                             :number_of_tickets,
                                             :location
        )
      end
    end
end
