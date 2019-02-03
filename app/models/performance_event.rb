# frozen_string_literal: true

class PerformanceEvent < ApplicationRecord
  has_one :event
  has_many :performances

end
