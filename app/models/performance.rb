# frozen_string_literal: true

class Performance < ApplicationRecord
  has_one :performance_location
  has_one :performance_event
  has_many :performance_tickets
  has_many :carts, through: :performance_carts
  has_one :event, through: :performance_event
  has_many :tickets, through: :performance_tickets

  has_one :location, through: :performance_location
end
