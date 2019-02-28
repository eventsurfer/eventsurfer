# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :performances, through: :performance_events
end
