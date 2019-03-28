# frozen_string_literal: true

class Performance < ApplicationRecord
  has_one :performance_location
  has_one :event
  has_many :tickets
  has_one :event, through: :performance_events
  has_many :tickets, through: :performance_tickets

  has_one :location, through: :performance_location
end
