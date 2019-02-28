# frozen_string_literal: true

class Performance < ApplicationRecord
  has_one :event, through: :performance_events
  has_many :tickets
end
