# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :performance, through: :perfomance_tickets
  scope :not_valid, -> {where(valid_: false)}
  scope :valid_, -> {where(valid_: true)}


  def use_ticket(user_id)
      self.used_at = DateTime.now
      self.valid_ = false
      self.changed_by = user_id

  end

end
