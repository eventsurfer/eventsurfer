# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :performance, through: :perfomance_tickets
  scope :old, ->{ where(valid: false)}
end
