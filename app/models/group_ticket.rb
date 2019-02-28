# frozen_string_literal: true

class GroupTicket < ApplicationRecord
  has_one :order
  has_many :tickets
end
