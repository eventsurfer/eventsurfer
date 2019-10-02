# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :performance_events
  has_many :performances, through: :performance_events

  def getLocations(performances)
    tmp_id = []
    performances.each { |per| tmp_id.push(per.id) }
    tmp_loc = []
    tmp_id.each {|id| tmp_loc.push(PerformanceLocation.find(id))}
    tmp_loc
  end
end
