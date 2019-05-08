# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :performance_ticket
  has_one :performance, through: :performance_ticket
  scope :not_valid, -> {where(valid_: false)}
  scope :valid_, -> {where(valid_: true)}


  def use_ticket(user_id)
    self.used_at = DateTime.now
    p DateTime.now
    self.valid_ = false
    self.changed_by = user_id
  end

  def self.generateValidateId
    validate_id = SecureRandom.urlsafe_base64(32)
  end

  def self.createTicketsForPerformance(performance, user_id, numberTickets)
    numberTickets.times do
      tmpTicket = Ticket.create(validate_id: Ticket.generateValidateId, valid_: true, changed_by: user_id)
      tmpTicket.validate_id += "D" + tmpTicket.id.to_s
      if tmpTicket.save
        PerformanceTicket.create(performance_id: performance.id, ticket_id: tmpTicket.id)
      else
        return "sth went wrong"
      end
    end
  end

  def self.getAllOrderedTickets(groupTickets)
    back = {}
    groupTickets.each do |g|
      back[g.id] = Ticket.where(group_id: g.id)
    end
    return back
  end

end
