# frozen_string_literal: true

class PerformanceTicket < ApplicationRecord
  belongs_to :ticket
  belongs_to :performance

  def getAllTicketsOfPerformance(id)
    performanceTicket = PerformanceTicket.where("performance_id=?", id)
    return performanceTicket
  end


end
