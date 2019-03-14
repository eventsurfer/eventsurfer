# frozen_string_literal: true

class PerformanceLocation < ApplicationRecord
  belongs_to :performance
  belongs_to :location
end
