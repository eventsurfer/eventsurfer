# frozen_string_literal: true

class PerformanceCart < ApplicationRecord
  has_one :cart
  has_many :performances
end
