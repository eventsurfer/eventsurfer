# frozen_string_literal: true

class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  layout "adminDash"

  def index
    @events = Event.all
    @event_performances = PerformanceEvent.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      session[:tmp_event_id] = @event.id
      redirect_to(admin_event_path(@event.id))
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if (@event.update(event_params))
      flash[:success] = "Event was edited successful"
      session[:tmp_event_id] = @event.id
      redirect_to(admin_event_path(@event.id))
    else
      flash[:danger] = "Something went wrong"
      # redirect_to(edit_admin_event_path(params[:id]))
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if (@event.destroy)
      flash[:success] = "Event was destroyed successful"
      redirect_to admin_event_path
    else
      flash[:danger] = "Something went wrong "
    end
  end

  def show
    @event = Event.find(params[:id])
    session[:tmp_event_id] = @event.id
    @performances = PerformanceEvent.where(event_id: params[:id])
    @locationsPerformance = @event.getLocations(@performances)
  end

  private

    begin
      def event_params
        params.require(:event).permit(:start,
                                      :stop,
                                      :description,
                                      :name,
                                      :hoster_name,
                                      :website,
                                      :prize,
                                      :hotline
        )
      end
    end
end
