# frozen_string_literal: true

class PerformanceEvent < ApplicationRecord
  belongs_to :event
  belongs_to :performance

end
