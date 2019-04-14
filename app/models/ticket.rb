# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :performance, through: :perfomance_tickets
  scope :not_valid, -> {where(valid_: false)}
  scope :valid_, -> {where(valid_: true)}


  def use_ticket(user_id)
    self.used_at = DateTime.now
    p DateTime.now
    self.valid_ = false
    self.changed_by = user_id
  end

  def self.createTicketsForPerformance(performance, user_id, numberTickets)
    numberTickets.times do
      tmpTicket = Ticket.create(validate_id: "fffggg", valid_: false, changed_by: user_id) # TODO: create validate_id algo
      PerformanceTicket.create(performances_id: performance.id, tickets_id: tmpTicket.id)
    end
  end

end
