# frozen_string_literal: true

class PerformanceTicket < ApplicationRecord
  has_many :tickets
  has_one :performance

  def getAllTicketOfPerformance(id)
    performanceTicket = PerformanceTicket.where("performances_id=?",id)

  end
end
