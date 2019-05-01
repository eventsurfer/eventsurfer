# frozen_string_literal: true

class Order < ApplicationRecord
  has_one :group_ticket
  has_one :user
  scope :paid, -> {where(paid: true)}
  scope :unpaid, -> {where(paid: false, paid: nil)}

end
