# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :performance_events
  has_many :performances, through: :performance_events

  validate :validate_start
  validate :validate_start_before_start
  def getLocations(performances)
    tmp_id = []
    performances.each { |per| tmp_id.push(per.id) }
    tmp_loc = []
    tmp_id.each {|id| tmp_loc.push(PerformanceLocation.find(id))}
    return tmp_loc
  end

  def validate_start
    if start.blank?
      errors.add(:start, "muss ein gültiges Datum mit Uhrzeit sein.")
    end
  end

  def validate_start_before_start
    if stop != nil && start > stop
      errors.add(:start, "darf nicht nach Ende liegen.")
    end
  end

end
