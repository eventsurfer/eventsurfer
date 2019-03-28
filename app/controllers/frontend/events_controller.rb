# frozen_string_literal: true

class Frontend::EventsController < ApplicationController
  def index # TODO: featured events(admin choosed top idk 6(?) events)
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @performances = PerformanceEvent.where(event_id: params[:id])
    @locations = PerformanceLocation.all
    @tickets = PerformanceTicket.all
  end
end
