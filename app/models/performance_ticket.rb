# frozen_string_literal: true

class PerformanceTicket < ApplicationRecord
  has_many :tickets
  has_one :performance

  def getAllTicketsOfPerformance(id)
    performanceTicket = PerformanceTicket.where("performances_id=?", id)
    return performanceTicket
  end


end
