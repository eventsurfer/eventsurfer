# frozen_string_literal: true

class PerformanceTicket < ApplicationRecord
  has_many :tickets
  has_one :performance
end
