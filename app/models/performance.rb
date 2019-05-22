# frozen_string_literal: true

class Performance < ApplicationRecord
  has_one :performance_location
  has_one :performance_event
  has_many :performance_tickets
  has_many :carts, through: :performance_carts
  has_one :event, through: :performance_event
  has_many :tickets, through: :performance_tickets

  has_one :location, through: :performance_location

  validate :validate_start_before_start
  validate :validate_start
  validate :validate_start_with_event

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

  def validate_performanceDate_with_eventDate
    unless event.start <= start && stop <= event.stop
      errors.add(:start, "Performance datum außerhalb des eventzeitraums")
    end
  end
end
