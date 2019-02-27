# frozen_string_literal: true

class Performance < ApplicationRecord
  has_one :event
  has_many :tickets, through: :perfomance_tickets
end
