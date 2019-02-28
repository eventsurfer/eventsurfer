# frozen_string_literal: true

class PerformanceLocation < ApplicationRecord
  has_many :performances
  has_one :location
end
