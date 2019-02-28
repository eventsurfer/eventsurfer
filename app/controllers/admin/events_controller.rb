# frozen_string_literal: true

class Admin::EventsController < ApplicationController
  before_action :authenticate_user!

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
      redirect_to(admin_events_path)
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
      redirect_to(admin_events_path)
    else
      flash[:danger] = "Something went wrong"
      # redirect_to(edit_admin_event_path(params[:id]))
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if (@event.destroy)
      flash[:success] = "Event was destroyed successful"
      redirect_to admin_events_path
    else
      flash[:danger] = "Something went wrong "
    end
  end

  def show
    @event = Event.find(params[:id])
    @performances = PerformanceEvent.find_by(event_id: params[:id])
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
